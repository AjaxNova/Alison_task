import 'package:alison_task/controller/home_controller.dart';
import 'package:alison_task/core/functions/navigation.dart';
import 'package:alison_task/data/local/shared_prefrence.dart';
import 'package:alison_task/view/home_screen.dart';
import 'package:alison_task/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSharedPrefrence.instance.initLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  validateUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    final val = LocalSharedPrefrence.instance.getToken();
    if (val == null) {
      navigateMeReplace(context: context, screen: const LoginPage());
    } else {
      navigateMeReplace(context: context, screen: const HomeScreen());
    }
  }

  @override
  void initState() {
    validateUser(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Swaan"),
      ),
    );
  }
}
