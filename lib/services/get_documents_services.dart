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
}
