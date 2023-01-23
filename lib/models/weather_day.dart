import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whats_weather/models/enum/weather_state.dart';
import 'package:whats_weather/models/report_day.dart';
import 'package:whats_weather/models/weather_day_data.dart';
import 'package:whats_weather/services/network/dto/all_weather_day_dto.dart';

class WeatherDay extends Equatable {
  final double temperature,
      temperatureMin,
      temperatureMax,
      precipitationAmount,
      windSpeed;
  final WeatherState weatherSymbol;
  final List<WeatherDayData> allWeatherDays;
  final List<ReportDay> weatherWeek;

  const WeatherDay({
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.precipitationAmount,
    required this.windSpeed,
    required this.weatherSymbol,
    required this.allWeatherDays,
    required this.weatherWeek,
  });

  @override
  List<Object?> get props => [
        temperature,
        temperatureMin,
        temperatureMax,
        precipitationAmount,
        windSpeed,
        weatherSymbol,
        allWeatherDays,
        weatherWeek,
      ];

  // IconData get weatherSymbolNow {
  //   final weatherNow =
  // }
}
