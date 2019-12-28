import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:sigaamobile/screens/home/home_bloc.dart';
import 'package:sigaamobile/screens/login/login_bloc.dart';
import 'package:sigaamobile/screens/splash/splash_screen.dart';
import 'package:sigaamobile/services/api_repository.dart';

void main() => runApp(BlocProvider(
      blocs: [Bloc((i) => LoginBloc()), Bloc((i) => HomeBloc())],
      dependencies: [Dependency((i) => ApiRepository())],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Open Sans",
            backgroundColor: Color.fromRGBO(250, 250, 250, 1)),
        home: SplashScreen(),
      ),
    ));
