// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../configurations/size_config.dart';
import 'app_colors.dart';

class AppStyle {



  static final kfooterStyle = TextStyle(
      color: Colors.black,
      fontSize: SizeConfig.screenHeight! * 0.002);

  static final kDescriptionStyle = TextStyle(
      color: AppColors.kAvatarDarkGrey,
      fontSize: SizeConfig.screenHeight! * 0.018);

  static final kSubTitleStyle = TextStyle(
      color: Colors.grey,
      fontSize: SizeConfig.screenHeight! * 0.02);

  static final kTitleStyle = TextStyle(
      color: Colors.blue,fontSize: SizeConfig.screenHeight! * 0.022,fontWeight: FontWeight.w600);



  static final kRoundedContainer = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13));




}
