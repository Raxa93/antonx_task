//
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class PrefrencesUtilites {
//
//
//   static Future<void> getUserEmailFromPrefsToProvider(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     if (prefs.getString('user_email') != null) {
//       String? userEmail = prefs.getString('user_email');
//       setUserEmailToPrefs(userEmail!, context);
//     } else {
//       setUserEmailToPrefs("", context);
//     }
//   }
//
//   static Future<void> setUserEmailToPrefs(String userEmail, BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('user_email', userEmail);
//     Provider.of<PreferencesProvider>(context, listen: false).setUserEmailInProvider(userEmail);
//   }
//
// }