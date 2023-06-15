import 'package:firstbranchlocator/screens/closest_branches.dart';
import 'package:firstbranchlocator/screens/maps.dart';
import 'package:firstbranchlocator/widgets/show_dialog_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReasonForVisitingModel extends StatefulWidget {
  final List<String> textMsg;
  final List<IconData> iconData;

  const ReasonForVisitingModel(
      {super.key, required this.textMsg, required this.iconData});

  @override
  State<ReasonForVisitingModel> createState() => _ReasonForVisitingModelState();
}

class _ReasonForVisitingModelState extends State<ReasonForVisitingModel> {
  @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: textMsg.asMap().entries.map((entry) {
  //       final index = entry.key;
  //       final text = entry.value;
  //       return SizedBox(
  //         child: Card(
  //           color: Colors.white,
  //           child: InkWell(
  //             onTap: () {
  //               _gotoNextScreen(context, index);
  //             },
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     child: Text(text,
  //                         style: const TextStyle(
  //                             color: Colors.black87, fontSize: 16)),
  //                   ),
  //                   // const FaIcon(FontAwesomeIcons.chevronRight,
  //                   //     color: Colors.black87),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }

  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: SingleChildScrollView(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 2,
            crossAxisCount: 3,
            children: List.generate(widget.textMsg.length, (index) {
              return GestureDetector(
                onTap: () {
                  _gotoNextScreen(context, index);
                },
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FaIcon(widget.iconData[index],
                                    color: Colors.yellow, size: 30),
                              ]),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.textMsg[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  _gotoNextScreen(BuildContext context, index) {
    // print(textMsg[index]);
    // print(index);
    if (index == 1) {
      // || index == 5
      if (kDebugMode) {
        print(widget.textMsg[index]);
      }
      ShowBoxDialog().showDecisionDialog(context);
    } else if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const MapsScreen())));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const ClosestBranches())));
    }
  }
}
