import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  /// Making a GET request
  static Future<dynamic> getRequest({required String url, Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        debugPrint("\nGET Request Successful: $decodedData\n");
        return decodedData;
      } else {
        debugPrint("\nGET Request Failed: ${response.statusCode} - ${response.body}\n");
        return null;
      }
    } catch (error) {
      debugPrint("\nError in GET Request: $error\n");
      return null;
    }
  }

  /// Making a POST request
  static Future<dynamic> postRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers ?? {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedData = jsonDecode(response.body);
        debugPrint("\nPOST Request Successful: $decodedData\n");
        return decodedData;
      } else {
        debugPrint("\nPOST Request Failed: ${response.statusCode} - ${response.body}\n");
        return null;
      }
    } catch (error) {
      debugPrint("\nError in POST Request: $error\n");
      return null;
    }
  }
}
