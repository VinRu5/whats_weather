import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class Fog extends CustomPainter {
  final Paint painterCloud;
  final Paint painterFog;

  Fog()
      : painterCloud = Paint()
          ..color = WeatherTheme.white
          ..strokeWidth = 4
          ..style = PaintingStyle.fill,
        painterFog = Paint()
          ..color = WeatherTheme.gold
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    Path pathCloud = Path();
    Path pathFog = Path();

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

    ///nebbia

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 20,
          size.height * 11 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 3 / 20,
          size.height * 11 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi * 2,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 5 / 20,
          size.height * 11 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 7 / 20,
          size.height * 11 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi * 2,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 20,
          size.height * 15 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 3 / 20,
          size.height * 15 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi * 2,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 5 / 20,
          size.height * 15 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 7 / 20,
          size.height * 15 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi * 2,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 1 / 20,
          size.height * 13 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 3 / 20,
          size.height * 13 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi * 2,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 5 / 20,
          size.height * 13 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi,
      pi,
    );

    pathFog.addArc(
      Rect.fromCenter(
        center: Offset(
          size.width * 7 / 20,
          size.height * 13 / 20,
        ),
        width: size.width * 1 / 10,
        height: size.height * 1 / 20,
      ),
      pi * 2,
      pi,
    );

    canvas.drawPath(pathCloud, painterCloud);
    canvas.drawPath(pathFog, painterFog);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
