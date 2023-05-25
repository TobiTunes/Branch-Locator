import 'package:flutter/material.dart';
import '../widgets/page_widgets.dart';

class ClosestBranches extends StatefulWidget {
  const ClosestBranches({Key? key}) : super(key: key);

  @override
  State<ClosestBranches> createState() => _ClosestBranchesState();
}

class _ClosestBranchesState extends State<ClosestBranches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fbnbg.jpg'), fit: BoxFit.cover)),
      child: Column(children: [
        Widgets().header(context, backB: true),
        Widgets().container(context, closestB: true),
      ]),
    ));
  }
}
