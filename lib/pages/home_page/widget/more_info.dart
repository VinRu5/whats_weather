import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_weather/pages/home_page/widget/card_weather_day.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          dayData,
          otherDays,
        ],
      ),
    );
  }

  Widget get dayData => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          viewData(
            title: "Precipitazioni",
            value: 0.2,
            unit: "mm",
          ),
          viewData(
            title: "Velocità del vento",
            value: 4.2,
            unit: "m/s",
          ),
        ],
      );

  Widget viewData({
    required String title,
    required double value,
    required String unit,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: WeatherTheme.dayData,
          ),
          const SizedBox(height: 8.0),
          Text(
            "$value $unit",
            style: WeatherTheme.dayUnit,
          )
        ],
      );

  Widget get otherDays => Container(
        height: 120.0,
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (context, index) => const SizedBox(width: 24.0),
          itemBuilder: (context, index) => CardWeatherDay(
            nameDay: "Sun",
            weatherSymbol: FontAwesomeIcons.cloud,
            temperatureMin: 20.0,
            temperatureMax: 30.0,
          ),
        ),
      );
}
