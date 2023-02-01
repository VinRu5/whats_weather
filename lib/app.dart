import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whats_weather/repositories/geo_repository.dart';
import 'package:whats_weather/repositories/mapper/weather_mapper.dart';
import 'package:whats_weather/repositories/weather_repository.dart';
import 'package:whats_weather/routes/weather_routes.dart';
import 'package:whats_weather/services/geo_services.dart';
import 'package:whats_weather/services/network/weather_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherMapper>(
          create: (_) => WeatherMapper(),
        ),
      ],
      child: MultiProvider(
        providers: [
          Provider<WeatherService>(
            create: (_) => WeatherService(),
          ),
          Provider<GeoService>(
            create: (_) => GeoService(),
          ),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<WeatherRepository>(
              create: (context) => WeatherRepository(
                geoService: context.read<GeoService>(),
                weatherService: context.read<WeatherService>(),
                mapper: context.read<WeatherMapper>(),
              ),
            ),
            RepositoryProvider<GeoRepository>(
              create: (context) => GeoRepository(
                context.read<GeoService>(),
              ),
            ),
          ],
          child: MaterialApp(
            title: "WhatsWeather",
            initialRoute: WeatherRoutes.home,
            onGenerateRoute: (settings) => WeatherRoutes.getRoutes(settings),
            theme: ThemeData(
              fontFamily: "Lato",
            ),
            themeMode: ThemeMode.light,
          ),
        ),
      ),
    );
  }
}
