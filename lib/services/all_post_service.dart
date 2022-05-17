// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:developer';
import 'package:antonx_task/constants/app-strings.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<Map<String, dynamic>?> getAllPostFromApi(String accessToken) async {
    print('Here is token: $accessToken');
    try {
      final response = await http.get(
        Uri.parse(AppString.allPostApiBaseUrl),
        headers: {
          'Authorization': 'Bearer ${accessToken.toString()}',
        },
      );
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {

          Map<String, dynamic> responseMap = jsonDecode(response.body);
          // log('This is body in post service $responseMap');
          return responseMap;
        } else {
          return null;
        }
      }
    } catch (e) {
      log('This is exception $e');
    }
  }
}
