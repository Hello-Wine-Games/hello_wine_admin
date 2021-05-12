import 'package:flutter/material.dart';

class HWTheme {
  static const burgundy = Color(0xFF9E2038);
  static const darkBurgundy = Color(0xFF881128);
  static const background = Color(0xFFF7F7F7);
  static const greenDot = Color(0xFF388E37);
  static const yelloDot = Color(0xFFFFEE58);
  static const grayOutline = Color(0xFFC4C4C4);
  static const darkGray = Color(0xFF616161);

  static Map<int, Color> color = {
    50: Color.fromRGBO(158, 32, 56, .1),
    100: Color.fromRGBO(158, 32, 56, .2),
    200: Color.fromRGBO(158, 32, 56, .3),
    300: Color.fromRGBO(158, 32, 56, .4),
    400: Color.fromRGBO(158, 32, 56, .5),
    500: Color.fromRGBO(158, 32, 56, .6),
    600: Color.fromRGBO(158, 32, 56, .7),
    700: Color.fromRGBO(158, 32, 56, .8),
    800: Color.fromRGBO(158, 32, 56, .9),
    900: Color.fromRGBO(158, 32, 56, 1),
  };

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: MaterialColor(0xFF9E2038, color),
      primaryColor: Color(0xFF9E2038),
      textTheme: TextTheme(
        headline1: TextStyle(fontFamily: "Oleo Script", color: burgundy),
        headline2: TextStyle(fontFamily: "Oleo Script", color: burgundy),
        headline3: TextStyle(fontFamily: "Oleo Script", color: burgundy),
        headline4: TextStyle(fontFamily: "Oleo Script", color: burgundy),
        headline5: TextStyle(
            fontFamily: "Roboto", color: burgundy, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontFamily: "Roboto", color: burgundy),
        bodyText1: TextStyle(
            fontFamily: "Roboto",
            color: Colors.grey,
            fontWeight: FontWeight.w700),
        bodyText2: TextStyle(fontFamily: "Oleo Script", color: burgundy),
      ).apply(),
    );
  }
}
