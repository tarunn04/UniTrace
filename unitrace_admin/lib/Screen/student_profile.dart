// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:unitrace_admin/Theme/text_theme.dart';

import '../widget/custom_profile_container.dart';

class StudentProfile extends StatefulWidget {
  String email;
  StudentProfile({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        title: Text('Student Profile',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.5)),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('student')
              .where('email', isEqualTo: widget.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: w * 0.25,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/images/21.jpeg'),
                        ),
                        SizedBox(
                          height: h*0.01,
                        ),
                        Text(
                          ' ${data['name']}',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: h*0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileContainer(mainText:"Email", subText:"${data['email']}",),
                            ProfileContainer(mainText:"Roll no", subText:"${data['rollNo']}",),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileContainer(mainText:"DOB", subText:"${data['dob']}",),
                            ProfileContainer(mainText:"Blood Group", subText:"${data['bloodType']}",),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileContainer(mainText:"Mobile No", subText:"${data['mobileNo']}",),
                            ProfileContainer(mainText:"Bus ", subText:"${data['bus']}",),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                      height: h * 0.07,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(228, 228, 228, 0.835),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 109, 109, 109).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          "Address",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          data['address'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      )),

                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
