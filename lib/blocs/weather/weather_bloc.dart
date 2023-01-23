import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_weather/errors/repository_error.dart';
import 'package:whats_weather/models/weather_day.dart';
import 'package:whats_weather/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(LoadingWeatherState()) {
    on<FetchWeatherEvent>(_onFetch);
  }

  FutureOr<void> _onFetch(WeatherEvent event, Emitter emit) async {
    emit(LoadingWeatherState());

    try {
      final WeatherDay weatherDay = await weatherRepository.fetchDayData();

      emit(LoadedWeatherState(weatherDay));
    } on RepositoryError catch (e) {
      emit(ErrorWeatherState(e.message));
    }
  }

  void getWeatherData() => add(FetchWeatherEvent());
}
