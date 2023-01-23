import 'package:geolocator/geolocator.dart';
import 'package:whats_weather/errors/network_error.dart';
import 'package:whats_weather/errors/repository_error.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/repositories/mapper/weather_mapper.dart';
import 'package:whats_weather/services/geo_services.dart';
import 'package:whats_weather/services/network/dto/all_weather_day_dto.dart';
import 'package:whats_weather/services/network/dto/report_day_dto.dart';
import 'package:whats_weather/services/network/dto/weather_day_dto.dart';
import 'package:whats_weather/services/network/weather_service.dart';

class WeatherRepository {
  final GeoService geoService;
  final WeatherService weatherService;
  final WeatherMapper mapper;

  WeatherRepository({
    required this.geoService,
    required this.weatherService,
    required this.mapper,
  });

  Future<WeatherDay> fetchDayData() async {
    final DateTime today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    Position? position;

    try {
      position = await geoService.determinePosition();
    } catch (e) {
      throw RepositoryError("Non è possibile geolocalizzarti");
    }

    try {
      final AllWeatherDayDTO allWeatherDays =
          await weatherService.fetchAllWeatherDay(
        today,
        position.latitude,
        position.longitude,
      );

      final ReportDayDTO reportDays = await weatherService.fetchReportWeather(
        today.add(
          const Duration(days: 1),
        ),
        today.add(
          const Duration(days: 6),
        ),
        position.latitude,
        position.longitude,
      );

      final WeatherDayDTO weatherDayDTO = await weatherService.fetchWeatherDay(
        today,
        position.latitude,
        position.longitude,
      );

      return mapper.toModel(
        allWeatherDays,
        reportDays,
        weatherDayDTO,
      );
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch (e) {
      throw RepositoryError();
    }
  }
}
