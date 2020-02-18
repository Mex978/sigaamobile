import 'package:flutter/material.dart';

customAppBar({List<Widget> actions: const <Widget>[], @required Widget title}) {
  return AppBar(
    actions: actions,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF19C2D7), Color(0xFF0E98D9)])),
    ),
    title: title,
  );
}
