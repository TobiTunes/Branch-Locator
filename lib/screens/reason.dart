import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/maps_constants.dart';
import '../widgets/page_widgets.dart';

class ReasonForVisit extends StatefulWidget {
  const ReasonForVisit({super.key});

  @override
  State<ReasonForVisit> createState() => _ReasonForVisitState();
}

class _ReasonForVisitState extends State<ReasonForVisit> {
  Constants cb = Constants();
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(MapConstants.currentLocation);
    }
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fbnbg.jpg'), fit: BoxFit.cover)),
      child: Column(children: [
        Widgets().header(context, backB: true),
        Widgets().container(context, reasonB: true),
      ]),
    ));
  }
}
