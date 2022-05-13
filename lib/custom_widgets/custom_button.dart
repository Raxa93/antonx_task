import 'package:antonx_task/configurations/size_config.dart';
import 'package:antonx_task/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton {

  static Widget loginButton() {
    return Container(
      decoration:
      BoxDecoration(color: AppColors.containerColor, borderRadius: BorderRadius.circular(5)),
      height: SizeConfig.screenHeight! * 0.07,
      width: SizeConfig.screenWidth! * 0.7,
      child: Center(
        child: Text(
          "Sign In ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: SizeConfig.screenHeight! * 0.025),
        ),
      ),
    );
  }



}