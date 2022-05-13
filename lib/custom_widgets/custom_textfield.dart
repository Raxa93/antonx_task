


import 'package:flutter/material.dart';

import '../configurations/size_config.dart';

class CustomWidget{

  static Widget customsTextField(String label, String hintText, var onTap, IconData icon, TextEditingController _controller,bool isPassword) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenHeight! * 0.03, top: SizeConfig.screenHeight! * 0.03),
          child: Text(
            label,
            style: TextStyle(
                color: Colors.grey, fontSize: SizeConfig.screenHeight! * 0.023),
          )),
      Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.screenHeight! * 0.02,
            left: SizeConfig.screenHeight! * 0.03,
            right: SizeConfig.screenWidth! * 0.042),
        child: SingleChildScrollView(
          child: TextField(
            obscureText: isPassword,
            controller: _controller,
            onTap: onTap,
            decoration: InputDecoration(
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    icon,
                  )),
              hintText: hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      )
    ]);
  }



}