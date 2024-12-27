import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission() async {
  LocationPermission permission;
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return false;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    await Geolocator.openAppSettings();
    return false;
  }

  return true;
}
