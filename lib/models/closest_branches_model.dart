// import 'package:firstbranchlocator/screens/complaints.dart';
import 'package:firstbranchlocator/screens/maps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';

class ClosestBranchesModel extends StatelessWidget {
  final List<BranchDetails> branchList;

  const ClosestBranchesModel({super.key, required this.branchList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: branchList.length,
        itemBuilder: (BuildContext context, int index) {
          final branch = branchList[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
            child: Card(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapsScreen()),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              branch.branchName,
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 59, 101, 1),
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              branch.location,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              branch.city,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.compass,
                            color: Colors.amber[400],
                          ),
                          Text(
                            branch.distance,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: ((context) => const Complaints())));
                      //   },
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       FaIcon(
                      //         Icons.report,
                      //         size: 28,
                      //         color: Colors.red[400],
                      //       ),
                      //       const Text(
                      //         "Report",
                      //         style: TextStyle(
                      //           color: Colors.black87,
                      //           fontSize: 14,
                      //           letterSpacing: 1,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
