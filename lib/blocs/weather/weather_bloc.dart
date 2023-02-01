import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_weather/errors/repository_error.dart';
import 'package:whats_weather/models/position_city.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/repositories/geo_repository.dart';
import 'package:whats_weather/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  final GeoRepository geoRepository;

  WeatherBloc(
    this.weatherRepository,
    this.geoRepository,
  ) : super(LoadingWeatherState()) {
    on<FetchWeatherEvent>(_onFetch);
  }

  FutureOr<void> _onFetch(FetchWeatherEvent event, Emitter emit) async {
    emit(LoadingWeatherState());

    try {
      final WeatherDay weatherDay =
          await weatherRepository.fetchDayData(event.date, event.position);
      final String nameCity = await geoRepository.getAddress(event.position);

      emit(LoadedWeatherState(weatherDay, nameCity));
    } on RepositoryError catch (e) {
      emit(ErrorWeatherState(e.message));
    }
  }

  void getWeatherData({
    DateTime? date,
    PositionCity? position,
  }) =>
      add(
        FetchWeatherEvent(
          position: position,
          date: date,
        ),
      );
}
