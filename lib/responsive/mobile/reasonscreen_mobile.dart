import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/maps_constants.dart';
import '../../widgets/page_widgets.dart';

class ReasonBody extends StatefulWidget {
  const ReasonBody({super.key});

  @override
  State<ReasonBody> createState() => ReasonBodyState();
}

class ReasonBodyState extends State<ReasonBody> {
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
