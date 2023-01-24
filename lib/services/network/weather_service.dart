import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:whats_weather/errors/network_error.dart';
import 'package:whats_weather/services/network/dto/all_weather_day_dto.dart';
import 'package:whats_weather/services/network/dto/report_day_dto.dart';
import 'package:whats_weather/services/network/dto/weather_day_dto.dart';

class WeatherService {
  static const String username = "me_russo";
  static const String password = "kmlU70L49X";

  final String basicAuth =
      "Basic ${base64Encode(utf8.encode("$username:$password"))}";

  final String host = "http://api.meteomatics.com";
  final String reportParameters =
      "t_2m:C,t_min_2m_24h:C,t_max_2m_24h:C,weather_symbol_24h:idx,precip_24h:mm,wind_speed_10m:ms";
  //final String coordinates = "52.520551,13.461804";
  final String typeFile = "json";

  // final String urlLong =
  //     "http://api.meteomatics.com/2023-01-17T00:00:00Z--2023-01-18T00:00:00Z:PT1H/t_2m:C/52.520551,13.461804/json";

  Future<ReportDayDTO> fetchReportWeather(
    DateTime initialDate,
    DateTime endDate,
    double latitude,
    double longitude,
  ) async {
    final String initialDateParse = DateFormat("y-MM-d").format(initialDate);
    final String endDateParse = DateFormat("y-MM-d").format(endDate);

    final String dateString =
        "${initialDateParse}T00:00:00Z--${endDateParse}T23:00:00Z:PT24H";

    final String coordinates = "$latitude,$longitude";

    final String url =
        "$host/$dateString/$reportParameters/$coordinates/$typeFile";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{"authorization": basicAuth},
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return ReportDayDTO.fromJson(jsonResponse);
  }

  Future<WeatherDayDTO> fetchWeatherDay(
    DateTime date,
    double latitude,
    double longitude,
  ) async {
    final String dateParse = DateFormat("y-MM-dThh:mm:ss").format(date);

    final String dateString = "$dateParse.000+01:00";

    final String coordinates = "$latitude,$longitude";

    final String url =
        "$host/$dateString/$reportParameters/$coordinates/$typeFile";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{"authorization": basicAuth},
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return WeatherDayDTO.fromJson(jsonResponse);
  }

  Future<AllWeatherDayDTO> fetchAllWeatherDay(
    DateTime date,
    double latitude,
    double longitude,
  ) async {
    final String initialDateParse = DateFormat("y-MM-d").format(
      DateTime(
        date.year,
        date.month,
        date.day,
      ),
    );

    final String endDateParse = DateFormat("y-MM-d").format(
      DateTime(
        date.year,
        date.month,
        date.day,
      ),
    );

    final String dateString =
        "${initialDateParse}T00:00:00Z--${endDateParse}T23:00:00Z:PT1H";

    final String coordinates = "$latitude,$longitude";

    final String url =
        "$host/$dateString/$reportParameters/$coordinates/$typeFile";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{"authorization": basicAuth},
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase,
      );
    }

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return AllWeatherDayDTO.fromJson(jsonResponse);
  }
}
