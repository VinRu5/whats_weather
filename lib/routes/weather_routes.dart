import 'package:flutter/material.dart';
import 'package:whats_weather/pages/home_page/home_page.dart';

class WeatherRoutes {
  /// Nomi delle rotte dell'app
  static const home = "home";

  /// generatore di Rotte
  static getRoutes(settings) {
    /// Rotte dell'app
    final routes = {
      home: (_) => const HomePage(),
      // ImageDetails.route: (_) =>
      //     ImageDetails(arg: settings.arguments as ImageDetailsArg),
    };

    return MaterialPageRoute(builder: routes[settings.name]!);
  }
}
