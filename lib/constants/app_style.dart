// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../configurations/size_config.dart';
import 'app_colors.dart';

class AppStyle {

  static final kGreyAndBold = TextStyle(
      color: Colors.black,
      fontSize: SizeConfig.screenHeight! * 0.021,
      fontWeight: FontWeight.bold);


  static final kRoundedContainer = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13));




}
