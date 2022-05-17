import 'package:another_flushbar/flushbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GeneralUtilities{

  showMessage({required BuildContext context, required String title, required String text}) {
    return Flushbar(
      title: title,
      message: text,
      duration: const Duration(seconds: 3),
      backgroundGradient: const LinearGradient(colors: [
        Color(0xffFFA37C),
        Color(0xffFE7940),
        Color(0xffFF9A70),
      ]),
    )..show(context);
  }

  static Future<bool?> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("I am connected to a mobile network.");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("I am connected to a Wifi network.");
      return true;
    } else {
      return null;
    }
  }

}