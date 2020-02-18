import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/home/home_screen.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/shared/logo.dart';

class SplashScreen extends StatelessWidget {
  final _user = GetIt.I.get<UserController>();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (context) =>
                  _user.user != null ? HomeScreen() : LoginScreen()));
    });

    return Scaffold(
      body: Center(
        child: sigaaLogo(),
      ),
    );
  }
}
