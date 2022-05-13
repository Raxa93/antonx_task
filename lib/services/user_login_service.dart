// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:antonx_task/constants/app-strings.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthService {
  static Future<Map<String, dynamic>?> login(String email, String password, String userType) async {
    Response response = await http.post(
      Uri.parse(AppString.loginApiBaseUrl),
      body: {'email': email, 'password': password, 'user_type': userType},
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response.body);
        print('This is body in service ${responseMap}');
        return responseMap;


      } else {
        return null;
      }
    }
  }
}
