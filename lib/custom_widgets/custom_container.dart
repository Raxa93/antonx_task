import 'dart:ui';

import 'package:antonx_task/configurations/size_config.dart';
import 'package:antonx_task/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GeneralWidgets {
  static Widget gigsContainer(

      Color conColors, String title, String name, String description, String cost, String category, String userImage) {
    return Container(
      height: 200,
      width:SizeConfig.screenWidth,
      color: conColors,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight! * 0.022, horizontal: SizeConfig.screenWidth! * 0.022),
            child: CircleAvatar(
              radius: SizeConfig.screenHeight! * 0.04,
              child: ClipOval(
                child: Image.network(
                  userImage,
                  width: SizeConfig.screenWidth! * 0.2,
                  height: SizeConfig.screenWidth! * 0.2,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Padding(
                      padding: EdgeInsets.all(SizeConfig.screenHeight! * 0.01),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          value: (loadingProgress != null)
                              ? (loadingProgress.cumulativeBytesLoaded /
                                  int.parse(loadingProgress.expectedTotalBytes.toString()))
                              : 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: AppStyle.kTitleStyle,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.grey[400],fontSize: SizeConfig.screenHeight! * 0.02),
                ),
                Text(
                  description,
                  style: AppStyle.kDescriptionStyle,
                ),
                Text(
                  "Budget : $cost",
                  style: AppStyle.kDescriptionStyle,
                ),
                Text("Category : $category", style: TextStyle(fontSize: SizeConfig.screenHeight! * 0.02))
              ],
            ),
          ),
        ],
      ),
    );
  }

  exitPopUp(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: SizedBox(
                width: SizeConfig.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    Image.asset(
                      "assets/exit_pop_up.png",
                      width: SizeConfig.screenWidth! * 0.5,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    Text(
                      "Are You Sure You Wants to Exit",
                      style: TextStyle(
                          color: Colors.black, fontSize: SizeConfig.screenHeight! * 0.024, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: SizeConfig.screenHeight! * 0.057,
                          width: SizeConfig.screenWidth! * 0.3,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: SizeConfig.screenHeight! * 0.025),
                                ),
                              )),
                        ),

                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.17,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }



}
