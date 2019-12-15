import 'package:flutter/material.dart';
import 'package:sigaamobile/app/modules/login/login_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigaa Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginModule(),
    );
  }
}
