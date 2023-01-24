import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class Thunderstorm extends CustomPainter {
  final Paint painterCloud;

  Thunderstorm()
      : painterCloud = Paint()
          ..color = WeatherTheme.white
          ..strokeWidth = 4
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Path pathCloud = Path();

    ///primo arco prima nuvola
    pathCloud.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 4,
          size.height * 1 / 2,
        ),
        width: size.width * 1 / 2,
        height: size.height * 1 / 2,
      ),
      pi,
      pi,
    );

    ///secondo arco seconda Nuvola
    pathCloud.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 3 / 4,
          size.height * 1 / 2,
        ),
        width: size.width * 1 / 2,
        height: size.height * 1 / 2,
      ),
      pi * 2,
      pi,
    );

    /// fulmine
    pathCloud.addPolygon(
      [
        Offset(
          size.width * 1 / 4,
          size.height * 11 / 20,
        ),
        Offset(
          size.width * 1 / 4,
          size.height * 13 / 20,
        ),
        Offset(
          (size.width * 1 / 4) - 8,
          size.height * 13 / 20,
        ),
      ],
      true,
    );

    pathCloud.addPolygon(
      [
        Offset(
          size.width * 1 / 4,
          size.height * 13 / 20,
        ),
        Offset(
          size.width * 1 / 4,
          size.height * 15 / 20,
        ),
        Offset(
          (size.width * 1 / 4) + 8,
          size.height * 13 / 20,
        ),
      ],
      true,
    );

    canvas.drawPath(pathCloud, painterCloud);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
