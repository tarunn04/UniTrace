// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:unitrace_student/utils/constants.dart';

import '../../../utils/text_themes.dart';

class ProfileNameImg extends StatelessWidget {
  String name;
  String email;
   ProfileNameImg({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.3,
      decoration: BoxDecoration(
      // color: Colors.white,
      color: redBg,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 6,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: Get.width*0.2,
              backgroundColor: Color.fromARGB(255, 232, 229, 229),
              backgroundImage: AssetImage("assets/images/tarun.jpeg"),
              // child: Icon(Icons.person,
              // color: Color.fromRGBO(79, 78, 78, 0.852),
              // size: 50,
              // ),
            ),
          ),
          
          SizedBox(height: Get.height*0.01,),

          Text(name,
          style: MyTextTheme.notosans.copyWith(
            fontSize: 40,
            color: Color.fromARGB(255, 46, 46, 46),
          ),),

          SizedBox(height: Get.height*0.001,),
          
          Text(email,
          style: MyTextTheme.notosans.copyWith(
            fontSize: 15,
            color: Color.fromARGB(255, 46, 46, 46),
          ),),
        ],
      ),
    );
  }
}
