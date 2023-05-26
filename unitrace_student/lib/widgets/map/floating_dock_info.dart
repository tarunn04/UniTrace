import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:unitrace_student/widgets/map/bus_eta_info.dart';
import 'package:unitrace_student/widgets/map/driver_info_map.dart';
import 'package:unitrace_student/widgets/map/usermap_utility.dart';

class FloatingDockInfo extends StatefulWidget {
  const FloatingDockInfo({super.key});

  @override
  State<FloatingDockInfo> createState() => _FloatingDockInfoState();
}

class _FloatingDockInfoState extends State<FloatingDockInfo> {
  DetailController _detailController = Get.find<DetailController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      child: Container(
        height: Get.height*0.27,
        width: Get.width*0.9,
        decoration: BoxDecoration(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  MapUtilityWidget(userIcon: CupertinoIcons.phone_fill,
                   text: "Call",
                    iconColor: Colors.green.shade300,
                     callbackAction: (){
                      _detailController.launchPhoneURL(_detailController.driver.first.mobileNo);
                     }
                  ),
                  MapUtilityWidget(userIcon: CupertinoIcons.bell_fill,
                   text: "Alert",
                    iconColor: Colors.red.shade300,
                     callbackAction: (){
                      Get.toNamed("/customAlert");
                     }
                  ),
                  MapUtilityWidget(userIcon: CupertinoIcons.chat_bubble_2_fill,
                   text: "Chat",
                    iconColor: Colors.blue.shade300,
                     callbackAction: (){
                      Get.toNamed("/chatScreen");
                     }
                  ),
                ],
               ),

              RideInfo(),

              BusEtaInfo(),
          ],
        ),
      ));
  }
}