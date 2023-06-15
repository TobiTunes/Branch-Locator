import 'package:flutter/material.dart';
import '../../widgets/page_widgets.dart';

class ClosestBranchesBody extends StatefulWidget {
  const ClosestBranchesBody({Key? key}) : super(key: key);

  @override
  State<ClosestBranchesBody> createState() => _ClosestBranchesState();
}

class _ClosestBranchesState extends State<ClosestBranchesBody> {
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
