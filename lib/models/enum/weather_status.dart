import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WeatherStatus {
  notDeterminate,
  clearSky,
  lightClouds,
  partlyCloudy,
  cloudy,
  rain,
  rainAndSnow,
  snow,
  rainShower,
  snowShower,
  sleetShower,
  ligthFog,
  denseFog,
  freezingRain,
  thunderstorms,
  drizzle,
  sandstorm,
}

extension WeatherStatusExtension on WeatherStatus {
  String get stateText {
    switch (this) {
      case WeatherStatus.notDeterminate:
        return "Non disponibile";
      case WeatherStatus.clearSky:
        return "Cielo limpido";
      case WeatherStatus.lightClouds:
        return "Leggermente nuvoloso";
      case WeatherStatus.partlyCloudy:
        return "Parzialmente nuvoloso";
      case WeatherStatus.cloudy:
        return "Nuvoloso";
      case WeatherStatus.rain:
        return "Pioggia";
      case WeatherStatus.rainAndSnow:
        return "Pioggia e neve";
      case WeatherStatus.snow:
        return "Neve";
      case WeatherStatus.rainShower:
        return "Pioggia abbondante";
      case WeatherStatus.snowShower:
        return "Neve abbondante";
      case WeatherStatus.sleetShower:
        return "Nevischio abbondante";
      case WeatherStatus.ligthFog:
        return "Nebbia leggera";
      case WeatherStatus.denseFog:
        return "Nebbia fitta";
      case WeatherStatus.freezingRain:
        return "Pioggia ghiacciata";
      case WeatherStatus.thunderstorms:
        return "Temporale";
      case WeatherStatus.drizzle:
        return "Pioggia leggerissima";
      case WeatherStatus.sandstorm:
        return "Tempesta di sabbia";
      default:
        return "Non disponibile";
    }
  }

  IconData image(bool isNight) {
    switch (this) {
      case WeatherStatus.notDeterminate:
        return FontAwesomeIcons.question;
      case WeatherStatus.clearSky:
        return isNight ? FontAwesomeIcons.moon : FontAwesomeIcons.sun;
      case WeatherStatus.lightClouds:
        return isNight ? FontAwesomeIcons.cloudMoon : FontAwesomeIcons.cloudSun;
      case WeatherStatus.partlyCloudy:
        return isNight ? FontAwesomeIcons.cloudMoon : FontAwesomeIcons.cloudSun;
      case WeatherStatus.cloudy:
        return FontAwesomeIcons.cloud;
      case WeatherStatus.rain:
        return FontAwesomeIcons.cloudRain;
      case WeatherStatus.rainAndSnow:
        return FontAwesomeIcons.cloudMeatball;
      case WeatherStatus.snow:
        return FontAwesomeIcons.snowflake;
      case WeatherStatus.rainShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherStatus.snowShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherStatus.sleetShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherStatus.ligthFog:
        return FontAwesomeIcons.minus;
      case WeatherStatus.denseFog:
        return FontAwesomeIcons.minus;
      case WeatherStatus.freezingRain:
        return FontAwesomeIcons.cloudMeatball;
      case WeatherStatus.thunderstorms:
        return FontAwesomeIcons.cloudBolt;
      case WeatherStatus.drizzle:
        return FontAwesomeIcons.cloudRain;
      case WeatherStatus.sandstorm:
        return FontAwesomeIcons.soundcloud;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
