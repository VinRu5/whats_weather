import 'package:whats_weather/models/enum/weather_state_symbol.dart';
import 'package:whats_weather/models/report_day.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/models/weather_day_data.dart';
import 'package:whats_weather/services/network/dto/report_day_dto.dart';
import 'package:whats_weather/services/network/dto/weather_data_model.dart';
import 'package:whats_weather/services/network/dto/all_weather_day_dto.dart';
import 'package:whats_weather/services/network/dto/weather_day_dto.dart';

class WeatherMapper {
  WeatherDay toModel(
    AllWeatherDayDTO allWeatherDayDTO,
    ReportDayDTO reportDayDTO,
    WeatherDayDTO weatherDayDTO,
  ) {
    final Map<String, List<WeatherDataModel>> weatherResponseMap = {};

    weatherResponseMap.addAll({
      "temperatures": allWeatherDayDTO.temperatures,
      "temperaturesMin": allWeatherDayDTO.temperaturesMin,
      "temperaturesMax": allWeatherDayDTO.temperaturesMax,
      "weatherStates": allWeatherDayDTO.weatherStates,
      "precipitations": allWeatherDayDTO.precipitations,
      "windSpeed": allWeatherDayDTO.windSpeed,
    });

    Map<DateTime, WeatherDayData> dayDataMap = {};
    Map<DateTime, ReportDay> reportDataMap = {};

    weatherResponseMap.forEach(
      (parameters, weatherData) {
        for (var element in weatherData) {
          if (dayDataMap[element.date] == null) {
            dayDataMap.putIfAbsent(
              element.date,
              () => WeatherDayData(
                weatherSymbol: parameters == "weatherStates"
                    ? WeatherStateSymbol.values[(element.value as int)]
                    : null,
                temperature: parameters == "temperatures"
                    ? (element.value as double)
                    : null,
                temperatureMin: parameters == "temperaturesMin"
                    ? (element.value as double)
                    : null,
                temperatureMax: parameters == "temperaturesMax"
                    ? (element.value as double)
                    : null,
                precipitationAmount: parameters == "precipitations"
                    ? (element.value as double)
                    : null,
                windSpeed: parameters == "windSpeed"
                    ? (element.value as double)
                    : null,
                date: element.date,
              ),
            );
          } else {
            dayDataMap.update(
              element.date,
              (value) => WeatherDayData(
                weatherSymbol: parameters == "weatherStates"
                    ? WeatherStateSymbol.values[(element.value as int)]
                    : value.weatherSymbol,
                temperature: parameters == "temperatures"
                    ? (element.value as double)
                    : value.temperature,
                temperatureMin: parameters == "temperaturesMin"
                    ? (element.value as double)
                    : value.temperatureMin,
                temperatureMax: parameters == "temperaturesMax"
                    ? (element.value as double)
                    : value.temperatureMax,
                precipitationAmount: parameters == "precipitations"
                    ? (element.value as double)
                    : value.precipitationAmount,
                windSpeed: parameters == "windSpeed"
                    ? (element.value as double)
                    : value.windSpeed,
                date: value.date,
              ),
            );
          }
        }
      },
    );

    List<WeatherDayData> allWeatherDays = [];

    dayDataMap.forEach(
      (key, value) => allWeatherDays.add(value),
    );

    reportDayDTO.reportMap.forEach(
      (parameters, listData) {
        for (final weatherData in listData) {
          if (reportDataMap[weatherData.date] == null) {
            reportDataMap.putIfAbsent(
              weatherData.date,
              () => ReportDay(
                temperatureMin:
                    parameters == "temperaturesMin" ? weatherData.value : null,
                temperatureMax:
                    parameters == "temperaturesMax" ? weatherData.value : null,
                weatherSymbol: parameters == "weatherStates"
                    ? WeatherStateSymbol.values[weatherData.value]
                    : null,
                date: weatherData.date,
              ),
            );
          } else {
            reportDataMap.update(
              weatherData.date,
              (value) => ReportDay(
                temperatureMin: parameters == "temperaturesMin"
                    ? weatherData.value
                    : value.temperatureMin,
                temperatureMax: parameters == "temperaturesMax"
                    ? weatherData.value
                    : value.temperatureMax,
                weatherSymbol: parameters == "weatherStates"
                    ? WeatherStateSymbol.values[weatherData.value]
                    : value.weatherSymbol,
                date: value.date,
              ),
            );
          }
        }
      },
    );

    final List<ReportDay> weatherWeek = [];

    reportDataMap.forEach(
      (key, value) => weatherWeek.add(value),
    );

    return WeatherDay(
      precipitationAmount: weatherDayDTO.precipitation,
      temperature: weatherDayDTO.temperature,
      temperatureMax: weatherDayDTO.temparatureMax,
      temperatureMin: weatherDayDTO.temperatureMin,
      weatherSymbol: WeatherStateSymbol.values[weatherDayDTO.weatherSymbol],
      windSpeed: weatherDayDTO.windSpeed,
      allWeatherDays: allWeatherDays,
      weatherWeek: weatherWeek,
    );
  }
}
