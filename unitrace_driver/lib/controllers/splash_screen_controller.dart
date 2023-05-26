import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashScreenController extends GetxController {
  final _auth = FirebaseAuth.instance.obs;
  
    islogin(){
      final user = _auth.value.currentUser;

      if(user!= null){
        Timer(Duration(seconds: 3), 
        () => Get.offAllNamed('/mapScreen'));
      }else{
        Timer(Duration(seconds: 3), 
        () => Get.offAllNamed('/login'));
      }
    }
}