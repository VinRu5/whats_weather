import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whats_weather/errors/repository_error.dart';
import 'package:whats_weather/errors/service_error.dart';
import 'package:whats_weather/models/position_city.dart';
import 'package:whats_weather/services/geo_services.dart';
import 'package:whats_weather/store/centralize_data.dart';

class GeoRepository {
  final GeoService geoService;

  GeoRepository(this.geoService);

  Future<String> getAddress([PositionCity? positionCity]) async {
    Position? myPosition;

    if (positionCity == null) {
      try {
        myPosition = await geoService.determinePosition();
      } catch (e) {
        positionCity = PositionCity(
          latitude: 41.8892943,
          longitude: 12.4935467,
          cityName: "Roma",
        );
      }
    }

    final List<Placemark> placemarks = await geoService.getPlacemarks(
      (positionCity != null ? positionCity.latitude : myPosition?.latitude) ??
          0.0,
      (positionCity != null ? positionCity.longitude : myPosition?.longitude) ??
          0.0,
    );

    CentralizeData.instance.myPosition = PositionCity(
      latitude: (positionCity != null
              ? positionCity.latitude
              : myPosition?.latitude) ??
          0.0,
      longitude: (positionCity != null
              ? positionCity.longitude
              : myPosition?.longitude) ??
          0.0,
      cityName: placemarks[0].locality ?? 'N/D',
    );

    return placemarks[0].locality ?? 'N/D';
  }

  Future<PositionCity> getPositionFromCityName(String cityName) async {
    List<Location> locations = [];

    try {
      locations = await geoService.getLocationFromAddress(cityName);
    } on ServiceError catch (e) {
      throw RepositoryError(e.message);
    }

    return PositionCity(
      cityName: cityName,
      latitude: locations[0].latitude,
      longitude: locations[0].longitude,
    );
  }
}
