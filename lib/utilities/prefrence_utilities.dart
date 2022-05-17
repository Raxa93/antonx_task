
import 'package:antonx_task/controller/preferences_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtilites {


  static Future<void> getAccessTokenFromPrefsToProvider(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('access_token') != null) {
      String? accessToken = prefs.getString('access_token');
      print('Hey i got the access token from prefrences $accessToken');
      setAccessTokenToPrefs(accessToken!, context);
    } else {
      setAccessTokenToPrefs("", context);
    }
  }

  static Future<void> setAccessTokenToPrefs(String accessToken, BuildContext context) async {
    print('This is user token in preferences $accessToken');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
    Provider.of<PreferencesProvider>(context, listen: false).setAccessTokenInProvider(accessToken);
  }

}