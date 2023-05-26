import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_driver/utils/constants.dart';

import '../../utils/text_themes.dart';

class BusEtaInfo extends StatelessWidget {
  const BusEtaInfo({
    super.key,
  });

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
        child: Text(
          "Bus is 2.5 km away from your location",
            style:MyTextTheme.mukta,
            
          ),
      ),
    );
  }
}

