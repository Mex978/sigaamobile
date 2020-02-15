import 'package:flutter/material.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/home/home_screen.dart';
import 'package:sigaamobile/shared/logo.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (context) => HomeScreen()));
    });

    return Scaffold(
      body: Center(
        child: sigaaLogo(),
      ),
    );
  }
}
