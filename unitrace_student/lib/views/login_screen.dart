import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitrace_student/controllers/login_controller.dart';
import 'package:unitrace_student/utils/constants.dart';

import '../widgets/authentication/login/login_bg_image.dart';
import '../widgets/authentication/login/login_text_area.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AppAuthController _appAuthController = Get.put(AppAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            LoginBgImage(),
            
            LoginTextArea(),
          ],
        ),
    );
  }
}

