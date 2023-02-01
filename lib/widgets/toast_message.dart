import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class ToastMessage {
  static showErrorToast(BuildContext context, String message) {
    FToast fToast = FToast()..init(context);

    Widget child = Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.black87,
      ),
      child: Text(
        message,
        style: WeatherTheme.toastStyle,
        textAlign: TextAlign.center,
      ),
    );

    fToast.showToast(
      child: child,
      toastDuration: const Duration(seconds: 3),
      gravity: ToastGravity.CENTER,
    );
  }
}
