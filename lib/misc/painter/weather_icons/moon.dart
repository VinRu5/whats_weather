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
    final center = Offset(size.width / 2, size.height / 2);

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
