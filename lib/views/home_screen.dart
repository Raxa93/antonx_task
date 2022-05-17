// ignore_for_file: avoid_print

import 'package:antonx_task/configurations/size_config.dart';
import 'package:antonx_task/controller/all_gig_controller.dart';
import 'package:antonx_task/controller/allpost_controller.dart';
import 'package:antonx_task/custom_widgets/custom_container.dart';
import 'package:antonx_task/custom_widgets/custom_tile.dart';
import 'package:antonx_task/model/login_model.dart';
import 'package:antonx_task/utilities/prefrence_utilities.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  User user;

  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = const Color(0xffF4F9FD);
    Color textColor = const Color(0xff008479);
    var postVm = Provider.of<AllPostController>(context, listen: false);
    var gigVm = Provider.of<AllGigController>(context, listen: false);
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {
        return GeneralWidgets().exitPopUp(context);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          leading: Container(
            decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(5)),
            width: SizeConfig.screenWidth! * 0.1,
            height: SizeConfig.screenHeight! * 0.2,
            child: const Icon(Icons.more_vert, color: Colors.black),
          ),
          title: SvgPicture.asset("assets/EduGIGS.svg"),
          actions: [
            Image.network(
              widget.user.profileImage!,
              width: 30,
              // fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Padding(
                  padding: EdgeInsets.all(SizeConfig.screenHeight! * 0.01),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      value: (loadingProgress != null)
                          ? (loadingProgress.cumulativeBytesLoaded /
                              int.parse(loadingProgress.expectedTotalBytes.toString()))
                          : 0,
                    ),
                  ),
                );
              },
            ),
            // Image.asset("assets/profile.png"),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.08,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi ${widget.user.firstName}",
                style: TextStyle(color: Colors.grey[500], fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              const Text(
                "Find your project Gigs!",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gigs Request",
                    style: TextStyle(color: Colors.black, fontSize: SizeConfig.screenHeight! * 0.025),
                  ),
                  Text(
                    "Show All",
                    style: TextStyle(color: textColor, fontSize: SizeConfig.screenHeight! * 0.025),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Expanded(
                flex: 2,
                // height: SizeConfig.screenHeight! * 0.25,
                // width: SizeConfig.screenWidth,
                child: FutureBuilder(
                  future: postVm.getAllPost(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      return CarouselSlider(
                          items: postVm.allPostList
                              .map((item) => GeneralWidgets.gigsContainer(Colors.white, item.title!, item.firstName!,
                                  item.description!, item.cost!, item.category!, item.profileImage!))
                              .toList(),
                          // items: [
                          //   Container(child: Text(postVm.allPostList[index].category.toString()),)

                          // ],
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal));
                    }
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Active Gigs",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Show All",
                    style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              Expanded(
                flex: 2,
                // height: SizeConfig.screenHeight! * 0.5,
                // width: SizeConfig.screenWidth,
                child: FutureBuilder(
                    future: gigVm.getAllGig(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: gigVm.allGigList.length,
                            itemBuilder: (context, index) {
                              return CustomTile.activeGigsTile(
                                  gigVm.allGigList[index].category.toString(),
                                  gigVm.allGigList[index].ratings.toString(),
                                  gigVm.allGigList[index].cost.toString(),
                                  gigVm.allGigList[index].image1!);
                            });
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void>? getAllPosts() async {
    await PreferencesUtilites.getAccessTokenFromPrefsToProvider(context);
    await Provider.of<AllPostController>(context, listen: false).getAllPost(context);
    await Provider.of<AllGigController>(context, listen: false).getAllGig(context);

    await Future.delayed(const Duration(seconds: 3));
    print('This is all post length ${Provider.of<AllPostController>(context, listen: false).allPostList.length}');
    print('This is all Gigs length ${Provider.of<AllGigController>(context, listen: false).allGigList.length}');
  }
}
