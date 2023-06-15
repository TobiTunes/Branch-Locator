import 'package:firstbranchlocator/responsive/desktop/desktop_body.dart';
import 'package:firstbranchlocator/responsive/mobile/reasonscreen_mobile.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';

class ReasonForVisit extends StatefulWidget {
  const ReasonForVisit({super.key});

  @override
  State<ReasonForVisit> createState() => _ReasonForVisitState();
}

class _ReasonForVisitState extends State<ReasonForVisit> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: ReasonBody(), desktopBody: DesktopBody());
  }
}
