import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_admin/Screen/Authentication/auth_screen.dart';
import 'package:unitrace_admin/Screen/bus_route.dart';
import 'package:unitrace_admin/Screen/SignupAccount/busdriver_detail.dart';
import 'package:unitrace_admin/Screen/SignupAccount/student_details_screen.dart';
import 'package:unitrace_admin/Screen/driver_profile.dart';
import 'package:unitrace_admin/Screen/student_profile.dart';
import 'package:unitrace_admin/repository/user_repository/user_repository.dart';

import 'package:unitrace_admin/utils/profile_list.dart';
import 'package:unitrace_admin/widget/student_profile_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Color.fromARGB(255, 227, 227, 227),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: h * 0.4,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color.fromRGBO(118, 118, 118, 0.972),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Container(
                    height: h * 0.23,
                    width: w * 0.6,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 34, 34, 34),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/grover.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Text(
                    "BUS MANAGER",
                    style: TextStyle(
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 219, 218, 218),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.06,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentDetailsScreen()));
              },
              child: Container(
                height: h * 0.1,
                width: w * 0.95,
                decoration: BoxDecoration(
                  color: Color.fromARGB(109, 10, 10, 10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.person_crop_circle,
                      size: 40,
                      color: Color.fromARGB(255, 231, 231, 231),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      "Create Student Profile",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 231, 231, 231)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusDetailScreen()));
              },
              child: Container(
                height: h * 0.1,
                width: w * 0.95,
                decoration: BoxDecoration(
                  color: Color.fromARGB(109, 10, 10, 10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.bus,
                      size: 40,
                      color: Color.fromARGB(255, 231, 231, 231),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      "Create Driver Profile",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 231, 231, 231)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusRoute()));
              },
              child: Container(
                height: h * 0.1,
                width: w * 0.95,
                decoration: BoxDecoration(
                  color: Color.fromARGB(109, 10, 10, 10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_present,
                      size: 40,
                      color: Color.fromARGB(255, 231, 231, 231),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      "Student Driver Database",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 231, 231, 231)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.06,
            ),
            ElevatedButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(
                    118, 118, 118, 0.972), // set background color
                elevation: 4, // add an elevation effect
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
