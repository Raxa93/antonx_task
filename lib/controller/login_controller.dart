import 'dart:developer';

import 'package:antonx_task/model/login_model.dart';
import 'package:antonx_task/services/user_login_service.dart';
import 'package:antonx_task/utilities/general_utilities.dart';
import 'package:flutter/cupertino.dart';

class LogInController extends ChangeNotifier {
  Future<User?> loginWithCredentials(BuildContext context,String userEmail, String password, String userType) async {
    Map<String, dynamic>? response = await AuthService.login(userEmail, password, userType);

    if (response!['success'] == true) {
      var user = User.fromJson(response);
      log('This is user ${user.name}');
      log('This is response ${response['body']['access_token']}');
      return user;
    } else {
      GeneralUtilities().showMessage(context: context, title: 'Something went wrong', text: response['error']);
      return null;
    }
  }
}
