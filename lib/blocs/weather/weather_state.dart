part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherDay weatherDay;
  final String cityName;

  const LoadedWeatherState(this.weatherDay, this.cityName);

  @override
  List<Object> get props => [weatherDay];
}

class NoWeatherState extends WeatherState {}

class ErrorWeatherState extends WeatherState {
  final String? errorMessage;

  const ErrorWeatherState([this.errorMessage]);

  @override
  List<Object> get props => [
        [errorMessage]
      ];
}
