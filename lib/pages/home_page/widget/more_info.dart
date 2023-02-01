import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:whats_weather/models/enum/weather_status.dart';
import 'package:whats_weather/models/report_day.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/pages/home_page/widget/card_weather_day.dart';
import 'package:whats_weather/pages/home_page/widget/weather_day_tile.dart';
import 'package:whats_weather/theme/weather_theme.dart';

class MoreInfo extends StatelessWidget {
  final WeatherDay weatherDay;
  final Function(DateTime) onDayTap;

  const MoreInfo({
    required this.weatherDay,
    required this.onDayTap,
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
          specificationDay,
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
                ? DateFormat("H:mm").format(weatherDay.sunrise)
                : weatherDay.precipitationAmount.toString(),
            unit: sunData ? "" : "mm",
          ),
          const SizedBox(width: 16.0),
          viewData(
            title: sunData ? "Tramonto" : "Velocità del vento",
            value: sunData
                ? DateFormat("H:mm").format(weatherDay.sunset)
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
              onTap: () => onDayTap(
                weatherDay.weatherWeek[index].date ?? DateTime.now(),
              ),
            ),
          ),
        ),
      );

  Widget get specificationDay => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: weatherDay.allWeatherDays.length,
        separatorBuilder: (context, index) => const Divider(
          color: WeatherTheme.white,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: WeatherDayTile(
            weatherHourData: weatherDay.allWeatherDays[index],
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
