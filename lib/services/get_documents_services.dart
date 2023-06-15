import 'dart:convert';

import 'package:http/http.dart' as http;

class DatabaseServices {
  static Future<dynamic> getDocuments(String url, String reason) async {
    try {
      var uri = Uri.parse('$url/$reason');

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        // Request successful, parse and return the response
        var data = response.body;
        return data;
      } else {
        // Request failed, throw an error with the status code
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Exception thrown, throw an error with the message
      throw Exception('Error: $error');
    }
  }

  static Future<dynamic> getClosestBranches(
      String url, double latitude, double longitude, String reason) async {
    try {
      var uri = Uri.parse('$url?lat=$latitude&lon=$longitude&param=$reason');

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        // Request successful, parse and return the response
        var data = response.body;
        return data;
      } else {
        // Request failed, throw an error with the status code
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Exception thrown, throw an error with the message
      throw Exception('Error: $error');
    }
  }

  static Future<dynamic> postComplaint(
      String url, String branchID, String failedService, String message) async {
    try {
      var body = {
        'string1': branchID,
        'string2': failedService,
        'string3': message,
      };

      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        // Request successful, parse and return the response
        var data = response.body;

        return data;
      } else {
        // Request failed, throw an error with the status code
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Exception thrown, throw an error with the message
      throw Exception('Error: $error');
    }
  }

  Future<List> fetchChatDto() async {
    final response =
        await http.get(Uri.parse('https://localhost:7053/api/ChatAPI/'));
    if (response.statusCode == 200) {
      // If the API call is successful, parse the response body and return the data
      final List<dynamic> responseData = json.decode(response.body);
      // if (kDebugMode) {
      //   print(responseData);
      // }
      // return responseData.map((json) => ChatDTO.fromJson(json)).toList();
      return responseData;
      // return response.body;
    } else {
      // If the API call fails, throw an exception or handle the error as per your requirement
      throw Exception('Failed to fetch chat DTO');
    }
  }

  Future fetchChatDtoStoreId() async {
    int id = 3;
    final response = await http
        .get(Uri.parse('https://localhost:7053/api/ChatAPI/Id?id=$id'));
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseData;
    } else {
      // ignore: prefer_interpolation_to_compose_strings
      throw Exception('Failed to fetch chat DTO: ' + responseData['title']);
    }
  }

  Future postComp() async {
    MessageBody body = MessageBody(id: 0, name: 'Blue Blue Blue');
    Map<String, dynamic> jsonBody = body.toJson();

    final response = await http.post(
      Uri.parse('https://localhost:7053/api/ChatAPI/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(jsonBody),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return 'Success';
    } else {
      return 'Failed to send';
    }
  }
}

class MessageBody {
  int id;
  String name;

  MessageBody({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// class ChatDTO {
//   final int id;
//   final String name;

//   ChatDTO({required this.id, required this.name});

//   factory ChatDTO.fromJson(Map<String, dynamic> json) {
//     return ChatDTO(
//       id: json['Id'],
//       name: json['Name'],
//     );
//   }
// }
