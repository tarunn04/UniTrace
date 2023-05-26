// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:unitrace_driver/utils/constants.dart';

import '../../utils/text_themes.dart';

class DriverInfo extends StatefulWidget {
  DriverInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
  // DetailController _detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/driverProfile'),
      child: Container(
          height: Get.height *0.09,
          width: Get.width * 0.83,
          decoration: BoxDecoration(
            
            color: Color.fromRGBO(208, 208, 208, 0.7),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  
                  //circle avatar
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(139, 78, 77, 77),
                        width: 2.0,
                      )
                    ),
                    child: CircleAvatar(
                      radius: Get.width * 0.07,
                      backgroundImage: AssetImage("assets/images/21.jpeg"),
                    ),
                  ),
                ),
    
                SizedBox(width: Get.width*0.03,),
    
                //driver name
                // Obx(() {
                //   return Text(
                //     _detailController.driver != null && _detailController.driver.isNotEmpty
                //         ? _detailController.driver[0].name
                //         : 'Driver',
                //     style: MyTextTheme.mukta.copyWith(color: mapTextPage),
                //   );
                // }),

                SizedBox(width: Get.width*0.02,),
    
              //bus name
                // Obx(() {
                //   return Text(
                //     _detailController.driver != null && _detailController.driver.isNotEmpty
                //         ? "(${_detailController.driver[0].bus})"
                //         : '(Bus)',
                //     style: MyTextTheme.mukta.copyWith(color: mapTextPage),
                //   );
                // }),
                
              ],
              ),
              
            
              
            ],
          ),
        ),
    );
  }
}

