import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/home/home_screen.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/shared/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _userController = GetIt.I.get<UserController>();

  @override
  void initState() {
    _userController.recoverUser().then((isSuccess) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => isSuccess ? HomeScreen() : LoginScreen(),
              settings: RouteSettings(isInitialRoute: true)));
    }).catchError((e) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen(),
                settings: RouteSettings(isInitialRoute: true)));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HomeScreen(),
      ),
    );
  }
}
