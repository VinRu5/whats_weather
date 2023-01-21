import 'package:equatable/equatable.dart';
import 'package:whats_weather/models/weather_data_model.dart';

class WeatherResponse extends Equatable {
  final List<WeatherDataModel> temperatures;
  final List<WeatherDataModel> temperaturesMin;
  final List<WeatherDataModel> temperaturesMax;
  final List<WeatherDataModel> weatherStates;
  final List<WeatherDataModel> precipitations;
  final List<WeatherDataModel> windSpeed;

  const WeatherResponse({
    required this.temperatures,
    required this.temperaturesMin,
    required this.temperaturesMax,
    required this.weatherStates,
    required this.precipitations,
    required this.windSpeed,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> map) {
    return WeatherResponse(
      temperatures: _getData(map["data"][0]),
      temperaturesMin: _getData(map["data"][1]),
      temperaturesMax: _getData(map["data"][2]),
      weatherStates: _getData(map["data"][3]),
      precipitations: _getData(map["data"][4]),
      windSpeed: _getData(map["data"][5]),
    );
  }

  static List<WeatherDataModel> _getData(Map<String, dynamic> map) {
    List<WeatherDataModel> list = [];
    final List<dynamic> listMap = map["coordinates"][0]["dates"];
    for (var data in listMap) {
      list.add(
        WeatherDataModel(
          date: DateTime.tryParse(data["date"]) ??
              DateTime.fromMillisecondsSinceEpoch(0),
          value: data["value"],
        ),
      );
    }
    return list;
  }

  @override
  List<Object?> get props => [
        temperatures,
        temperaturesMin,
        temperaturesMax,
        weatherStates,
        precipitations,
        windSpeed,
      ];
}
