import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

import '../constants/map_markers.dart';
import '../constants/maps_constants.dart';
import '../widgets/appbar_backbutton.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> with TickerProviderStateMixin {
  final pageController = PageController();
  int selectedIndex = 0;
  LatLng currentLocation = MapConstants.myLocation;
  // LatLng currentLocation = MapConstants.currentLocation;
  LatLng mapCenter = MapConstants.myLocation;
  late final MapController mapController;
  List<Polyline> polylines = [];

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  // Future<void> calculateMidpoint(LatLng locationData) async {
  //   setState(() {
  //     mapCenter = getMidpoint(locationData, currentLocation);
  //   });
  // }

  // LatLng getMidpoint(LatLng location1, LatLng location2) {
  //   final double avgLat = (location1.latitude + location2.latitude) / 2;
  //   final double avgLng = (location1.longitude + location2.longitude) / 2;
  //   print('The mid point is ');
  //   print(LatLng(avgLat, avgLng));
  //   return LatLng(avgLat, avgLng);
  // }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(currentLocation);
    }
    void animatedMapMove(LatLng destLocation, double destZoom) {
      // Create some tweens. These serve to split up the transition from one location to another.
      // In our case, we want to split the transition be<tween> our current map center and the destination.
      final latTween = Tween<double>(
          begin: mapController.center.latitude, end: destLocation.latitude);
      final lngTween = Tween<double>(
          begin: mapController.center.longitude, end: destLocation.longitude);
      final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

      // Create a animation controller that has a duration and a TickerProvider.
      var controller = AnimationController(
          duration: const Duration(milliseconds: 1000), vsync: this);
      // The animation determines what path the animation will take. You can try different Curves values, although I found
      // fastOutSlowIn to be my favorite.
      Animation<double> animation =
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

      controller.addListener(() {
        mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation),
        );
      });

      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        } else if (status == AnimationStatus.dismissed) {
          controller.dispose();
        }
      });

      controller.forward();
    }

    return Scaffold(
      appBar: AppbarBackButton().backButtonAppbar(context),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: mapCenter,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/dev-tunes/{styleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: {
                  'accessToken': MapConstants.accessToken,
                  'id': MapConstants.id,
                  'styleId': MapConstants.styleId
                },
              ),
              MarkerLayerOptions(markers: [
                Marker(
                    height: 80,
                    width: 80,
                    point: currentLocation,
                    builder: (_) => const Icon(
                          FontAwesomeIcons.locationPin,
                          color: Colors.blue,
                        )),
                for (int i = 0; i < mapMarkers.length; i++)
                  Marker(
                    height: 80,
                    width: 80,
                    point: mapMarkers[i].location ?? currentLocation,
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          selectedIndex = i;
                          pageController.animateToPage(i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                          mapCenter = mapMarkers[i].location ?? currentLocation;
                          // calculateMidpoint(mapMarkers[i].location!);
                          animatedMapMove(currentLocation, 15.0);
                          setState(() {});
                        },
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          scale: selectedIndex == i ? 1 : 0.7,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: selectedIndex == i ? 1 : 0.5,
                            child: const FaIcon(
                              FontAwesomeIcons.locationPin,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                  )
              ]),
              PolylineLayerOptions(polylines: polylines),
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                    points: [
                      currentLocation,
                      mapMarkers[selectedIndex].location ?? currentLocation,
                    ],
                    color: Colors.blue,
                    strokeWidth: 3.0,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                mapCenter =
                    mapMarkers[value].location ?? MapConstants.currentLocation;
                // calculateMidpoint(mapMarkers[value].location!);
                animatedMapMove(currentLocation, 15.0);
                final polyline = Polyline(
                  points: [
                    currentLocation,
                    mapMarkers[selectedIndex].location ?? currentLocation,
                  ],
                  color: Colors.blue,
                  strokeWidth: 7.0,
                );
                setState(() {
                  polylines = [polyline];
                });
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 30, 29, 29),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title ?? '',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        item.address ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image ?? '',
                                // height: 60,
                                // width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
