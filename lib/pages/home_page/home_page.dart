import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_weather/services/geo_services.dart';
import 'package:whats_weather/services/network/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    GeoServices()
      ..determinePosition().then((value) {
        print(value);
      });
    final DateTime today = DateTime.now();
    final DateTime endWeek = today.add(const Duration(days: 1));
    WeatherService()
      ..getWeather(
        today,
        endWeek,
        52.520551,
        13.461804,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HOME"),
      ),
    );
  }
}
