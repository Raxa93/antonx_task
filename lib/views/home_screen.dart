
import 'package:antonx_task/configurations/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color containerColor = const Color(0xffF4F9FD);
    Color textColor = const Color(0xff008479);

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: Container(
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(5)),
          width: SizeConfig.screenWidth! * 0.1,
          height: SizeConfig.screenHeight! * 0.2,
          child: Icon(Icons.more_vert, color: Colors.black),
        ),
        title: SvgPicture.asset("assets/EduGIGS.svg"),
        actions: [
          Image.asset("assets/profile.png"),
          SizedBox(
            width: SizeConfig.screenWidth! * 0.08,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Simone,",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              const Text(
                "Find your project Gigs!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Gigs Request",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Show All",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              // CarouselSlider(
              //   items: [
              //     gigsContainer(Colors.red),
              //     gigsContainer(Colors.yellow),
              //     gigsContainer(Colors.black),
              //     gigsContainer(Colors.lightBlue),
              //   ],
              //   options: CarouselOptions(
              //       autoPlay: true,
              //       autoPlayAnimationDuration: Duration(seconds: 3),
              //       enlargeCenterPage: true),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Active Gigs",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Show All",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              activeGigsTile(
                  "UI Designer", "4.5", "assets/gigs_image.png", "From: 25"),
              activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png",
                  "From: 25"),
              activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png",
                  "From: 25"),
              activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png",
                  "From: 25"),
              activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png",
                  "From: 25"),
            ],
          ),
        ),
      ),
    );
  }

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
