import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitrace_driver/controllers/details_controller.dart';

import '../utils/constants.dart';
import '../utils/text_themes.dart';
import '../widgets/studentList/student_list_title.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  DetailController _detailController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        backgroundColor: redBg,
        elevation: 0,
      ),
      body: Column(
        children: [
          StudentListTitle(detailController: _detailController),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: _detailController.students.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/studentProfile', arguments: index);
                      },
                      child: Container(
                        width: Get.width,
                        height: Get.height*0.1,
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        child: ListTile(
                          title: Text(
                            _detailController.students[index].name.toUpperCase(),
                            style: MyTextTheme.notosans.copyWith(
                              fontSize: 20,
                              color: Color.fromARGB(255, 46, 46, 46),
                            ),
                            ),
                          subtitle:Text(
                            _detailController.students[index].email,
                          ),
                          trailing: Text("${_detailController.students[index].rollNo}"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                );
              },)
              ),
          ),
        ],
      ),
      
    );
  }
}
