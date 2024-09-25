import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPrefrence {
  LocalSharedPrefrence._();

  static final _instance = LocalSharedPrefrence._();

  static LocalSharedPrefrence get instance => _instance;
  late SharedPreferences sharedPref;

  initLocalStorage() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  String? getToken() {
    return sharedPref.getString('token');
  }

  setToken(String token) async {
    await sharedPref.setString('token', token);
  }

  deleteToken() async {
    await sharedPref.remove('token');
  }
}
