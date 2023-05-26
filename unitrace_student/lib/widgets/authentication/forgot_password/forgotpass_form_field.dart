import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:unitrace_student/controllers/login_controller.dart';
import 'package:unitrace_student/widgets/common/custom_form_field.dart';
import 'package:unitrace_student/widgets/common/round_button.dart';

import '../../../utils/constants.dart';
import '../../../utils/text_themes.dart';

class ForgotFormField extends StatefulWidget {
  const ForgotFormField({super.key});

  @override
  State<ForgotFormField> createState() => _ForgotFormFieldState();
}

class _ForgotFormFieldState extends State<ForgotFormField> {
  final _formKey = GlobalKey<FormState>();
  AppAuthController _appAuthController = Get.find<AppAuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Text(
              "Enter your email address and we will send you a link to reset your password",
              textAlign: TextAlign.center,
              style: MyTextTheme.bodyText1.copyWith(
                color: primaryActiveTextColor,
              ),
            ),
            
            SizedBox(height: Get.height*0.03,),

            //email
            CustomFormField(
              hint: "Register Email", 
              iconData: CupertinoIcons.mail, 
              isHidden: false, 
              isEmail: true,
              controller: _appAuthController.emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: Get.height*0.04,),
            
            // submit button
            Obx(() {
              return RoundButton(
                title: "Submit",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _appAuthController.forgotPassword();
                  }
                },
                loading: _appAuthController.isLoading,
              );
            }),
            // RoundButton(title: "Submit", onTap: (){}),
            
            SizedBox(height: Get.height*0.1,),
            
            // back to login text
            TextButton(onPressed: (){
              Get.back();
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, color: primaryActiveTextColor,size: 18),
                label: Text("Back to Login", style: MyTextTheme.headline4.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primaryPassiveTextColor,),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}