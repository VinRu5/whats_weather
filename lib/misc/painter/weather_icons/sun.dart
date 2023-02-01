import 'dart:math';

import 'package:flutter/material.dart';

class Sun extends CustomPainter {
  final Color color;
  final Paint painter;

  Sun(this.color)
      : painter = Paint()
          ..color = color
          ..strokeWidth = 4
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 2,
          size.height * 1 / 2,
        ),
        width: size.width,
        height: size.height,
      ),
      pi,
      2 * pi,
    );

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
