import 'package:flutter/cupertino.dart';

class PreferencesProvider extends ChangeNotifier {

  String _accessToken = "";

  get accessToken => _accessToken;

  setAccessTokenInProvider(String accessToken) {
    _accessToken = accessToken;
    notifyListeners();
  }
}
