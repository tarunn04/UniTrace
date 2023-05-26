import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitrace_admin/Screen/Authentication/auth_screen.dart';
import 'package:unitrace_admin/Screen/home_screen.dart';
import 'package:unitrace_admin/widget/round_button.dart';


import '../Screen/Authentication/forgot_password.dart';
import '../Theme/constants.dart';
import '../Theme/text_theme.dart';
import '../utils/utils.dart';
import 'custom_text_field.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({
    super.key,
  });

  

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool loading = false;
  final TextEditingController loginpasswordController = TextEditingController();
  final TextEditingController loginemailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    loginpasswordController.dispose();
    loginemailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomFormField(
                    hint: "Admin Email",
                    iconData: CupertinoIcons.mail,
                    isEmail: true,
                    isHidden: false,
                    controller: loginemailController,
                  ),
                  CustomFormField(
                    controller: loginpasswordController,
                    hint: "Admin Password",
                    iconData: Icons.password,
                    isEmail: false,
                    isHidden: true,
                  ),
                ],
              )),
          //Email

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot password?",
                  style: MyTextTheme.subtitle2,
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: 300,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Use your Admin account to login ",
                  style: MyTextTheme.subtitle2.copyWith(
                    color: primaryActiveTextColor,
                  ),
                  children: [
                    TextSpan(
                      // text: "Bus Admin",
                      style: MyTextTheme.subtitle1.copyWith(
                        color: Color.fromARGB(255, 212, 88, 47),
                      ),
                    ),
                  ]),
            ),
          ),

          RoundButton(
              title: "Login",
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  _auth
                      .signInWithEmailAndPassword(
                          email: loginemailController.text.toString(),
                          password: loginpasswordController.text.toString())
                      .then((value) {
                    setState(() {
                      loading = false;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ));
                  }).onError(
                    (error, stackTrace) {
                      setState(() {
                        loading = false;
                      });
                      Utils().ShowToastMessage(error.toString());
                    },
                  );
                }
              })
        ],
      ),
    );
  }
}

class MapScreen {
}
