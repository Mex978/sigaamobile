import 'package:flutter/material.dart';

sigaaLogo() {
  return Hero(
    tag: "logo",
    child: Text(
      "SIGAA MOBILE",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(24, 41, 129, 1),
      ),
    ),
  );
}
