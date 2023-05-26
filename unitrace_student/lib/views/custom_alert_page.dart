
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:location/location.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:unitrace_student/controllers/slider_controller.dart';
import 'package:unitrace_student/utils/constants.dart';
import 'package:unitrace_student/utils/text_themes.dart';
import 'package:unitrace_student/widgets/common/round_button.dart';


class CustomAlertPage extends StatefulWidget {
  @override
  _CustomAlertPageState createState() => _CustomAlertPageState();
}

class _CustomAlertPageState extends State<CustomAlertPage> {
  // UtilController _utilController = Get.put(UtilController());
  DetailController _detailController = Get.find<DetailController>();
  SliderController _sliderController = Get.find<SliderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redBg,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: Get.height *0.08,
          width: Get.width,
          decoration: BoxDecoration(
            color: redBg,
          ),
          child: Row(
            children: [
              Text(
                "Alert Settings",
                style: MyTextTheme.notosans.copyWith(
                  // color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),

              Text("Distance Alert",
              style: MyTextTheme.notosans.copyWith(fontSize: 20, fontWeight: FontWeight.w900),),
              
              Obx(
                ()=> Text("Alert when you are within ${_sliderController.distance} km of your target",
                style: MyTextTheme.notosans.copyWith(fontSize: 14,
                color: Colors.grey[700],
                 fontWeight: FontWeight.w400),),
              ),
              
              Obx(
                ()=> Slider(
                  value: _sliderController.distance.value,
                  min: 0.0,
                  max:10.0,
                  activeColor: redBg,
                  divisions: 20,
                  onChanged: (value){
                    _sliderController.setDistance(value);
                  },
                ),
              ),

              SizedBox(height: 20,),

              Text("Time Alert",
              style: MyTextTheme.notosans.copyWith(fontSize: 20, fontWeight: FontWeight.w900),),
              
              Obx(
                ()=> Text("Alert within ${_sliderController.time} minutes left to reach the stop",
                style: MyTextTheme.notosans.copyWith(fontSize: 14,
                color: Colors.grey[700],
                 fontWeight: FontWeight.w400),),
              ),
              
              Obx(
                ()=> Slider(
                  value: _sliderController.time.value.roundToDouble(),
                  min: 0.0,
                  max: 60.0,
                  activeColor: redBg,
                  divisions: 60,
                  onChanged: (value){
                    _sliderController.setTime(value.round());
                  },
                ),
              ),
              SizedBox(height: 20,),

              Center(
                child: Obx(
                  () => Text("Distance alert is set for ${_detailController.distanceAlert} km",
                  style: MyTextTheme.notosans.copyWith(fontSize: 16,
                    color: Colors.grey[700],
                     fontWeight: FontWeight.w400),
                  ),
                ),
              ),

              Center(
                child: Obx(
                  () => Text("Time alert is set for ${_detailController.timeAlert} minutes",
                  style: MyTextTheme.notosans.copyWith(fontSize: 16,
                    color: Colors.grey[700],
                     fontWeight: FontWeight.w400),
                  ),
                ),
              ),

              SizedBox(height: Get.height*0.3,),

              Center(
                child: RoundButton(title: "Set Alert", onTap: () {
                  _sliderController.setAlert();
                },),
              ),
              
            ],
          ),
        ),
      ]),
    );
  }


}
