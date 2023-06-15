// import 'package:firstbranchlocator/constants/maps_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

class MarkersMap {
  final String? image;
  final String? title;
  final String? address;
  final LatLng? location;

  MarkersMap(
      {required this.image,
      required this.title,
      required this.address,
      required this.location});
}

final mapMarkers = [
  // MarkersMap(
  //     image: '',
  //     title: 'Current Location',
  //     address: 'Nill',
  //     location: MapConstants.currentLocation),
  MarkersMap(
      image: 'images/fbn-map-image.jpg',
      title: 'Iganmu Branch',
      address: '2, ABEBE VILLAGE ROAD',
      location: LatLng(6.490665, 3.356246)),
  MarkersMap(
      image: 'images/fbn-map-image.jpg',
      title: 'Adeniran Ogunsanya Branch',
      address: '84, Adeniran Ogunsanya Street, Surulere',
      location: LatLng(6.502057, 3.352403)),
  MarkersMap(
      image: 'images/fbn-map-image.jpg',
      title: 'Surulere Branch',
      address: 'Adeniran Ogunsanya Street, Surulere',
      location: LatLng(6.502208, 3.352695)),
  MarkersMap(
      image: 'images/fbn-map-image.jpg',
      title: 'Ojuelegba Branch',
      address: '82, Ojuelegba Road, Ojuelegba, Surulere',
      location: LatLng(6.505735, 3.357889)),
  MarkersMap(
      image: 'images/fbn-map-image.jpg',
      title: 'Bode Thomas Branch',
      address: '72, Bode Thomas Street, Surulere',
      location: LatLng(6.506145, 3.356244)),
];
