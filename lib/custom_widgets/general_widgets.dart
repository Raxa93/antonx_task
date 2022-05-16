

import 'package:antonx_task/configurations/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralWidgets {

  static Widget gigsContainer(Color conColors) {
    return Container(
      color: conColors,
      height: SizeConfig.screenHeight! * 0.5,
      width: SizeConfig.screenWidth! * 0.9,
    );
  }

  static Widget activeGigsTile(
      String title, String subtitle, var img, String trailing) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle,
          style: TextStyle(
              color: Colors.yellow[700], fontWeight: FontWeight.bold)),
      leading: Image.asset(img),
      trailing: Text(trailing,
          style: const TextStyle(
              color: Color(0xff008479), fontWeight: FontWeight.bold)),
    );
  }
}

