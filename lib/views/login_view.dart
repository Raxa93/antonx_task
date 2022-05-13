import 'package:antonx_task/configurations/size_config.dart';
import 'package:antonx_task/constants/app_colors.dart';
import 'package:antonx_task/constants/app_style.dart';
import 'package:antonx_task/controller/login_controller.dart';
import 'package:antonx_task/custom_widgets/custom_button.dart';
import 'package:antonx_task/custom_widgets/custom_textfield.dart';
import 'package:antonx_task/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController(text: 'owaismabood@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    var loginVm = Provider.of<LogInController>(context, listen: false);
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/App-icon.svg"),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.03,
                ),
                SvgPicture.asset("assets/EduGIGS.svg"),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
            Container(
              decoration: AppStyle.kRoundedContainer,
              height: SizeConfig.screenHeight! * 0.6,
              width: SizeConfig.screenWidth! * 0.84,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.04,
                  ),
                  Text(
                    "Sign in to EduGIGs",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold, fontSize: SizeConfig.screenHeight! * 0.025),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.01,
                  ),
                  CustomWidget.customsTextField(
                      'Email Address', 'Email Address', null, Icons.mail, emailController, false),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.01,
                  ),
                  CustomWidget.customsTextField(
                      'Password', 'Password', null, Icons.visibility, passwordController, false),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.03,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: Text("Forget password?", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.03,
                  ),
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () async {
                        print('Loggin in');
                        if (emailController.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Email must not be empty!');
                        } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailController.text)) {
                          Fluttertoast.showToast(msg: 'Please Enter valid Email');
                        } else if (passwordController.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Password must not be empty!');
                        } else {
                          await loginVm.loginWithCredentials(context,emailController.text, passwordController.text, 'seller').then((value) {
                            if(value!= null){
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                            }
                          });
                        }
                      },
                      child: CustomButton.loginButton(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 20),
              child: Row(
                children: [
                  Text("Do you have account?",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: SizeConfig.screenHeight! * 0.023)),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.02,
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(color: AppColors.containerColor, fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
