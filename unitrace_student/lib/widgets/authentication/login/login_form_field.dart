import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:unitrace_student/widgets/common/custom_form_field.dart';
import 'package:unitrace_student/widgets/common/round_button.dart';

import '../../../controllers/login_controller.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_themes.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({super.key});

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  final _formKey = GlobalKey<FormState>();
    final AppAuthController _appAuthController  = Get.find<AppAuthController>();


  @override 
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            //email
            CustomFormField(
              hint: "Email", 
              iconData: CupertinoIcons.mail, 
              isHidden: false, 
              isEmail: true,
              controller: _appAuthController.emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            // password
            CustomFormField(
              hint: "Password", 
              iconData: Icons.password, 
              isHidden: true, 
              isEmail: false,
              controller: _appAuthController.passwordController,
              keyboardType: TextInputType.text,
              ),
          
            // forgot password
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [          
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/forgotPassword');
                    },
                    child: Text(
                      "Forgot password?",
                      style: MyTextTheme.subtitle2,
                    ),
                  ),
                ],
              ),
          
            // Problem contact admin
            Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: 300,
            
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Any problem in signing in do contact the ",
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
            
            Obx(() {
              return RoundButton(
                title: "Login",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _appAuthController.login();
                  }
                },
                loading: _appAuthController.isLoading,
              );
            })
           
          ],
        ),
      ),
    );
  }
}