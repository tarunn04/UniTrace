
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:unitrace_student/utils/utils.dart';

import '../utils/text_themes.dart';

DetailController _detailController = Get.find<DetailController>();
class SliderController extends GetxController{
  var distance = 0.0.obs;

  void setDistance(double value){
    distance.value = value;
  }
  var time = 0.obs;

  void setTime(int value){
    time.value = value;
  }

  void setAlert(){
    _detailController.alert.value = true;
    _detailController.distanceAlert.value = distance.value;
    _detailController.timeAlert.value = time.value;
    Utils().ShowToastMessage("Alert Set distace: ${distance.value} Km time: ${time.value} Min");
  }

  void playRingtone(){
   FlutterRingtonePlayer.play(
    fromAsset: "assets/music/pushinP.mp3",
    
    looping: true,
    );
 

    _detailController.alert.value = false;

    Get.dialog(
       AlertDialog(
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text("Alert",style: MyTextTheme.notosans.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),),
          content: Text("Bus is ${_detailController.distance.toStringAsFixed(2)} Km Away\n${_detailController.timeInMin.toStringAsFixed(1)} min left to reach the stop",
          style: MyTextTheme.notosans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700]
          ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          actions: [
            Center(
              child: TextButton(onPressed: (){
                Get.back();
              }, child: Text("Ok",style: MyTextTheme.notosans.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),)),
            ),
          ],
        ),
    
    );
  }

  togglePresent(){
    Get.dialog(AlertDialog(
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text("Alert",
          style: MyTextTheme.notosans.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),),
          content: Text("Are you coming to the stop?",
          style: MyTextTheme.notosans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700]
          ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          actions: [
            Row(
              children: [
                TextButton(onPressed: (){
                _detailController.updateAttendencePresent();
                Get.back();
                }, child: Text("Yes",style: MyTextTheme.notosans.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),)),

                TextButton(onPressed: (){
                 _detailController.updateAttendenceAbsent();
                Get.back();
                }, child: Text("No",style: MyTextTheme.notosans.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),))
              ],

            )
          ],
        )
    );
  }
}
