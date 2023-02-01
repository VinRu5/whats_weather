import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class WeatherArc extends CustomPainter {
  final Paint painter;
  final double dayValue;

  WeatherArc({
    required this.dayValue,
  }) : painter = Paint()
          ..color = Colors.white
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    // final Paint painter = Paint()
    //   ..color = Colors.white
    //   ..strokeWidth = 4
    //   ..style = PaintingStyle.stroke;

    //Path path = Path();
    // Path path1 = Path();

    // path.moveTo(-10, size.height);
    // path.arcToPoint(
    //   Offset(size.width + 10, size.height),
    //   radius: Radius.elliptical(1, 0.47),
    // );
    // canvas.drawPath(path, painter);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(
          size.width / 2,
          size.height / 2,
        ),
        width: size.width + 10,
        height: size.height,
      ),
      pi,
      pi,
      false,
      painter,
    );
    painter.color = WeatherTheme.orange;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(
          size.width / 2,
          size.height / 2,
        ),
        width: size.width + 10,
        height: size.height,
      ),
      pi,
      pi * dayValue,
      false,
      painter,
    );
    //painter.style = PaintingStyle.fill;

    /// 0.5 = x size.width / 2 y 0
    /// dayValue : 0.5 = x : size.width / 2
    /// x = dayValue * size.width / 2 /0.5
    /// dayValue : 0 = x : 0
    /// dayValue : 0.5 = x : size.widgt / 2
    /// dayValue : 1 = x : size.width
    ///
    /// dayValue : 0 = x : size.height / 2
    /// dayValue : 0.5 = x : 0
    /// dayValue : 1 = x :s
    ///
    ///
    ///()
    // path.addArc(
    //   Rect.fromCenter(
    //     center: Offset(
    //       size.width / 2,
    //       size.height / 2,
    //     ),
    //     width: 20,
    //     height: 20,
    //   ),
    //   2 * pi,
    //   2 * pi, //dayValue,
    // );

    // path.;
    //painter.blendMode = BlendMode.exclusion;

    // Path path = Path()
    //   ..fillType = PathFillType.evenOdd
    //   ..addOval(
    //     Rect.fromCircle(
    //         center: Offset(
    //           size.width / 2,
    //           size.height / 2,
    //         ),
    //         radius: 100),
    //   )
    //   ..addOval(
    //     Rect.fromCircle(
    //         center: Offset(
    //           size.width,
    //           size.height,
    //         ),
    //         radius: 20),
    //   );

    // canvas.drawArc(
    //   Rect.fromCenter(
    //     center: Offset(
    //       size.width / 2,
    //       size.height / 2,
    //     ),
    //     width: size.width + 10,
    //     height: size.height,
    //   ),
    //   pi,
    //   pi * dayValue,
    //   false,
    //   painter,
    // );
    // canvas.drawArc(
    //   Rect.fromCenter(
    //     center: Offset(
    //       dayValue * size.width,
    //       dayValue * size.height,
    //     ),
    //     width: 20,
    //     height: 20,
    //   ),
    //   2 * pi,
    //   2 * pi, //dayValue,
    //   false,
    //   painter,
    // );
    //canvas.translate(100, 100);

    //canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
