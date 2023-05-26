// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_driver/controllers/details_controller.dart';
import 'package:unitrace_driver/utils/text_themes.dart';
import 'package:unitrace_driver/widgets/map/usermap_utility.dart';
import 'bus_eta_info.dart';
import 'driver_info_map.dart';

class FloatingDockInfo extends StatefulWidget {
  const FloatingDockInfo({
    super.key,
  });

  @override
  State<FloatingDockInfo> createState() => _FloatingDockInfoState();
}

class _FloatingDockInfoState extends State<FloatingDockInfo> {
  DetailController _detailController = Get.find<DetailController>();
  @override
  Widget build(BuildContext context) {

    //bottom sheet
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      
      child: Container(
        height: Get.height *0.11,
        decoration: BoxDecoration(

          // shadow
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 173, 172, 172).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Color.fromARGB(255, 249, 247, 247),
          borderRadius: BorderRadius.circular(18.0),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20.0
            ),
            
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //call aleart and chat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  Obx(
                    () => InkWell(
                      onTap: () {
                        _detailController.isRideStarted.isTrue ? _detailController.startRide():_detailController.stopRide();
                        _detailController.isRideStarted.value = !_detailController.isRideStarted.value;
                      },
                  
                      child: _detailController.isRideStarted.isTrue?                
                        MapUtilityWidget( userIcon: CupertinoIcons.up_arrow,
                        text: "START",
                        iconColor: Colors.green,):
                        MapUtilityWidget( userIcon: CupertinoIcons.stop,
                        text: "STOP", 
                        iconColor: Colors.red,),
                    ),
                  ),  

                  Obx(() {
                    return _detailController.isRideStarted.isTrue?
                    Text("Tap to start sharing the ride",
                    style: MyTextTheme.notosans.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                    ):
                    Text("Tap to stop sharing the ride",
                    style: MyTextTheme.notosans.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),);
                    
                  })
                  
                ],

              )

              // DriverInfo(),
              // BusEtaInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

