import 'package:firstbranchlocator/responsive/desktop/desktop_body.dart';
import 'package:flutter/material.dart';

import '../responsive/mobile/closestbranches_mobile.dart';
import '../responsive/responsive_layout.dart';

class ClosestBranches extends StatefulWidget {
  const ClosestBranches({super.key});

  @override
  State<ClosestBranches> createState() => ClosestBranchesState();
}

class ClosestBranchesState extends State<ClosestBranches> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: ClosestBranchesBody(), desktopBody: DesktopBody());
  }
}
