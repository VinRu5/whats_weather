import 'package:flutter/material.dart';

class WeatherTheme {
  ///colori
  static const Color backRose = Color(0xFFEBC6B2);
  static const Color backBlack = Color(0xFF2A2A2A);
  static const Color black = Color(0xFF313131);
  static const Color backBlue = Color(0xFFBABFC0);
  static const Color backGreen = Color(0xFFBEC8BA);
  static const Color backBrown = Color(0xFFD7CAB4);
  static const Color orange = Color(0xFFFF881E); //Color(0xFFC25D10);
  static const Color yellow = Color(0xFFFBAD17);
  static const Color cyan = Color(0xFF5AA2FF);
  static const Color gold = Color(0xFFDEC6A2);
  static const Color trasparent = Colors.transparent;
  static const Color white = Colors.white;

  /// stili testo
  static const TextStyle titleApp = TextStyle(
    fontSize: 16.0,
    color: black,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
  );

  static const TextStyle tempLight = TextStyle(
    fontSize: 16.0,
    color: black,
  );

  static const TextStyle dayName = TextStyle(
    fontSize: 16.0,
    color: black,
    letterSpacing: 2.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle dayTempMin = TextStyle(
    fontSize: 14.0,
    color: white,
    letterSpacing: 2.0,
  );

  static const TextStyle dayTempMax = TextStyle(
    fontSize: 14.0,
    color: black,
    letterSpacing: 2.0,
  );

  static const TextStyle dayData = TextStyle(
    fontSize: 14.0,
    color: black,
  );

  static const TextStyle dayUnit = TextStyle(
    fontSize: 14.0,
    color: black,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle tempBig = TextStyle(
    fontSize: 72.0,
    color: black,
    letterSpacing: 2.0,
    fontWeight: FontWeight.w300,
  );
}
