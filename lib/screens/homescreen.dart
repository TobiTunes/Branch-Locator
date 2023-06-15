import 'package:firstbranchlocator/responsive/desktop/desktop_body.dart';
import 'package:firstbranchlocator/responsive/mobile/homescreen_mobile.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: HomeScreenBody(), desktopBody: const DesktopBody());
  }
}
