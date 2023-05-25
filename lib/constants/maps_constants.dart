// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapConstants {
  Location location = Location();

  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiZGV2LXR1bmVzIiwiYSI6ImNsaHEwcmhtajAxYmEza21wNGsxcTJ4MGEifQ.dY2x9ndQYia7X340LXFCyw';

  static const String mapStyleId = 'clht0e6za021u01qu90a2h47p';

  static const String url =
      "https://api.mapbox.com/styles/v1/dev-tunes/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  // The three above go together for the dark map style

  // The three below go together for the normal map
  static const String accessToken =
      'pk.eyJ1IjoiZGV2LXR1bmVzIiwiYSI6ImNsaHEwanloOTF3bm4zbG9keWMyN2lxZmYifQ.3rGtwb3VcREnhLEOydctVA';

  static const String id = 'mapbox.mapbox-streets-v8';

  static const String styleId = 'clhq4udar01v301qu72umauil';

  static const String urlTemp =
      "https://api.mapbox.com/styles/v1/dev-tunes/{styleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";

  static final myLocation = LatLng(6.4921, 3.3562);

  // LocationData? currentLocation;
  static LatLng currentLocation = LatLng(0, 0);
}
