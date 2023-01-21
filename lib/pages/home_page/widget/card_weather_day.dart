import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class CardWeatherDay extends StatelessWidget {
  final String nameDay;
  final IconData weatherSymbol;
  final double temperatureMin;
  final double temperatureMax;

  const CardWeatherDay({
    required this.nameDay,
    required this.weatherSymbol,
    required this.temperatureMin,
    required this.temperatureMax,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          dayNameView,
          const SizedBox(height: 4.0),
          weatherSymbolView,
          const SizedBox(height: 4.0),
          temperaturesView,
        ],
      );

  Widget get dayNameView => Text(
        nameDay.toUpperCase(),
        style: WeatherTheme.dayName,
      );

  Widget get weatherSymbolView => Icon(
        weatherSymbol,
        color: WeatherTheme.white,
        size: 20.0,
      );

  Widget get temperaturesView => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${temperatureMin.toStringAsFixed(0)}°",
            style: WeatherTheme.dayTempMin,
          ),
          const SizedBox(width: 4.0),
          Text("${temperatureMax.toStringAsFixed(0)}°"),
        ],
      );
}
