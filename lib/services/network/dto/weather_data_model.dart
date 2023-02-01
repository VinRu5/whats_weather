import 'package:equatable/equatable.dart';

class WeatherDataModel<T> extends Equatable {
  final DateTime date;
  final T value;

  const WeatherDataModel({
    required this.date,
    required this.value,
  });

  @override
  List<Object?> get props => [
        date,
        value,
      ];
}
