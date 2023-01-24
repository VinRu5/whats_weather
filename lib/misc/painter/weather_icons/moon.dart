import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class Moon extends CustomPainter {
  final Paint painterMoon;

  Moon()
      : painterMoon = Paint()
          ..color = WeatherTheme.gold
          ..strokeWidth = 4
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Path pathMoon = Path();
    //Path pathMoon2 = Path();
    final center = Offset(size.width / 2, size.height / 2);

    // pathMoon.addRRect(
    //   RRect.fromRectAndCorners(
    //     Rect.fromCenter(
    //       center: Offset(
    //         size.width * 1 / 2,
    //         size.height * 1 / 2,
    //       ),
    //       width: 100,
    //       height: 100,
    //     ),
    //     topRight: Radius.elliptical(100, 100),
    //   ),
    // );

    ///primo arco prima nuvola
    // pathMoon.addArc(
    //   Rect.fromCenter(
    //     center: Offset(
    //       size.width * 1 / 2,
    //       size.height * 1 / 2,
    //     ),
    //     width: size.width,
    //     height: size.height,
    //   ),
    //   pi,
    //   pi * 2,
    // );

    ///secondo arco seconda Nuvola
    // pathMoon2.addArc(
    //   Rect.fromCenter(
    //     center: Offset(
    //       size.width * 3 / 4,
    //       size.height * 1 / 2,
    //     ),
    //     width: size.width * 1 / 2,
    //     height: size.height * 1 / 2,
    //   ),
    //   pi * 2,
    //   pi,
    // );

    Path path1 = Path()
      ..addOval(Rect.fromCenter(
          center: center, width: size.width, height: size.height));

    Path path2 = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(
            size.width * 6 / 8,
            size.height * 3 / 8,
          ),
          width: size.width * 5 / 6,
          height: size.height * 5 / 6,
        ),
      );
    canvas.drawPath(
      Path.combine(PathOperation.difference, path1, path2),
      painterMoon,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
