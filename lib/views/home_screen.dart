import 'package:antonx_task/configurations/size_config.dart';
import 'package:antonx_task/controller/allpost_controller.dart';
import 'package:antonx_task/custom_widgets/general_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

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
    // var postVm = Provider.of<AllPostController>(context, listen: false);
    print('This is all post length ${Provider.of<AllPostController>(context, listen: false).allPostList.length}');
    SizeConfig().init(context);
    return Consumer<AllPostController>(
      builder: (context, vm, _) {
        return Scaffold(
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
              Image.asset("assets/profile.png"),
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
                  "Hi Simone",
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
                  height: SizeConfig.screenHeight! * 0.08,
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
                  child: Container(
                    child: ListView.builder(
                        itemCount: vm.allPostList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: SizeConfig.screenHeight! * 0.5,
                            child: ListTile(
                              title: Text(vm.allPostList[index].firstName.toString()),
                              leading: CircleAvatar(
                                radius: 40,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Active Gigs",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Show All",
                      style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.04,
                ),
                GeneralWidgets.activeGigsTile("UI Designer", "4.5", "assets/gigs_image.png", "From: 25"),
                GeneralWidgets.activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png", "From: 25"),
                GeneralWidgets.activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png", "From: 25"),
                GeneralWidgets.activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png", "From: 25"),
                GeneralWidgets.activeGigsTile("Product Designer", "4.5", "assets/gigs_image.png", "From: 25"),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void>? getAllPosts() async {
    await Provider.of<AllPostController>(context, listen: false).getAllPost(context);
  }
}
