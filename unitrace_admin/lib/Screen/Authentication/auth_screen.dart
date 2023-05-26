// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Theme/constants.dart';
import '../../Theme/text_theme.dart';
import '../../widget/login_widget.dart';
import '../../widget/signup_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
 
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: w,
              height: h,
              child: Image.asset(
                "assets/images/auth.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: h * 0.57,
              width: w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromARGB(229, 243, 243, 243),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //login
                        GestureDetector(
                          child: Column(
                            children: [
                              Text(
                                "ADMIN LOGIN",
                                style: MyTextTheme.headline4.copyWith(
                                  color: primaryActiveTextColor,
                                ),
                              ),
                              Container(
                                  height: 4,
                                  width: 200,
                                  color: authUnderlineActive),
                            ],
                          ),
                        ),
                        //signup
                      ],
                    ),
                  ),

                  //for the form

                  LoginWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
