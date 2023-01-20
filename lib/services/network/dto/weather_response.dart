import 'package:equatable/equatable.dart';
import 'package:whats_weather/models/Weather_data_model.dart';

class WeatherResponse extends Equatable {
  final List<WeatherDataModel> temperatures;
  final List<WeatherDataModel> temperaturesMin;
  final List<WeatherDataModel> temperaturesMax;
  final List<WeatherDataModel> weatherStates;
  final List<WeatherDataModel> precipitations;

  const WeatherResponse({
    required this.temperatures,
    required this.temperaturesMin,
    required this.temperaturesMax,
    required this.weatherStates,
    required this.precipitations,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> map) {
    return WeatherResponse(
      temperatures: _getData(map["data"][0]), //temperatures,
      temperaturesMin: _getData(map["data"][1]), //temperaturesMin,
      temperaturesMax: _getData(map["data"][2]), //temperaturesMax,
      weatherStates: _getData(map["data"][3]), //weatherStates,
      precipitations: _getData(map["data"][4]), //precipitations,
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
      ];
}
