import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sigaamobile/consts/request_state.dart';
import 'package:sigaamobile/controllers/user_controller.dart';
import 'package:sigaamobile/index.dart';
import 'package:sigaamobile/screens/home/home_screen.dart';
import 'package:sigaamobile/screens/login/login_screen.dart';
import 'package:sigaamobile/shared/logo.dart';

import '../../shared/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _userController = GetIt.I.get<UserController>();
  ReactionDisposer _listener;

  @override
  void initState() {
    _listener = autorun((_) {
      switch (_userController.stateLogin) {
        case RequestState.SUCCESS:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case RequestState.ERROR:
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          });
          break;
        default:
      }
    });
    _userController.recoverUser();
    super.initState();
  }

  @override
  void dispose() {
    _listener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: sigaaLogo(),
      ),
    );
  }
}
