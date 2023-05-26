import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unitrace_admin/Screen/SignupAccount/driver_profile_form.dart';

import '../../Theme/text_theme.dart';

class BusDetailScreen extends StatefulWidget {
  const BusDetailScreen({super.key});

  @override
  State<BusDetailScreen> createState() => _BusDetailScreenState();
}

class _BusDetailScreenState extends State<BusDetailScreen> {
  
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          color: Color.fromARGB(255, 221, 220, 220),
          child: Column(
            children: [
              Container(
                height: h * 0.3,
                width: w,
                decoration: BoxDecoration(
                  // color:
                  color: Color.fromRGBO(
                    118, 118, 118, 0.972),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Driver Profile",
                        style: MyTextTheme.headline4,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/boy.png"),
                      ),
                      
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text("Bus Driver Details", style: MyTextTheme.headline4,),
              ),

            
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: h * 0.6,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
              
                  child: DriverProfileForm(),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
