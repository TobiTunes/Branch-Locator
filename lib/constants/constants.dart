import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  final url =
      "https://www.firstbanknigeria.com/personal/accounts/diaspora/account-opening/";

  final List<IconData> icons = [
    FontAwesomeIcons.arrowRightArrowLeft,
    Icons.phonelink_ring_rounded,
    Icons.qr_code_2,
    Icons.account_balance_wallet,
    Icons.help_outline_rounded,
    Icons.account_balance,
    FontAwesomeIcons.compass,
    Icons.person_pin_circle,
    FontAwesomeIcons.share,
  ];

  final List<String> text = [
    'QUICK TRANSFERS',
    'QUICK AIRTIME',
    'QUICK QR',
    'BALANCE ENQUIRY',
    'HELP/ CONTACT US',
    'INTERNET BANKING',
    'ATM/BRANCH LOCATOR',
    'AGENT LOCATOR',
    'FIRST REFER',
  ];

  final List<String> textMsg = [
    'Get Directions',
    'Account Opening',
    'ATM Card Collection',
    'FX Transaction',
    'Token Collection',
    'Form A Transactions',
  ];

  final List<IconData> iconsReasons = [
    Icons.location_on,
    Icons.account_balance,
    FontAwesomeIcons.ccMastercard,
    FontAwesomeIcons.circleDollarToSlot,
    FontAwesomeIcons.keyboard,
    FontAwesomeIcons.fileWaveform,
  ];

  final List<String> complaintMsg = [
    'Account Opening',
    'ATM Card Collection',
    'FX Transaction',
    'Token Collection',
    'ATM Transactions',
  ];

  final List<String> closestBranchDetails = [
    'Iganmu',
    'ATM Card Collection',
    'FX Transaction',
    'Token Collection',
    'ATM Withdrawal',
    'Lodge a Complaint',
  ];

  List<BranchDetails> cardList = [
    BranchDetails(
      branchName: 'IGANMU BRANCH',
      location: '2, ABEBE VILLAGE ROAD',
      city: 'IGANMU',
      distance: '1.1km',
      icon: Icons.place,
    ),
    BranchDetails(
      branchName: 'BODE THOMAS BRANCH',
      location: '72, Bode Thomas Street',
      city: 'Surulere',
      distance: '2.0km',
      icon: Icons.place,
    ),
    BranchDetails(
      branchName: 'SURULERE BRANCH',
      location: 'Adeniran Ogunsanya Street',
      city: 'Surulere',
      distance: '2.1km',
      icon: Icons.place,
    ),

    BranchDetails(
      branchName: 'ADENIRAN OGUNSANYA BRANCH',
      location: '53, Adeniran Ogunsanya Street',
      city: 'Surulere',
      distance: '2.4km',
      icon: Icons.place,
    ),
    BranchDetails(
      branchName: 'OJUELEGBA BRANCH',
      location: '82, Ojuelegba Road',
      city: 'OJUELEGBA',
      distance: '2.7km',
      icon: Icons.place,
    ),

    // Add more card details objects as needed
  ];

  final String mLogin = "Enter your mPin to login";

  final String loginFace = "LOGIN WITH FACE ID";

  final String reasonVisit = "Reason for visiting";

  final String advisedDocuments =
      "You are advised to go with the following documents";

  final String complaints = "Report a Branch";

  final String acctOpenHead = 'Account Opening Options';

  final String acctOpenQues = 'How would you like to open an account?';

  final String acctOpenOnline = 'Open Online';

  final String acctOpenBranch = 'Go to Branch';
}

class BranchDetails {
  final String branchName;
  final String location;
  final String city;
  final String distance;
  final IconData icon;

  BranchDetails({
    required this.branchName,
    required this.location,
    required this.city,
    required this.distance,
    required this.icon,
  });
}
