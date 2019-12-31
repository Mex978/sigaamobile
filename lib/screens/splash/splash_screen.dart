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

    // final LoginBloc _loginBloc = BlocProvider.getBloc<LoginBloc>();
    // final _user = _loginBloc.getUser;

    BlocProvider.getBloc<LoginBloc>().recoverUser().then((isSuccess) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => isSuccess ? HomeScreen() : LoginScreen()));
      // BlocProvider.getBloc<HomeBloc>().stayLogged();
    }).catchError((e) {
      print(e);
    });

    return Scaffold(
      body: Center(
        child: sigaaLogo(),
      ),
    );
  }
}
