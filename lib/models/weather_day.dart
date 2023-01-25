import 'package:equatable/equatable.dart';
import 'package:whats_weather/models/enum/weather_status.dart';
import 'package:whats_weather/models/report_day.dart';
import 'package:whats_weather/models/weather_day_data.dart';

class WeatherDay extends Equatable {
  final double temperature,
      temperatureMin,
      temperatureMax,
      precipitationAmount,
      windSpeed;
  final WeatherStatus weatherSymbol;
  final DateTime date, sunrise, sunset;
  final List<WeatherDayData> allWeatherDays;
  final List<ReportDay> weatherWeek;
  final bool isNight;

  const WeatherDay({
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.precipitationAmount,
    required this.windSpeed,
    required this.weatherSymbol,
    required this.date,
    required this.allWeatherDays,
    required this.weatherWeek,
    required this.sunrise,
    required this.sunset,
    required this.isNight,
  });

  @override
  List<Object?> get props => [
        temperature,
        temperatureMin,
        temperatureMax,
        precipitationAmount,
        windSpeed,
        weatherSymbol,
        date,
        allWeatherDays,
        weatherWeek,
        sunrise,
        sunset,
        isNight,
      ];

  // IconData get weatherSymbolNow {
  //   final weatherNow =
  // }
}
