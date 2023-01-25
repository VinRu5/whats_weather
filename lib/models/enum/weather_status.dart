import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_weather/misc/painter/weather_icons/cloud.dart';
import 'package:whats_weather/misc/painter/weather_icons/cloud_question.dart';
import 'package:whats_weather/misc/painter/weather_icons/cloud_sun.dart';
import 'package:whats_weather/misc/painter/weather_icons/fog.dart';
import 'package:whats_weather/misc/painter/weather_icons/moon.dart';
import 'package:whats_weather/misc/painter/weather_icons/rain.dart';
import 'package:whats_weather/misc/painter/weather_icons/rain_snow.dart';
import 'package:whats_weather/misc/painter/weather_icons/snow.dart';
import 'package:whats_weather/misc/painter/weather_icons/sun.dart';
import 'package:whats_weather/misc/painter/weather_icons/thunderstorm.dart';
import 'package:whats_weather/theme/weather_theme.dart';

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

  CustomPainter image(bool isNight, [bool isHot = false]) {
    switch (this) {
      case WeatherStatus.notDeterminate:
        return CloudQuestion();
      case WeatherStatus.clearSky:
        return isNight
            ? Moon()
            : Sun(
                isHot ? WeatherTheme.orange : WeatherTheme.yellow,
              );
      case WeatherStatus.lightClouds:
        return isNight ? Cloud() : CloudSun();
      case WeatherStatus.partlyCloudy:
        return isNight ? Cloud() : CloudSun();
      case WeatherStatus.cloudy:
        return Cloud();
      case WeatherStatus.rain:
        return Rain();
      case WeatherStatus.rainAndSnow:
        return RainSnow();
      case WeatherStatus.snow:
        return Snow();
      case WeatherStatus.rainShower:
        return Rain();
      case WeatherStatus.snowShower:
        return RainSnow();
      case WeatherStatus.sleetShower:
        return Rain();
      case WeatherStatus.ligthFog:
        return Fog();
      case WeatherStatus.denseFog:
        return Fog();
      case WeatherStatus.freezingRain:
        return RainSnow();
      case WeatherStatus.thunderstorms:
        return Thunderstorm();
      case WeatherStatus.drizzle:
        return Rain();
      case WeatherStatus.sandstorm:
        return Fog();
      default:
        return CloudQuestion();
    }
  }
}
