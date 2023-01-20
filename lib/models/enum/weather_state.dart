import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WeatherState {
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

extension WeatherStateExtension on WeatherState {
  String get stateText {
    switch (this) {
      case WeatherState.notDeterminate:
        return "Non disponibile";
      case WeatherState.clearSky:
        return "Cielo limpido";
      case WeatherState.lightClouds:
        return "Leggermente nuvoloso";
      case WeatherState.partlyCloudy:
        return "Parzialmente nuvoloso";
      case WeatherState.cloudy:
        return "Nuvoloso";
      case WeatherState.rain:
        return "Pioggia";
      case WeatherState.rainAndSnow:
        return "Pioggia e neve";
      case WeatherState.snow:
        return "Neve";
      case WeatherState.rainShower:
        return "Pioggia abbondante";
      case WeatherState.snowShower:
        return "Neve abbondante";
      case WeatherState.sleetShower:
        return "Nevischio abbondante";
      case WeatherState.ligthFog:
        return "Nebbia leggera";
      case WeatherState.denseFog:
        return "Nebbia fitta";
      case WeatherState.freezingRain:
        return "Pioggia ghiacciata";
      case WeatherState.thunderstorms:
        return "Temporale";
      case WeatherState.drizzle:
        return "Pioggia leggerissima";
      case WeatherState.sandstorm:
        return "Tempesta di sabbia";
      default:
        return "Non disponibile";
    }
  }

  IconData image(bool isNight) {
    switch (this) {
      case WeatherState.notDeterminate:
        return FontAwesomeIcons.question;
      case WeatherState.clearSky:
        return isNight ? FontAwesomeIcons.moon : FontAwesomeIcons.sun;
      case WeatherState.lightClouds:
        return isNight ? FontAwesomeIcons.cloudMoon : FontAwesomeIcons.cloudSun;
      case WeatherState.partlyCloudy:
        return isNight ? FontAwesomeIcons.cloudMoon : FontAwesomeIcons.cloudSun;
      case WeatherState.cloudy:
        return FontAwesomeIcons.cloud;
      case WeatherState.rain:
        return FontAwesomeIcons.cloudRain;
      case WeatherState.rainAndSnow:
        return FontAwesomeIcons.cloudMeatball;
      case WeatherState.snow:
        return FontAwesomeIcons.snowflake;
      case WeatherState.rainShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherState.snowShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherState.sleetShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherState.ligthFog:
        return FontAwesomeIcons.minus;
      case WeatherState.denseFog:
        return FontAwesomeIcons.minus;
      case WeatherState.freezingRain:
        return FontAwesomeIcons.cloudMeatball;
      case WeatherState.thunderstorms:
        return FontAwesomeIcons.cloudBolt;
      case WeatherState.drizzle:
        return FontAwesomeIcons.cloudRain;
      case WeatherState.sandstorm:
        return FontAwesomeIcons.soundcloud;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
