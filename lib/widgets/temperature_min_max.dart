import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class TemperatureMinMax extends StatelessWidget {
  final bool isMin;
  final double tempValue;
  final double sizeIcon;

  const TemperatureMinMax({
    required this.isMin,
    required this.tempValue,
    this.sizeIcon = 20.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            isMin ? FontAwesomeIcons.caretDown : FontAwesomeIcons.caretUp,
            color: WeatherTheme.black,
            size: sizeIcon,
          ),
          const SizedBox(width: 4.0),
          Text(
            "${tempValue.toStringAsFixed(0)}°",
            style: WeatherTheme.tempLight,
          ),
        ],
      );
}
