import 'package:firstbranchlocator/models/complaints_model.dart';
import 'package:firstbranchlocator/models/reasons_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';
import '../models/closest_branches_model.dart';

// late BuildContext _context;
final List<String> items = [
  'Valid means of identification',
  '2 Passport Photographs',
  'Utility Bill',
];

class Widgets {
  header(BuildContext context, {bool backB = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: backB, // The boolean condition
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
                size: 20,
              ),
            ), // The widget to display if the condition is true
          ),
          const Expanded(
            child: Image(
              image: AssetImage('images/fbn-logo.png'),
              width: 100,
              height: 80,
            ),
          ),
          const Icon(
            FontAwesomeIcons.bell,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }

  container(BuildContext context,
      {bool reasonB = false, bool closestB = false, bool complaintsB = false}) {
    // double h = MediaQuery.of(context).size.height * .7;
    double w = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30, right: 3, left: 3),
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        width: w,
        color: const Color.fromRGBO(217, 217, 217, 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Visibility(
          //   visible: reasonB, // The boolean condition
          //   child: Text(Constants().reasonVisit,
          //       textAlign: TextAlign.left,
          //       style: const TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black87,
          //       )), // The widget to display if the condition is true
          // ),
          Visibility(
            visible: closestB, // The boolean condition
            child: Text(Constants().advisedDocuments,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                )), // The widget to display if the condition is true
          ),
          Visibility(
            visible: complaintsB, // The boolean condition
            child: Text(Constants().complaints,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                )), // The widget to display if the condition is true
          ),
          // Text(reasonB ? Constants().reasonVisit : Constants().advisedDocuments,
          //     textAlign: TextAlign.left,
          //     style: const TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black87,
          //     )),
          // Visibility(
          //   visible: closestB, // The boolean condition
          //   child: ListView.builder(
          //     itemCount: items.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading:
          //             const Icon(Icons.brightness_1, size: 8), // Bullet icon
          //         title: Text(items[index]), // String item
          //       );
          //     },
          //   ), // The widget to display if the condition is true
          // ),
          Visibility(
              visible: closestB,
              child: const SizedBox(
                height: 10,
              )),
          Visibility(
              visible: closestB, // The boolean condition
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Valid means of identification',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2 Passport Photographs',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 6),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Utility Bill',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ) // The widget to display if the condition is true
              ),
          const SizedBox(height: 10),
          Visibility(
            visible: reasonB, // The boolean condition
            child: ReasonForVisitingModel(
                textMsg: Constants()
                    .textMsg), // The widget to display if the condition is true
          ),
          Visibility(
            visible: closestB, // The boolean condition
            child: ClosestBranchesModel(
              branchList: Constants().cardList,
            ), // The widget to display if the condition is true
          ),
          Visibility(
            visible: complaintsB, // The boolean condition
            child:
                const ComplaintsModel(), // The widget to display if the condition is true
          ),
          // reasonB
          //     ? ReasonForVisitingModel(textMsg: Constants().textMsg)
          //     : ClosestBranchesModel(
          //         branchList: Constants().cardList,
          //       ),
        ]),
      ),
    );
  }
}
