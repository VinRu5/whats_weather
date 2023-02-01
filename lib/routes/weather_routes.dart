import 'package:flutter/material.dart';
import 'package:whats_weather/models/args/details_page_args.dart';
import 'package:whats_weather/pages/details_page/details_page.dart';
import 'package:whats_weather/pages/home_page/home_page.dart';

class WeatherRoutes {
  /// Nomi delle rotte dell'app
  static const home = "home";
  static const details = "details_day";

  /// generatore di Rotte
  static getRoutes(RouteSettings settings) {
    /// Rotte dell'app
    final routes = {
      home: (_) => const HomePage(),
      details: (_) => DetailsPage(
            args: settings.arguments as DetailsPageArgs,
          ),
    };

    return MaterialPageRoute(builder: routes[settings.name]!);
  }
}
