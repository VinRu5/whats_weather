import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class Cloud extends CustomPainter {
  final Paint painter;

  Cloud()
      : painter = Paint()
          ..color = WeatherTheme.white
          ..strokeWidth = 4
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    ///primo arco in alto a sinistra
    path.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 4,
          size.height * 1 / 3,
        ),
        width: size.width * 1 / 2,
        height: size.height * 1 / 2,
      ),
      pi,
      pi,
    );

    ///secondo arco in alto a destra
    path.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 3 / 4,
          size.height * 1 / 3,
        ),
        width: size.width * 1 / 2,
        height: size.height * 1 / 2,
      ),
      pi * 2,
      pi,
    );

    /// terzo arco in basso a sinistra
    path.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 4,
          size.height * 2 / 3,
        ),
        width: size.width * 1 / 2,
        height: size.height * 1 / 2,
      ),
      pi,
      pi,
    );

    /// quarto arco in baso a destra
    path.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 3 / 4,
          size.height * 4 / 6,
        ),
        width: size.width * 1 / 2,
        height: size.height * 1 / 2,
      ),
      pi * 2,
      pi,
    );

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
