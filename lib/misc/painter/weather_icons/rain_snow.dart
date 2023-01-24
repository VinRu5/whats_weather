import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class RainSnow extends CustomPainter {
  final Paint painterCloud;

  final Paint painterRain;

  RainSnow()
      : painterCloud = Paint()
          ..color = WeatherTheme.white
          ..strokeWidth = 4
          ..style = PaintingStyle.fill,
        painterRain = Paint()
          ..color = WeatherTheme.cyan
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

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

    /// Effeto neve
    pathCloud.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 2 / 12,
          size.height * 5 / 8,
        ),
        width: size.width * 1 / 24,
        height: size.height * 1 / 24,
      ),
      pi,
      pi * 2,
    );

    pathCloud.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 2 / 12,
          size.height * 6 / 8,
        ),
        width: size.width * 1 / 24,
        height: size.height * 1 / 24,
      ),
      pi,
      pi * 2,
    );

    pathCloud.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 4 / 12,
          size.height * 5 / 8,
        ),
        width: size.width * 1 / 24,
        height: size.height * 1 / 24,
      ),
      pi,
      pi * 2,
    );

    pathCloud.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 4 / 12,
          size.height * 6 / 8,
        ),
        width: size.width * 1 / 24,
        height: size.height * 1 / 24,
      ),
      pi,
      pi * 2,
    );

    canvas.drawPath(pathCloud, painterCloud);

    /// Pioggia
    canvas.drawLine(
      Offset(
        size.width * 1 / 12,
        (size.height * 5 / 8) - 10,
      ),
      Offset(
        size.width * 1 / 12,
        (size.height * 7 / 8) - 10,
      ),
      painterRain,
    );

    canvas.drawLine(
      Offset(
        size.width * 3 / 12,
        (size.height * 5 / 8) - 10,
      ),
      Offset(
        size.width * 3 / 12,
        (size.height * 7 / 8) - 10,
      ),
      painterRain,
    );

    canvas.drawLine(
      Offset(
        size.width * 5 / 12,
        (size.height * 5 / 8) - 10,
      ),
      Offset(
        size.width * 5 / 12,
        (size.height * 7 / 8) - 10,
      ),
      painterRain,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
