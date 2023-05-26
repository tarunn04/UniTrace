import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants.dart';
import '../../../utils/text_themes.dart';
import 'forgotpass_form_field.dart';


class ForgotpassTextArea extends StatelessWidget {
  const ForgotpassTextArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        
        height:Get.height * 0.57,
        width: Get.width,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),

          color: loginFieldBgColor
        ),
       
        child: Padding(
          padding: const EdgeInsets.only(top:20),
          
          child: Column(
            children: [
              
              Text("FORGOT PASSWORD",
                style: MyTextTheme.headline4.copyWith(
                  color: primaryActiveTextColor
                ),
              ),
              Container(
                height: 4,
                width: 300,
                color: authUnderlineActive
                .withOpacity(0.8),
              ),
              ForgotFormField(),

            ],
          ),
        ),
      ));
  }
}

