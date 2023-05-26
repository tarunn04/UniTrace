

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/details_controller.dart';
import '../../utils/constants.dart';
import '../../utils/text_themes.dart';

class StudentListTitle extends StatelessWidget {
  const StudentListTitle({
    super.key,
    required DetailController detailController,
  }) : _detailController = detailController;

  final DetailController _detailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height*0.15,
      color: redBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,                 
          children: [
            Text('Student List',style: MyTextTheme.notosans.copyWith(
              fontSize: 45,
              color: Colors.white,
            ),),
            Text('Bus: ${_detailController.driver[0].bus.capitalizeFirst}',style: MyTextTheme.notosans.copyWith(
              fontSize: 30,
              color: Colors.white,
            ),),
          ],
        ),
      )
    );
  }
}