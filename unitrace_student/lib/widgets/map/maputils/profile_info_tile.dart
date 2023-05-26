// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/text_themes.dart';

class ProfileInfoTile extends StatelessWidget {
  String headingField;
  String body;
   ProfileInfoTile({
    Key? key,
    required this.headingField,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.44,
      height: Get.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Text(headingField,
          style: MyTextTheme.notosans.copyWith(
            fontSize: 14,
            color: Color.fromARGB(255, 99, 99, 99),
          ),),
          SizedBox(height: 2,),
          Text(body,
          style:MyTextTheme.notosans.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(66, 66, 66, 1),
          ),
          ),
        ],),
      ),
      );
  }
}
