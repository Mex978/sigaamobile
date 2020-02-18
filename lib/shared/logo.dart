import 'package:flutter/material.dart';

sigaaLogo() {
  // Widget _flightShuttleBuilder(
  //   BuildContext flightContext,
  //   Animation<double> animation,
  //   HeroFlightDirection flightDirection,
  //   BuildContext fromHeroContext,
  //   BuildContext toHeroContext,
  // ) {
  //   return DefaultTextStyle(
  //     style: DefaultTextStyle.of(toHeroContext).style,
  //     child: toHeroContext.widget,
  //   );
  // }

  return Text(
    "SIGAA MOBILE",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(24, 41, 129, 1),
    ),
  );
}
