import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WeatherStateSymbol {
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

extension WeatherStateExtension on WeatherStateSymbol {
  String get stateText {
    switch (this) {
      case WeatherStateSymbol.notDeterminate:
        return "Non disponibile";
      case WeatherStateSymbol.clearSky:
        return "Cielo limpido";
      case WeatherStateSymbol.lightClouds:
        return "Leggermente nuvoloso";
      case WeatherStateSymbol.partlyCloudy:
        return "Parzialmente nuvoloso";
      case WeatherStateSymbol.cloudy:
        return "Nuvoloso";
      case WeatherStateSymbol.rain:
        return "Pioggia";
      case WeatherStateSymbol.rainAndSnow:
        return "Pioggia e neve";
      case WeatherStateSymbol.snow:
        return "Neve";
      case WeatherStateSymbol.rainShower:
        return "Pioggia abbondante";
      case WeatherStateSymbol.snowShower:
        return "Neve abbondante";
      case WeatherStateSymbol.sleetShower:
        return "Nevischio abbondante";
      case WeatherStateSymbol.ligthFog:
        return "Nebbia leggera";
      case WeatherStateSymbol.denseFog:
        return "Nebbia fitta";
      case WeatherStateSymbol.freezingRain:
        return "Pioggia ghiacciata";
      case WeatherStateSymbol.thunderstorms:
        return "Temporale";
      case WeatherStateSymbol.drizzle:
        return "Pioggia leggerissima";
      case WeatherStateSymbol.sandstorm:
        return "Tempesta di sabbia";
      default:
        return "Non disponibile";
    }
  }

  IconData image(bool isNight) {
    switch (this) {
      case WeatherStateSymbol.notDeterminate:
        return FontAwesomeIcons.question;
      case WeatherStateSymbol.clearSky:
        return isNight ? FontAwesomeIcons.moon : FontAwesomeIcons.sun;
      case WeatherStateSymbol.lightClouds:
        return isNight ? FontAwesomeIcons.cloudMoon : FontAwesomeIcons.cloudSun;
      case WeatherStateSymbol.partlyCloudy:
        return isNight ? FontAwesomeIcons.cloudMoon : FontAwesomeIcons.cloudSun;
      case WeatherStateSymbol.cloudy:
        return FontAwesomeIcons.cloud;
      case WeatherStateSymbol.rain:
        return FontAwesomeIcons.cloudRain;
      case WeatherStateSymbol.rainAndSnow:
        return FontAwesomeIcons.cloudMeatball;
      case WeatherStateSymbol.snow:
        return FontAwesomeIcons.snowflake;
      case WeatherStateSymbol.rainShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherStateSymbol.snowShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherStateSymbol.sleetShower:
        return isNight
            ? FontAwesomeIcons.cloudMoonRain
            : FontAwesomeIcons.cloudSunRain;
      case WeatherStateSymbol.ligthFog:
        return FontAwesomeIcons.minus;
      case WeatherStateSymbol.denseFog:
        return FontAwesomeIcons.minus;
      case WeatherStateSymbol.freezingRain:
        return FontAwesomeIcons.cloudMeatball;
      case WeatherStateSymbol.thunderstorms:
        return FontAwesomeIcons.cloudBolt;
      case WeatherStateSymbol.drizzle:
        return FontAwesomeIcons.cloudRain;
      case WeatherStateSymbol.sandstorm:
        return FontAwesomeIcons.soundcloud;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
