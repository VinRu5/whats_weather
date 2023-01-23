import 'package:flutter/material.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: WeatherTheme.white,
        ),
      );
}
