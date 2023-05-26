import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotpassBgImage extends StatelessWidget {
  const ForgotpassBgImage({
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