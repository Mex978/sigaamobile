import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/home/home_screen.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/shared/logo.dart';

class SplashScreen extends StatelessWidget {
  final _userController = GetIt.I.get<UserController>();
  @override
  Widget build(BuildContext context) {
    _userController.recoverUser().then((isSuccess) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => isSuccess ? HomeScreen() : LoginScreen()));
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  _userController.user == null ? LoginScreen() : HomeScreen()));
    });

    return Scaffold(
      body: Center(
        child: sigaaLogo(),
      ),
    );
  }
}
