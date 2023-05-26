import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_driver/utils/constants.dart';

import '../../utils/text_themes.dart';

class MapUtilityWidget extends StatefulWidget {
  IconData userIcon;
  String text;
  Color iconColor;

  MapUtilityWidget({
    Key? key,
    required this.userIcon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  State<MapUtilityWidget> createState() => _MapUtilityWidgetState();
}

class _MapUtilityWidgetState extends State<MapUtilityWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          Text("${widget.text}",style: MyTextTheme.bodyText2.copyWith(
            fontFamily: GoogleFonts.mukta().fontFamily,
            color: mapTextPage,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),)
          
        ],),
      ),
    );
  }
}
