import 'package:antonx_task/controller/login_controller.dart';
import 'package:antonx_task/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        // ChangeNotifierProvider(create: (BuildContext context) {
        //   return ContactFileService();
        // }),
      ],
      builder: (context, child) {
        return  MaterialApp(
          theme: ThemeData(
              fontFamily: 'WorkSans'
          ),
          debugShowCheckedModeBanner: false,
          home: const LogInScreen(),
        );
      },
    );
  }
}


