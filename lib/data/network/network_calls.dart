import 'package:alison_task/core/functions/navigation.dart';
import 'package:alison_task/data/local/shared_prefrence.dart';
import 'package:alison_task/view/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<void> loginUser(
      BuildContext context, String emailOrPhone, String password) async {
    const String url = 'https://swan.alisonsnewdemo.online/api/login';

    try {
      final response = await _dio.post(
        url,
        queryParameters: {
          'email_phone': emailOrPhone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
          await LocalSharedPrefrence.instance
              .setToken(data['customerdata']['token']);

          navigateMeReplace(context: context, screen: const HomeScreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${data['message']}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server Error: ${response.statusCode}')),
        );
      }
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout) {
        _showError(context,
            'Connection timeout, please check your internet connection.');
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        _showError(context, 'Server is taking too long to respond.');
      } else if (dioError.type == DioExceptionType.badResponse) {
        _showError(context, 'Invalid login credentials. Please try again.');
      } else {
        _showError(context, 'Something went wrong, please try again.');
      }
    } catch (error) {
      _showError(context, 'An unexpected error occurred: $error');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
