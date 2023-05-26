import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants.dart';

class LoginBgImage extends StatelessWidget {
  const LoginBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Image.asset(
          "assets/images/auth.png",
          fit: BoxFit.cover,
        ),
    ));
  }
}