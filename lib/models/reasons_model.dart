import 'package:firstbranchlocator/screens/closest_branches.dart';
import 'package:firstbranchlocator/screens/maps.dart';
import 'package:firstbranchlocator/widgets/show_dialog_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReasonForVisitingModel extends StatelessWidget {
  final List<String> textMsg;

  const ReasonForVisitingModel({super.key, required this.textMsg});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: textMsg.asMap().entries.map((entry) {
        final index = entry.key;
        final text = entry.value;
        return SizedBox(
          child: Card(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                _gotoNextScreen(context, index);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(text,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 16)),
                    ),
                    // const FaIcon(FontAwesomeIcons.chevronRight,
                    //     color: Colors.black87),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  _gotoNextScreen(BuildContext context, index) {
    // print(textMsg[index]);
    // print(index);
    if (index == 1) {
      // || index == 5
      if (kDebugMode) {
        print(textMsg[index]);
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
