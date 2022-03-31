
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    latitude = position.latitude;
    longitude = position.longitude;
  }
}