import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:whats_weather/models/enum/weather_status.dart';
import 'package:whats_weather/models/weather_day_data.dart';
import 'package:whats_weather/theme/weather_theme.dart';
import 'package:whats_weather/widgets/temperature_min_max.dart';

class WeatherDayTile extends StatelessWidget {
  final WeatherDayData weatherHourData;

  const WeatherDayTile({
    required this.weatherHourData,
    super.key,
  });

  bool get isNight =>
      (weatherHourData.date?.hour ?? 0) < 6 &&
      (weatherHourData.date?.hour ?? 0) > 18;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hour,
          const SizedBox(width: 8.0),
          symbol,
          const SizedBox(width: 8.0),
          temp,
          const SizedBox(width: 8.0),
          minMax,
          const SizedBox(width: 8.0),
          precipitation,
          const SizedBox(width: 8.0),
          wind,
        ],
      );

  Widget get hour => Text(
        DateFormat("hh:mm", "it").format(
          weatherHourData.date ?? DateTime.now(),
        ),
        style: WeatherTheme.dayUnit,
      );

  Widget get symbol => SizedBox(
        width: 20.0,
        height: 20.0,
        child: CustomPaint(
          painter: weatherHourData.weatherSymbol?.image(isNight),
        ),
      );

  Widget get temp => Text(
        "${(weatherHourData.temperature ?? 0).toStringAsFixed(0)}°",
        style: WeatherTheme.tempMedium,
      );

  Widget get minMax => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TemperatureMinMax(
            isMin: true,
            tempValue: weatherHourData.temperatureMin ?? 0,
            sizeIcon: 15.0,
          ),
          TemperatureMinMax(
            isMin: false,
            tempValue: weatherHourData.temperatureMax ?? 0,
            sizeIcon: 15.0,
          ),
        ],
      );

  Widget get precipitation => Row(
        children: [
          const Icon(
            FontAwesomeIcons.arrowUpWideShort,
            size: 15.0,
          ),
          const SizedBox(width: 4.0),
          Text("${weatherHourData.precipitationAmount} mm")
        ],
      );

  Widget get wind => Row(
        children: [
          const Icon(
            FontAwesomeIcons.wind,
            size: 15.0,
          ),
          const SizedBox(width: 4.0),
          Text("${weatherHourData.windSpeed} m/s")
        ],
      );
}
