import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitrace_student/utils/constants.dart';

import '../utils/text_themes.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        backgroundColor:redBg,
        elevation: 0,
      ),
      
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: Get.height*0.2,
              width: Get.width,
              color: redBg,
              // color: Color.fromARGB(255, 240, 100, 100),
              child: Text("About UniTrace",
                textAlign: TextAlign.center,
                style: MyTextTheme.notosans.copyWith(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
                
              ),
            ),
          ),
          
          Positioned(
            top: Get.height*0.08,
            left: Get.width*0.24,
            
            child: Container(
              height: Get.height*0.25,
              width: Get.width*0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset("assets/images/logo.png",
              fit: BoxFit.fill,),
            ),
          ),

          Positioned(
            top: Get.height*0.38,
            left: Get.width*0.1,
            right: Get.width*0.1, 
            child: Text("Introducing the UniTrace app, co-created by Tarun and Akshit - the real-time bus tracker app for college students! With features like real-time GPS tracking, live bus arrival times, and customizable notifications, you'll never have to worry about missing your ride again. Plus, the app's user-friendly interface and intuitive design make it easy to use for students of all levels.",
            textAlign: TextAlign.justify,
            style: MyTextTheme.notosans.copyWith(
              color: Color.fromARGB(255, 46, 46, 46),
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
            ),
            ),

            
            // child: Container(
            //   height: Get.height*0.3,
            //   width: Get.width*0.9,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 1,
            //         blurRadius: 1,
            //         offset: const Offset(0, 1), // changes position of shadow
            //       ),
            //     ],
            //   ),
            // ), 
            
        ],
      ),
    );
  }
}