// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:unitrace_student/utils/constants.dart';

import '../../../utils/text_themes.dart';

class MyProfileDetails extends StatelessWidget {
  String name;
  String email;
   MyProfileDetails({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height*0.2,
      decoration: BoxDecoration(
        color: redBg,
        // color: Colors.white,
        border: BorderDirectional(
          bottom: BorderSide(
            color: Color.fromRGBO(133, 131, 131, 1),
            width: 0.1,
          ),
        )
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          SizedBox(width: Get.width*0.06,),
          
          CircleAvatar(
            radius: Get.width*0.14,
            backgroundColor: Color.fromRGBO(244,245,247, 1),
            backgroundImage: AssetImage(
              "assets/images/tarun.jpeg"
            ),
          ),
          
          SizedBox(width: Get.width*0.05,),
          
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name,style: MyTextTheme.notosans.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),), 
                Text(email,style: MyTextTheme.notosans.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),),
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
