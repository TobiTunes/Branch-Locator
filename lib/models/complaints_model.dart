import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ComplaintsModel extends StatefulWidget {
  const ComplaintsModel({super.key});

  @override
  State<ComplaintsModel> createState() => _ComplaintsModelState();
}

class _ComplaintsModelState extends State<ComplaintsModel> {
  final List<String> dropdownItems = Constants().complaintMsg;

  final TextEditingController textFieldController = TextEditingController();

  void submitForm() {
    String selectedOption = dropdownItems[0];
    String enteredText = textFieldController.text;

    // Perform actions with the selected option and entered text
    if (kDebugMode) {
      print('Selected Option: $selectedOption');
      print('Entered Text: $enteredText');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: DropdownButton<String>(
              value: dropdownItems[0],
              items: dropdownItems.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownItems[0] = newValue!; // Update the selected option
                });
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              maxLines: 6,
              controller: textFieldController,
              decoration: const InputDecoration(
                labelText: 'Describe your complaint',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: submitForm,
            child: const Text('Report Branch'),
          ),
        ],
      ),
    );
  }
}
