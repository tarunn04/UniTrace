// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitrace_admin/Theme/constants.dart';
import 'package:unitrace_admin/Theme/text_theme.dart';
import 'package:unitrace_admin/widget/custom_text_field.dart';
import 'package:unitrace_admin/widget/round_button.dart';


import '../Screen/Authentication/auth_screen.dart';
import '../utils/utils.dart';

class SignUpWidget extends StatefulWidget {
  bool isSignupScreen;
  SignUpWidget({
    Key? key,
    required this.isSignupScreen,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _formkey = GlobalKey<FormState>();
  // final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController repassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
    repassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
            child: Column(children: [
              //Email
              CustomFormField(
                controller: emailController,
                hint: "Email",
                iconData: CupertinoIcons.mail,
                isEmail: true,
                isHidden: false,
              ),

              CustomFormField(
                controller: passController,
                hint: "Password",
                iconData: Icons.password,
                isEmail: false,
                isHidden: true,
              ),

              CustomFormField(
                controller: repassController,
                hint: "Confirm Password",
                iconData: Icons.password,
                isEmail: false,
                isHidden: true,
              ),

              


            ]),
            key: _formkey,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: 300,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By Signing up it will pass the details to ",
                  style: MyTextTheme.subtitle2.copyWith(
                    color: primaryActiveTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Bus Admin",
                      style: MyTextTheme.subtitle1.copyWith(
                        color: Color.fromARGB(255, 212, 88, 47),
                      ),
                    ),
                  ]),
            ),
          ),
          RoundButton(
              loading: loading,
              title: "SignUp",
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                }
                if (passController.text == repassController.text) {
                  _auth
                      .createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passController.text.toString())
                      .then((value) => {
                            setState(() {
                              loading = false;
                            }),
                            Utils().ShowToastMessage(
                                "User Created You can login now"),
                          })
                      .onError((error, stackTrace) => {
                            setState(() {
                              loading = false;
                            }),
                            Utils().ShowToastMessage(error.toString()),
                          });
                } else {
                  setState(() {
                    loading = false;
                  });
                  Utils().ShowToastMessage("Password doesn't match");
                }
              }),
        ],
      ),
    );
  }
}
