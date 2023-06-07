import 'package:firstbranchlocator/services/get_documents_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/homescreen.dart';

void main() {
  final chatRetrieve = DatabaseServices();
  chatRetrieve.fetchChatDto().then((chatDtoList) {
    for (var chatDto in chatDtoList) {
      if (kDebugMode) {
        print('Id: ${chatDto['id']}, Name: ${chatDto['name']}');
        // print(chatDtoList);
      }
    }
    // if (kDebugMode) {
    //   print(chatDtoList[0]['name']);
    // }
  }).catchError((error) {
    if (kDebugMode) {
      print('Error: $error');
    }
  });

  chatRetrieve.fetchChatDtoStoreId().then((chatDtoList) {
    if (kDebugMode) {
      print(chatDtoList);
    }
  }).catchError((error) {
    if (kDebugMode) {
      print('Error: $error');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
