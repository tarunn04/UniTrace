import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:unitrace_student/controllers/details_controller.dart';

class SplashScreenController extends GetxController {
  final _auth = FirebaseAuth.instance.obs;
  final DetailController _detailController = DetailController();
  
    islogin(){
      final user = _auth.value.currentUser;

      if(user!= null) {
        _detailController.fetchStudents();
        Timer(Duration(seconds: 3), 
        () => Get.offAllNamed('/mapScreen'));
      }else{
        Timer(Duration(seconds: 3), 
        () => Get.offAllNamed('/login'));
      }
    }
}