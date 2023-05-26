// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:unitrace_student/utils/constants.dart';
import 'package:unitrace_student/widgets/common/round_button.dart';

import '../../utils/text_themes.dart';

class MapUtilityWidget extends StatefulWidget {
  IconData userIcon;
  String text;
  Color iconColor;
  VoidCallback callbackAction;

  MapUtilityWidget({
    Key? key,
    required this.userIcon,
    required this.text,
    required this.iconColor,
    required this.callbackAction,
  }) : super(key: key);

  @override
  State<MapUtilityWidget> createState() => _MapUtilityWidgetState();
}

class _MapUtilityWidgetState extends State<MapUtilityWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.callbackAction,
        child: Container(
            height: Get.height *0.05,
            width: Get.width * 0.25,
            decoration: BoxDecoration(
              color: Color.fromRGBO(208, 208, 208, 0.7),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(widget.userIcon,
               color:widget.iconColor
              ),
              
              
              SizedBox(width: Get.width*0.01,),
              //text icon
              Text("${widget.text}",style: MyTextTheme.notosans.copyWith(
                color: mapTextPage,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),)
              
            ],),
          ),
      );
  }
}
