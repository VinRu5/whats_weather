import 'package:equatable/equatable.dart';

import 'package:whats_weather/models/enum/weather_status.dart';

class WeatherDayData extends Equatable {
  WeatherStatus? weatherSymbol;
  double? temperature,
      temperatureMin,
      temperatureMax,
      precipitationAmount,
      windSpeed;
  DateTime? date;

  WeatherDayData({
    this.weatherSymbol,
    this.temperature,
    this.temperatureMin,
    this.temperatureMax,
    this.precipitationAmount,
    this.windSpeed,
    this.date,
  });

  @override
  List<Object?> get props => [
        weatherSymbol,
        temperature,
        temperatureMin,
        temperatureMax,
        precipitationAmount,
        windSpeed,
        date,
      ];
}
