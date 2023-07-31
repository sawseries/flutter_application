import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:flutter_application/common/dialog/alert_helper.dart';
import 'package:flutter_application/api/Login_api.dart';

class LoginController {
  Future<void> AuthenLogin(BuildContext context, Map data) async {
    final results = await LoginApi.login(context, data);

    //Map<String, dynamic> data = jsonDecode(results.body);
    print(results);
  }

  static Future<List?> login() async {
    Map<String, dynamic> body = {
      "username": 'k2m',
      "password": '123456',
    };

    const url = 'http://k2mpg.ddns.net/tnswms/api/login';
    final uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    Logger().wtf(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      return result;
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
