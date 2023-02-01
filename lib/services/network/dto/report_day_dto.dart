import 'package:equatable/equatable.dart';
import 'package:whats_weather/services/network/dto/weather_data_model.dart';

typedef ReportDayMap = Map<String, List<WeatherDataModel>>;

class ReportDayDTO extends Equatable {
  final ReportDayMap reportMap;

  const ReportDayDTO({
    required this.reportMap,
  });

  @override
  List<Object?> get props => [
        reportMap,
      ];

  factory ReportDayDTO.fromJson(Map<String, dynamic> map) {
    return ReportDayDTO(
      reportMap: {
        "temperatures":
            _getData<double>(map["data"][0]["coordinates"][0]["dates"]),
        "temperaturesMin":
            _getData<double>(map["data"][1]["coordinates"][0]["dates"]),
        "temperaturesMax":
            _getData<double>(map["data"][2]["coordinates"][0]["dates"]),
        "weatherStates":
            _getData<int>(map["data"][3]["coordinates"][0]["dates"]),
        "precipitations":
            _getData<double>(map["data"][4]["coordinates"][0]["dates"]),
        "windSpeed":
            _getData<double>(map["data"][5]["coordinates"][0]["dates"]),
      },
    );
  }

  static List<WeatherDataModel> _getData<T>(List<dynamic> map) {
    List<WeatherDataModel> list = [];

    //final date = DateTime.tryParse(map[0].date);

    for (var element in map) {
      list.add(
        WeatherDataModel<T>(
          date: DateTime.tryParse(element["date"]) ??
              DateTime.fromMillisecondsSinceEpoch(0),
          value: element["value"],
        ),
      );
    }

    return list;
  }
}
