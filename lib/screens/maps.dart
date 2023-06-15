import 'package:firstbranchlocator/responsive/desktop/desktop_body.dart';
import 'package:firstbranchlocator/responsive/mobile/maps_mobile.dart';
import 'package:flutter/material.dart';
import '../responsive/responsive_layout.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: MapsScreenBody(), desktopBody: DesktopBody());
  }
}
