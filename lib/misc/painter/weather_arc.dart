import 'dart:math';

import 'package:flutter/material.dart';

class WeatherArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint painter = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Path path = Path();

    // path.moveTo(0, 0);
    // path.arcToPoint(
    //   Offset(1, 0),
    // );

    path.moveTo(-10, size.height);
    path.arcToPoint(
      Offset(size.width + 10, size.height),
      radius: Radius.elliptical(1, 0.47),
    );

    // path.addArc(
    //   Rect.fromCenter(
    //     center: Offset(
    //       size.width * 1 / 2,
    //       size.height,
    //     ),
    //     width: size.width,
    //     height: size.height,
    //   ),
    //   pi,
    //   pi,
    // );

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
