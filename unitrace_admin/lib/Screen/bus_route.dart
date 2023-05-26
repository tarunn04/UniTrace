import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unitrace_admin/Screen/driver_profile.dart';
import 'package:unitrace_admin/Screen/profile.dart';
import 'package:unitrace_admin/Screen/student_profile.dart';
import 'package:unitrace_admin/Theme/text_theme.dart';
import 'package:unitrace_admin/widget/my_dropdown_button.dart';
import 'package:unitrace_admin/widget/student_profile_form.dart';

import '../utils/profile_list.dart';

class BusRoute extends StatefulWidget {
  const BusRoute({Key? key}) : super(key: key);

  @override
  State<BusRoute> createState() => _BusRouteState();
}

class _BusRouteState extends State<BusRoute> {
  String? _selectedBus;
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
                height: h * 0.25,
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
                        "Bus and Student Detail",
                        style: MyTextTheme.headline4,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 0.3,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(228, 228, 228, 0.79),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButtonFormField<String>(
                            hint: Text('BUS',
                                style: MyTextTheme.headline4
                                    .copyWith(fontSize: 20)),
                            alignment: Alignment.bottomCenter,
                            value: _selectedBus,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            items: ProfileList().busList.map((bus) {
                              return DropdownMenuItem<String>(
                                value: bus,
                                child: Text(bus),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedBus = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a bus';
                              }
                              return null; // return null if value is valid
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: h * 0.7,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('driver')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> driverSnapshot) {
                      if (driverSnapshot.hasError) {
                        return Text('Error: ${driverSnapshot.error}');
                      }
                      if (driverSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('student')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> studentSnapshot) {
                          if (studentSnapshot.hasError) {
                            return Text('Error: ${studentSnapshot.error}');
                          }
                          if (studentSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          // Filter drivers and students by selected bus
                          List<QueryDocumentSnapshot> drivers = driverSnapshot
                              .data!.docs
                              .where((doc) => doc['bus'] == _selectedBus)
                              .toList();
                          List<QueryDocumentSnapshot> students = studentSnapshot
                              .data!.docs
                              .where((doc) => doc['bus'] == _selectedBus)
                              .toList();
                          return 
                            ListView.builder(
                              padding: EdgeInsets.all(20),
                              itemCount: drivers.length + students.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (index < drivers.length) {
                                  // Display driver
                                  var driver = drivers[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      
                                        color: Colors.grey[400],
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[300]!))
                                                
                                                ),
                                       
                                    child: ListTile(
                                      
                                      leading: Icon(Icons.person),
                                      title: Text(driver['name']),
                                      subtitle: Text(driver['email']),
                                      trailing: Text("Driver"),
                                      onTap: () {
                                        Navigator.push(context, 
                                        MaterialPageRoute(builder: (context) => DriverProfile(email: driver['email'],))
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  // Display student
                                  var student =
                                      students[index - drivers.length];
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[300]!))),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => StudentProfile(email: student['email'],)));
                                      },
                                      leading: Icon(Icons.person),
                                      title: Text(student['name']),
                                      subtitle: Text(student['email']),
                                      trailing: Text("Student"),
                                    ),
                                  );
                                }
                              },
                            
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
