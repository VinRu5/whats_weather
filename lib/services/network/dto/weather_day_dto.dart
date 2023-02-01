import 'package:equatable/equatable.dart';

class WeatherDayDTO extends Equatable {
  final double temperature,
      temperatureMin,
      temparatureMax,
      precipitation,
      windSpeed;
  final int weatherSymbol;
  final DateTime date, sunrise, sunset;

  const WeatherDayDTO({
    required this.temperature,
    required this.temperatureMin,
    required this.temparatureMax,
    required this.precipitation,
    required this.windSpeed,
    required this.weatherSymbol,
    required this.date,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        temperature,
        temperatureMin,
        temparatureMax,
        precipitation,
        windSpeed,
        weatherSymbol,
      ];

  factory WeatherDayDTO.fromJson(Map<String, dynamic> map) => WeatherDayDTO(
        temperature: map["data"][0]["coordinates"][0]["dates"][0]["value"],
        temperatureMin: map["data"][1]["coordinates"][0]["dates"][0]["value"],
        temparatureMax: map["data"][2]["coordinates"][0]["dates"][0]["value"],
        precipitation: map["data"][4]["coordinates"][0]["dates"][0]["value"],
        windSpeed: map["data"][5]["coordinates"][0]["dates"][0]["value"],
        weatherSymbol: map["data"][3]["coordinates"][0]["dates"][0]["value"],
        date: DateTime.tryParse(
                map["data"][0]["coordinates"][0]["dates"][0]["date"]) ??
            DateTime.fromMillisecondsSinceEpoch(0),
        sunrise: DateTime.tryParse(
                map["data"][6]["coordinates"][0]["dates"][0]["value"]) ??
            DateTime.fromMillisecondsSinceEpoch(0),
        sunset: DateTime.tryParse(
                map["data"][7]["coordinates"][0]["dates"][0]["value"]) ??
            DateTime.fromMillisecondsSinceEpoch(0),
      );
}
