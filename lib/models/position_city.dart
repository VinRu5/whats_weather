import 'package:equatable/equatable.dart';

class PositionCity extends Equatable {
  double? latitude, longitude;
  String? cityName;

  PositionCity({
    this.latitude,
    this.longitude,
    this.cityName,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        cityName,
      ];
}
