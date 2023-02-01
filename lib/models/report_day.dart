import 'package:equatable/equatable.dart';

import 'package:whats_weather/models/enum/weather_status.dart';

class ReportDay extends Equatable {
  double? temperatureMin, temperatureMax;
  WeatherStatus? weatherSymbol;
  DateTime? date;

  ReportDay({
    required this.temperatureMin,
    required this.temperatureMax,
    required this.weatherSymbol,
    required this.date,
  });

  @override
  List<Object?> get props => [
        temperatureMin,
        temperatureMax,
        weatherSymbol,
        date,
      ];
}
