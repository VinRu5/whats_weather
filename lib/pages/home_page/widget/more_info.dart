import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:whats_weather/models/enum/weather_status.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/pages/home_page/widget/card_weather_day.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class MoreInfo extends StatelessWidget {
  final WeatherDay weatherDay;

  const MoreInfo({
    required this.weatherDay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          dayData(true),
          const SizedBox(height: 24.0),
          dayData(false),
          otherDays,
        ],
      ),
    );
  }

  Widget dayData(bool sunData) => Row(
        mainAxisAlignment:
            sunData ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          viewData(
            title: sunData ? "Alba" : "Precipitazioni",
            value: sunData
                ? DateFormat("H:m").format(weatherDay.sunrise)
                : weatherDay.precipitationAmount.toString(),
            unit: sunData ? "" : "mm",
          ),
          const SizedBox(width: 16.0),
          viewData(
            title: sunData ? "Tramonto" : "Velocità del vento",
            value: sunData
                ? DateFormat("H:m").format(weatherDay.sunset)
                : weatherDay.windSpeed.toString(),
            unit: sunData ? "" : "m/s",
          ),
        ],
      );

  Widget viewData({
    required String title,
    required String value,
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

  Widget get otherDays => Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0),
        child: SizedBox(
          height: 80.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: weatherDay.weatherWeek.length,
            separatorBuilder: (context, index) => const SizedBox(width: 24.0),
            itemBuilder: (context, index) => CardWeatherDay(
              nameDay: getDayName(weatherDay.weatherWeek[index].date),
              weatherSymbol: (weatherDay.weatherWeek[index].weatherSymbol ??
                      WeatherStatus.notDeterminate)
                  .image(
                      false,
                      (weatherDay.weatherWeek[index].temperatureMax ?? 0) >=
                          22.0),
              temperatureMin: weatherDay.weatherWeek[index].temperatureMin ?? 0,
              temperatureMax: weatherDay.weatherWeek[index].temperatureMax ?? 0,
            ),
          ),
        ),
      );

  String getDayName(DateTime? date) {
    initializeDateFormatting();
    if (date != null) {
      return DateFormat("EEE", 'it').format(date);
    }
    return "";
  }
}
