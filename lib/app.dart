import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_weather/routes/weather_routes.dart';
import 'package:whats_weather/services/network/weather_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherService>(
          create: (_) => WeatherService(),
        ),
      ],
      child: MaterialApp(
        title: "WhatsWeather",
        initialRoute: WeatherRoutes.home,
        onGenerateRoute: (settings) => WeatherRoutes.getRoutes(settings),
        theme: ThemeData(fontFamily: "Lato"),
      ),
    );
  }
}
