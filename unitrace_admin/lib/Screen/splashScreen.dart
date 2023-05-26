import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Theme/text_theme.dart';
import '../firebase_services/splash_services.dart';
import 'Authentication/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreenServices().isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          // for applying gradient in the background
          gradient: LinearGradient(
            colors: [Color(0xffffa03f), Color(0xffffffff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),

          image: DecorationImage(
              image: AssetImage("assets/images/splash_bg.png"),
              fit: BoxFit.cover),
        ),

        // to set the padding of the screen
        padding: const EdgeInsets.all(20),

        child: Column(

            // setting alignment to left
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //to give top space
              SizedBox(
                height: h * 0.2,
              ),

              //`welcome text
              Text("WELCOME \nADMIN",
                  textAlign: TextAlign.left,
                  style: MyTextTheme.headline2.copyWith()),

              //giving space between caption and heading
              SizedBox(
                height: h * 0.01,
              ),

              //caption text
              Text(
                "Stay informed,stay on time\nTrack your college bus with ease",
                style: MyTextTheme.bodyText1.copyWith(color: Colors.black54),
                textAlign: TextAlign.left,
              ),

              //space between image and text
              const Spacer(),
            ]),
      ),
    );
  }
}
