import 'package:flutter/material.dart';

themeDefault() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: Color(0xFF152F94)),

      ///Transição de telas
      // pageTransitionsTheme: PageTransitionsTheme(builders: {
      //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      // }),

      ///Tema para TextFiled
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 0, 0, 0.56), width: 1))),
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      primaryColor: Color.fromRGBO(24, 41, 129, 1),
      cursorColor: Color.fromRGBO(24, 41, 129, 1),

      ///Tema de texto
      fontFamily: "Open Sans",
      textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          button: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),

      ///Tema para botões
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          minWidth: 2000,
          buttonColor: Color.fromRGBO(24, 41, 129, 1),
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))));
}
