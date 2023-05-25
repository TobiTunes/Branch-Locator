import 'package:firstbranchlocator/widgets/page_widgets.dart';
import 'package:flutter/material.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fbnbg.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Widgets().header(context, backB: true),
            Widgets().container(context, complaintsB: true),
          ],
        ),
      ),
    );
  }
}
