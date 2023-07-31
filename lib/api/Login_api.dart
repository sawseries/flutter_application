import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:flutter_application/common/dialog/alert_helper.dart';

class LoginApi {
  static Future<List?> login(BuildContext context, Map data) async {
    final uri = Uri.parse('http://k2mpg.ddns.net/tnswms/api/login');
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    Logger().wtf(response.body);

    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body) as Map;
      // final result = ((json['items'] ?? []) as List);
      List<dynamic> responseJson = json.decode(response.body);
      return responseJson.map((m) => new User.fromJson(m)).toList();
      //return result;
    } else {
      return null;
    }
  }

  static Future<void> addTodo(
      String title, String description, BuildContext context) async {
    try {
      Map<String, dynamic> body = {
        "title": title,
        "description": description,
        "is_completed": false,
      };

      //submit data to the server
      const url = 'https://api.nstack.in/v1/todos';
      final uri = Uri.parse(url);
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        Logger().v(response.body);
        // ignore: use_build_context_synchronously
        AlertHelper.showSuccessMessage(context,
            message: 'Todo Added Successfully');
      } else {
        Logger().e(response.body);
        // ignore: use_build_context_synchronously
        AlertHelper.showErrorMessage(context, message: 'Todo Adding Failed');
      }

      // return json.decode(response.body);
    } catch (e) {
      Logger().e(e);
      throw Exception(e.toString());
    }
  }
}
