import 'package:flutter/material.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/home/home_screen.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/shared/logo.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));

    BlocProvider.getBloc<LoginBloc>().recoverUser().then((isSuccess) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                settings: RouteSettings(isInitialRoute: true),
                builder: (context) =>
                    isSuccess ? HomeScreen() : LoginScreen()));
      });
    });

    return Scaffold(
      body: Center(
        child: sigaaLogo(),
      ),
    );
  }
}
