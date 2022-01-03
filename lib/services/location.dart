import 'dart:io';
import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<void> getPermission() async {
    try {
      LocationPermission per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied ||
          per == LocationPermission.deniedForever) {
        LocationPermission per1 = await Geolocator.requestPermission();
      } else {
        Position currentLoc = await Geolocator.getCurrentPosition(
            // current Location is "currentLoc"
            desiredAccuracy: LocationAccuracy.best);
      }
    } catch (e) {
      Duration _3sec = Duration(seconds: 3);
      sleep(_3sec);
      getPermission();
    }
  }

  Future<void> getLocation() async {
    try {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      longitude = currentLoc.longitude;
      latitude = currentLoc.latitude;
    } catch (e) {
      longitude = 0;
      latitude = 0;
    }
  }
}
