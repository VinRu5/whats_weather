import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_weather/routes/weather_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsWeather",
      initialRoute: WeatherRoutes.home,
      onGenerateRoute: (settings) => WeatherRoutes.getRoutes(settings),
    );
  }
}
