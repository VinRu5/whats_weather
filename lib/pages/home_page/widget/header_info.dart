import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class HeaderInfo extends StatelessWidget {
  final WeatherDay weatherDay;

  const HeaderInfo({
    required this.weatherDay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        weatherSymbol,
        dayTemperatures,
      ],
    );
  }

  Widget get weatherSymbol => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 16.0,
        ),
        child: Icon(
          FontAwesomeIcons.solidSun,
          color: WeatherTheme.orange,
          size: 150.0,
        ),
      );

  Widget get dayTemperatures => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            temperature(
              true,
              20.0,
            ),
            Expanded(child: tempNow),
            temperature(
              false,
              25.0,
            ),
          ],
        ),
      );

  Widget temperature(bool isMin, double tempValue) => Row(
        children: [
          Icon(
            isMin ? FontAwesomeIcons.caretDown : FontAwesomeIcons.caretUp,
            color: WeatherTheme.black,
          ),
          const SizedBox(width: 4.0),
          Text(
            "$tempValue°",
            style: WeatherTheme.tempLight,
          ),
        ],
      );

  Widget get tempNow => Text(
        "${weatherDay.temperature}°",
        style: WeatherTheme.tempBig,
        textAlign: TextAlign.center,
      );
}
