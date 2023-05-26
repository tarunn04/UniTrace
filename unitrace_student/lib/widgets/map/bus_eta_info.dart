import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:unitrace_student/utils/constants.dart';

import '../../utils/text_themes.dart';

class BusEtaInfo extends StatefulWidget {
  const BusEtaInfo({
    super.key,
  });

  @override
  State<BusEtaInfo> createState() => _BusEtaInfoState();
}

class _BusEtaInfoState extends State<BusEtaInfo> {
  DetailController _detailController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height *0.07,
      width: Get.width * 0.83,
      decoration: BoxDecoration(
        color: Color.fromRGBO(208, 208, 208, 0.7),
        borderRadius: BorderRadius.circular(12.0),
      ),
      //eta info
      child: Center(
        child: Obx(
           () => 
            _detailController.streamStatus.isTrue ?
                _detailController.rideStarted.isTrue ? 
            Text(
              "${_detailController.distance.toStringAsFixed(2)} km away and will take ${_detailController.timeInMin.toStringAsFixed(2)} min",
                style:MyTextTheme.notosans.copyWith(
                fontSize: 16.0,
                color: mapTextPage,
                ),  
              ):

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text("Last Location ",style: MyTextTheme.notosans.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.shade600,
                  ),),
                  SizedBox(height: 2.0,),
                  Text(
                    "${_detailController.distance.toStringAsFixed(2)} km away and will take ${_detailController.timeInMin.toStringAsFixed(2)} min",
                      style:MyTextTheme.notosans.copyWith(
                      fontSize: 16.0,
                      color: mapTextPage,
                      ),  
                    )
                ],
              )
              :
              Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Text("Start Streaming to get the location",style: MyTextTheme.notosans.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade600,
                      ),),
                      
                    ],
                  )
        ),
      ),
    );
  }
}

