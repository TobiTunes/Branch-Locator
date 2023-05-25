import 'package:firstbranchlocator/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../models/menu_model.dart';
import '../widgets/page_widgets.dart';

// ignore: must_be_immutable
class MobileBody extends StatelessWidget {
  MobileBody({super.key});

  final Constants cb = Constants();
  final _pinController = TextEditingController();
  // late BuildContext _context;
  List<String> _encryptedDigits = List.filled(5, '');
  int _currentIndex = 0;

  void _onChanged(String value) {
    // Allow only digits and limit the length to 5
    String newValue = value.replaceAll(RegExp('[^0-9]'), '');
    newValue = newValue.padRight(5, '*');
    _pinController.value = _pinController.value.copyWith(text: newValue);

    // Move the cursor to the next dash after a digit is entered
    if (newValue.length > _currentIndex && _currentIndex < 4) {
      _currentIndex++;
      _pinController.selection =
          TextSelection.fromPosition(TextPosition(offset: _currentIndex + 1));
    }

    _updateEncryptedDigits();
  }

  void _updateEncryptedDigits() {
    String pin = _pinController.text.padRight(5, '*');
    String pinDigits = pin.substring(0, 5);
    _encryptedDigits = pinDigits.split('').map((e) => encryptDigit(e)).toList();
  }

  String encryptDigit(String digit) {
    // Use your encryption logic here
    return digit == '*' ? '*' : '•';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/fbnbg.jpg'), fit: BoxFit.cover)),
            child: Column(children: [
              Widgets().header(context),
              _menu(),
              _pinLogin(context),
              _faceIdLogin(context),
            ])),
      ),
    );
  }

  _pinLogin(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .8,
          child: Card(
            color: AppColors().cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cb.mLogin,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      // Hide the keyboard when the user taps outside the form field
                      FocusScope.of(context).unfocus();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: SizedBox(
                                  width: 40.0,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: -20.0,
                                        child: Text(
                                          _encryptedDigits[i],
                                          style:
                                              const TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      TextField(
                                        controller: _pinController,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        maxLength: 5,
                                        obscureText: true,
                                        onChanged: (value) {
                                          _onChanged(value);
                                        },
                                        onTap: () {
                                          _currentIndex = i;
                                        },
                                        style: const TextStyle(fontSize: 20.0),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          counterText: '',
                                          hintText: '_',
                                          hintStyle:
                                              const TextStyle(fontSize: 20.0),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[400]!,
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[400]!,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _faceIdLogin(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
          width: MediaQuery.of(context).size.width * .8,
          child: Card(
            color: AppColors().cardColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(Icons.fingerprint, color: Colors.white),
                const SizedBox(width: 10),
                Text(cb.loginFace,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        )
      ],
    );
  }

  _menu() {
    return Column(
      children: [
        MenuGrid(
          iconData: cb.icons,
          iconNames: cb.text,
        ),
      ],
    );
  }
}
