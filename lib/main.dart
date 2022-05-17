import 'package:antonx_task/controller/all_gig_controller.dart';
import 'package:antonx_task/controller/allpost_controller.dart';
import 'package:antonx_task/controller/login_controller.dart';
import 'package:antonx_task/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'controller/preferences_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return LogInController();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return AllPostController();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return AllGigController();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return PreferencesProvider();
        }),
      ],
      builder: (context, child) {
        return  MaterialApp(
          theme: ThemeData(
              fontFamily: 'WorkSans'
          ),
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          home: const LogInScreen(),
        );
      },
    );
  }
}


