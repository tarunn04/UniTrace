// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/details_controller.dart';
import '../models/studentModel.dart';
import '../utils/constants.dart';
import '../utils/text_themes.dart';
import '../widgets/map/maputils/profile_address_tile.dart';
import '../widgets/map/maputils/profile_info_tile.dart';
import '../widgets/map/maputils/profile_name_img.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({
    Key? key,
  }) : super(key: key);


  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  DetailController _detailController = Get.find();
  @override
  Widget build(BuildContext context) { 
    final index = Get.arguments;
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
            name: _detailController.students[index].name.toUpperCase(),
            email: _detailController.students[index].email,
          ),
          
          SizedBox(height: Get.height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileInfoTile(
                headingField: "Roll No",
                body: _detailController.students[index].rollNo,
              ),
              ProfileInfoTile(
                headingField: "Bus",
                body: _detailController.students[index].bus,
              ),              
            ],
          ),
          SizedBox(height: Get.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               
              ProfileInfoTile(
                headingField: "Mobile no",
                body: _detailController.students[index].mobileNo,
              ),           
              ProfileInfoTile(
                headingField: "Residence No",
                body: _detailController.students[index].residenceNo,
              ),
            ],
          ),
          SizedBox(height: Get.height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ProfileInfoTile(
                headingField: "Blood Type",
                body: _detailController.students[index].bloodType,
              ),
              ProfileInfoTile(
                headingField: "DOB",
                body: _detailController.students[index].dob,
              ),                
            ],
          ),
          SizedBox(height: Get.height*0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ProfileInfoTile(
                headingField: "Branch",
                body: _detailController.students[index].branch,
              ),
              ProfileInfoTile(
                headingField: "Duration",
                body: _detailController.students[index].duration,
              ),                
            ],
          ),
          SizedBox(height: Get.height*0.03,),
          ProfileAddressTile(
            address: _detailController.students[index].address,
          ),
          
        ],
      ),
    );
  }
}
