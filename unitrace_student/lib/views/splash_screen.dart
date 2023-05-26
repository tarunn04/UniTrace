import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitrace_student/utils/text_themes.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController _splashScreenController = SplashScreenController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashScreenController.islogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text("WELCOME\nSTUDENT",
                      textAlign: TextAlign.center,
                      style: MyTextTheme.headline2,
                  ),
                  const SizedBox(height: 20),
                  Text("Efficient campus transport\npowered by UniTrace App",
                      textAlign: TextAlign.center,
                      style: MyTextTheme.bodyText1
                      .copyWith(color: Colors.black54),
                    ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
            )));
  }
}
