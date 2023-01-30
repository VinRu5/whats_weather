part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final PositionCity? position;
  final DateTime? date;

  const FetchWeatherEvent({this.date, this.position});
}
