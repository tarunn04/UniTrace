import 'dart:async';
import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unitrace_admin/Screen/home_screen.dart';

import '../Screen/Authentication/auth_screen.dart';

class SplashScreenServices {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if(user!= null){
      Timer(Duration(seconds: 4), () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),  
            ));
      });
    }else{
      Timer(Duration(seconds: 4), () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>AuthScreen(),
            ));
      });
    }
    
  }
}
