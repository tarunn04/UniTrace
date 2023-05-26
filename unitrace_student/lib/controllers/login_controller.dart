
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:unitrace_student/views/map_screen.dart';

import '../utils/utils.dart';

class AppAuthController extends GetxController{
  
  FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool _isLoading = false.obs;
  RxBool _isLoggedIn = false.obs;

  RxString _errorMessage = ''.obs;

  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => _isLoggedIn.value;
  String get errorMessage => _errorMessage.value;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DetailController _detailController = Get.put(DetailController());
  // void onClose(){
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
  
  Future<void> login()async{
    try{
      _isLoading.value = true;

      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );
      await _detailController.fetchStudents();
      Get.offAllNamed('/mapScreen');

      _isLoggedIn.value = true;
      _isLoading.value = false;
      _errorMessage.value = '';

    }on FirebaseAuthException catch(e){
      _isLoading.value = false;
      _errorMessage.value = e.message!;  
      Utils().ShowToastMessage(e.message!);
    }
  }

  void logout() async{
    // onClose();
    await _auth.signOut();
    emailController.clear();
    passwordController.clear();
    _isLoggedIn.value = false;
    Get.offAllNamed('/login');

  }

  void forgotPassword() async{
    try{
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      Utils().ShowToastMessage('Password reset email sent');
    }on FirebaseAuthException catch(e){
      Utils().ShowToastMessage(e.message!);
    }
  }

}