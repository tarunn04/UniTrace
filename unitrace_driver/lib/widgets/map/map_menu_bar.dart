import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constants.dart';

class MapMenuBar extends StatelessWidget {
  const MapMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,

      child: SizedBox(
        height: Get.height * 0.05,
        width: Get.width * 0.11,

        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 249, 247, 247),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

        onPressed: () {
          Get.toNamed("/userMenu");
        },
        
        child: Icon(Icons.menu,
         color: mapTextPage,
         size: Get.width*0.1,
         ),
        ),
      ),
    );
  }
}

