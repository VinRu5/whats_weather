import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_weather/services/network/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final DateTime today = DateTime.now();
    final DateTime endWeek = today.add(const Duration(days: 1));
    WeatherService()..getWeather(today, endWeek);
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
