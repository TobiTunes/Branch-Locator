import 'package:firstbranchlocator/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../models/menu_model.dart';
import '../widgets/page_widgets.dart';

// ignore: must_be_immutable
class MobileBody extends StatelessWidget {
  MobileBody({super.key});

  final Constants cb = Constants();

  final List<FocusNode> _focusNodes = List.generate(
    5,
    (_) => FocusNode(),
  );
  final List<String> _encryptedDigits = List.filled(5, '');
  int _currentIndex = 0;

  void _onChanged(String value, int index, BuildContext context) {
    if (value.isNotEmpty) {
      _encryptedDigits[index] = value;
    } else {
      _encryptedDigits[index] = '';
      if (index > 0) {
        // Move focus to the previous input field when deleting an input
        _currentIndex = index - 1;
        FocusScope.of(context).requestFocus(_focusNodes[_currentIndex]);
      }
    }

    if (value.isNotEmpty && index < 4) {
      _currentIndex = index + 1;
      FocusScope.of(context).requestFocus(_focusNodes[_currentIndex]);
    }

    bool allDashesFilled = _encryptedDigits.every((digit) => digit == '*');
    if (allDashesFilled) {
      // Unfocus the text input
      FocusScope.of(context).unfocus();
    }

    if (value.isNotEmpty && index == 4) {
      _focusNodes[index].unfocus();
    }
  }

  Widget _buildPinTextField(int index, BuildContext context) {
    if (kDebugMode) {
      print(_encryptedDigits);
    }
    return SizedBox(
      width: 40.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -20.0,
            child: Text(
              _encryptedDigits[index],
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            obscureText: true,
            onChanged: (value) {
              _onChanged(value, index, context);
            },
            style: const TextStyle(fontSize: 20.0),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              counterText: '',
              hintText: '_',
              hintStyle: const TextStyle(fontSize: 20.0),
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
            focusNode: _focusNodes[index],
          ),
        ],
      ),
    );
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
                  Text(
                    cb.mLogin,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
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
                                child: _buildPinTextField(i, context),
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
