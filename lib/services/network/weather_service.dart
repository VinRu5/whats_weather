import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:whats_weather/services/network/dto/weather_response.dart';

class WeatherService {
  static const String username = "me_russo";
  static const String password = "kmlU70L49X";

  final String basicAuth =
      "Basic ${base64Encode(utf8.encode("$username:$password"))}";

  final String host = "http://api.meteomatics.com";
  final String parameters =
      "t_2m:C,t_min_2m_24h:C,t_max_2m_24h:C,weather_symbol_24h:idx,precip_24h:mm";
  //final String coordinates = "52.520551,13.461804";
  final String typeFile = "json";

  // final String urlLong =
  //     "http://api.meteomatics.com/2023-01-17T00:00:00Z--2023-01-18T00:00:00Z:PT1H/t_2m:C/52.520551,13.461804/json";

  Future<WeatherResponse> getWeather(
    DateTime initialDate,
    DateTime endDate,
    double latitude,
    double longitude,
  ) async {
    final String initialDateParse =
        DateFormat("y-MM-dThh:mm:ss").format(initialDate);
    final String endDateParse = DateFormat("y-MM-dThh:mm:ss").format(endDate);

    final String dateString = "${initialDateParse}Z--${endDateParse}Z:PT1H";

    final String coordinates = "$latitude,$longitude";

    final String url = "$host/$dateString/$parameters/$coordinates/$typeFile";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{"authorization": basicAuth},
    );

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return WeatherResponse.fromJson(jsonResponse);
  }
}
