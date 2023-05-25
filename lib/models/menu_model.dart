import 'package:firstbranchlocator/constants/maps_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

import '../constants/colors.dart';
import '../screens/reason.dart';

class MenuGrid extends StatefulWidget {
  final List<IconData> iconData;
  final List<String> iconNames;

  const MenuGrid({super.key, required this.iconData, required this.iconNames});

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  Location location = Location();

  Future<void> getLocationPermission(BuildContext context) async {
    final hasPermission = await location.hasPermission();
    if (hasPermission == PermissionStatus.granted) {
      final loctionData = await location.getLocation();
      setState(() {
        MapConstants.currentLocation =
            LatLng(loctionData.latitude ?? 0, loctionData.longitude ?? 0);
      });
      if (kDebugMode) {
        print('Permission already granted');
        print(MapConstants.currentLocation);
        print('This');
      }
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ReasonForVisit()));
      // Checks if the user has granted the permission before
    } else {
      final requestPermission = await location.requestPermission();
      if (requestPermission != PermissionStatus.granted) {
        if (kDebugMode) {
          print('Permission denied');
        }
        return;
        // User did not grant the permission
      } else {
        final loctionData = await location.getLocation();
        setState(() {
          MapConstants.currentLocation =
              LatLng(loctionData.latitude ?? 0.0, loctionData.longitude ?? 0.0);
        });
        if (kDebugMode) {
          print('Permission granted');
          print(MapConstants.currentLocation);
          print('This');
        }
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ReasonForVisit()));
        // Go to next screen here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: const EdgeInsets.only(top: 20),
    //   width:
    //       MediaQuery.of(context).size.width * .8, // Take up the available width
    //   child: GridView.count(
    //     crossAxisCount: 3,
    //     shrinkWrap:
    //         true, // Allow the GridView to adjust its size based on its content
    //     physics: const NeverScrollableScrollPhysics(), // Disable scrolling
    //     children: List.generate(widget.iconData.length, (index) {
    //       return Card(
    //         color: AppColors().cardColor,
    //         child: InkWell(
    //           onTap: () async {
    //             if (index == 6) {
    //               await getLocationPermission(context);
    //             }
    //           },
    //           child: Padding(
    //             padding: const EdgeInsets.only(top: 10, bottom: 10.0),
    //             child: Center(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   FaIcon(widget.iconData[index],
    //                       color: Colors.yellow, size: 24),
    //                   const SizedBox(height: 10),
    //                   Expanded(
    //                     child: Text(
    //                       widget.iconNames[index],
    //                       textAlign: TextAlign.center,
    //                       style: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     }),
    //   ),
    // );
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width * .8,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(widget.iconData.length, (index) {
          return SizedBox(
            child: Card(
              color: AppColors().cardColor,
              child: InkWell(
                onTap: () async {
                  if (index == 6) {
                    await getLocationPermission(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 4, right: 4, bottom: 4),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(widget.iconData[index],
                            color: Colors.yellow, size: 24),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                widget.iconNames[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
