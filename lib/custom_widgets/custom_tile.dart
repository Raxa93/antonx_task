


 import 'package:antonx_task/configurations/size_config.dart';
import 'package:flutter/material.dart';
class CustomTile {
  static Widget activeGigsTile(String title, String ratings, String gigCost, String image) {
    return ListTile(
      title: Text(title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ratings == null ? Text('No rating',style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.w600)): Text(ratings,
              style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.w600)),
          Text('From : ${gigCost}')
        ],
      ),
      leading: CircleAvatar(
          radius: SizeConfig.screenHeight! * 0.03,
          child: ClipOval(
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: SizeConfig.screenWidth! * 0.2,
                height: SizeConfig.screenWidth! * 0.2,
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
              ))),
      // trailing: Text(trailing, style: const TextStyle(color: Color(0xff008479), fontWeight: FontWeight.bold)),
    );
  }
}
