// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_student/controllers/details_controller.dart';

import 'package:unitrace_student/utils/constants.dart';

import '../../utils/text_themes.dart';

class RideInfo extends StatefulWidget {
  RideInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<RideInfo> createState() => _RideInfoState();
}

class _RideInfoState extends State<RideInfo> {
  DetailController _detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Container(
          height: Get.height *0.08,
          width: Get.width * 0.83,
          decoration: BoxDecoration(
            
            color: Color.fromRGBO(208, 208, 208, 0.7),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _detailController.streamStatus.isTrue ?
                _detailController.rideStarted.isTrue ? 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Location is being Shared...   ${_detailController.busSpeed} kmph",style: MyTextTheme.notosans.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade700,
                      ),),
                
                    ],
                  )
                :
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Text("Last Location was shared on",style: MyTextTheme.notosans.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade600,
                      ),),
                      SizedBox(height: 5.0,),
                      Text("${_detailController.lastSharedTime}",style: MyTextTheme.notosans.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 71, 71, 71),
                      ),),
                
                    ],
                  )
                  : 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Text("Streaming is paused",style: MyTextTheme.notosans.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade600,
                      ),),
                      
                    ],
                  )
              ],
            ),
          ),
    );
  }
}

