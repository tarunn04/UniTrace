// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Theme/constants.dart';
import '../../Theme/text_theme.dart';
import '../../utils/utils.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/round_button.dart';
import '../../widget/signup_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController resetController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    resetController.dispose();
    super.dispose();
  }
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
                "assets/images/bg.png",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      "Forgot Password",
                      style: MyTextTheme.headline4.copyWith(
                        color: primaryActiveTextColor,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Enter your email address and we will send you a link to reset your password",
                      textAlign: TextAlign.center,
                      style: MyTextTheme.bodyText1.copyWith(
                        color: primaryActiveTextColor,
                      ),
                    ),
                    
                    SizedBox(height: 30,),

                    CustomFormField(
                      controller: resetController,
                      hint: "Enter email address",
                      iconData: Icons.email_sharp,
                      isEmail: false,
                      isHidden: false,
                    ),

                    SizedBox(height: 30,),

                    RoundButton(title: "Submit", onTap: (){
                      setState(() {
                        loading = true;
                      });
                      _auth.sendPasswordResetEmail(email: resetController.text)
                      .then((value) {
                        setState(() {
                          loading = false;
                        });
                        Utils().ShowToastMessage("Password reset link sent to your email");
                      },).onError((error, stackTrace) {
                        setState(() {
                          loading = false;
                        });
                        Utils().ShowToastMessage("Error: ${error.toString()}");
                      }, );
                    }),

                    SizedBox(height: 20,),

                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Icon(Icons.arrow_back_ios, color: primaryActiveTextColor,size: 18),
                        Text("Back to Login", style: MyTextTheme.headline4.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: primaryPassiveTextColor,),)
                       ],
                     ))
                  ],
                ),
              ),
              ),
          ),
        ],
      ),
    );
  }
}

