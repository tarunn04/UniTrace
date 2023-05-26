import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unitrace_admin/Theme/text_theme.dart';
import 'package:unitrace_admin/utils/profile_list.dart';
import 'package:unitrace_admin/widget/custom_text_field.dart';

import '../../widget/custom_profile_text.dart';
import '../../widget/student_profile_form.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
                        "Student Profile",
                        style: MyTextTheme.headline4,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/21.jpeg"),
                      ),
                      
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text("Student Details", style: MyTextTheme.headline4,),
              ),

            
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: h * 0.56,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
              

                  child: StudentProfileForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
