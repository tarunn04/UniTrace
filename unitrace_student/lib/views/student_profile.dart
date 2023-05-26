import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:unitrace_student/utils/constants.dart';
import 'package:unitrace_student/utils/text_themes.dart';

import '../widgets/map/maputils/profile_address_tile.dart';
import '../widgets/map/maputils/profile_info_tile.dart';
import '../widgets/map/maputils/profile_name_img.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  DetailController _detailController = Get.find();
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        // backgroundColor: Colors.white,
        backgroundColor: redBg,
        elevation: 0,
        title: Text('Student Profile',
        style: MyTextTheme.notosans.copyWith(
          fontSize: 20,
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        ),
      ),

      body: Column(
        children: [
          
          ProfileNameImg(
            name: _detailController.student[0].name,
            email: _detailController.student[0].email,
          ),
          
          SizedBox(height: Get.height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileInfoTile(
                headingField: "Roll No",
                body: _detailController.student[0].rollNo,
              ),
              ProfileInfoTile(
                headingField: "Bus",
                body: _detailController.student[0].bus,
              ),              
            ],
          ),
          SizedBox(height: Get.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               
              ProfileInfoTile(
                headingField: "Mobile no",
                body: _detailController.student[0].mobileNo,
              ),           
              ProfileInfoTile(
                headingField: "Residence No",
                body: _detailController.student[0].residenceNo,
              ),
            ],
          ),
          SizedBox(height: Get.height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ProfileInfoTile(
                headingField: "Blood Type",
                body: _detailController.student[0].bloodType,
              ),
              ProfileInfoTile(
                headingField: "DOB",
                body: _detailController.student[0].dob,
              ),                
            ],
          ),
          SizedBox(height: Get.height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ProfileInfoTile(
                headingField: "Branch",
                body: _detailController.student[0].branch,
              ),
              ProfileInfoTile(
                headingField: "Duration",
                body: _detailController.student[0].duration,
              ),                
            ],
          ),
          SizedBox(height: Get.height*0.03,),
          ProfileAddressTile(
            address: _detailController.student[0].address,
          ),
          
        ],
      ),
    );
  }
}
