// import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

class GetLocationService {
  final Location _location = Location();

  Future<LocationData?> getCurrentLocation() async {
    final hasPermission = await _location.hasPermission();
    if (hasPermission == PermissionStatus.granted) {
      final locationData = await _location.getLocation();
      return locationData;
    } else {
      return null;
    }
  }
}
