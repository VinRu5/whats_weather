import 'package:equatable/equatable.dart';

class WeatherDataModel extends Equatable {
  final DateTime date;
  final num value;

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
