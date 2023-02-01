import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class CloudQuestion extends CustomPainter {
  final Paint painter;

  CloudQuestion()
      : painter = Paint()
          ..color = WeatherTheme.white
          ..strokeWidth = 4
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    ///primo arco prima nuvola
    path.addArc(
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
    path.addArc(
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

    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: '?',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = size.width * 11 / 16;
    final yCenter = size.height * 1 / 4;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
