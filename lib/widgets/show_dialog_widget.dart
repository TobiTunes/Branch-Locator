import 'package:firstbranchlocator/screens/closest_branches.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';

class ShowBoxDialog {
  // String url = Constants().url;
  Uri uri = Uri.parse(
      "https://www.firstbanknigeria.com/personal/accounts/diaspora/account-opening/");

  showDecisionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(Constants().acctOpenHead),
          content: Text(Constants().acctOpenQues),
          actions: [
            TextButton(
              onPressed: () {
                _launchUrl(context);
              },
              child: Text(Constants().acctOpenOnline),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ClosestBranches())));
              },
              child: Text(Constants().acctOpenBranch),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            // GestureDetector(
            //   onTap: () => Navigator.pop(dialogContext),
            //   child: const FaIcon(
            //     FontAwesomeIcons.xmark,
            //     color: Colors.red,
            //   ),
            // ),
            // const SizedBox(width: 20),
          ],
        );
      },
    );
  }

  _launchUrl(BuildContext context) async {
    final Uri url = Uri.parse(Constants().url);
    if (!await launchUrl(url)) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      throw Exception('Failed to launch');
    }
  }
}
