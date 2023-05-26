import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unitrace_student/routes/routes.dart';
import 'package:unitrace_student/utils/constants.dart';
import 'package:unitrace_student/views/driver_profile.dart';
import 'package:unitrace_student/views/dummymap.dart';
import 'package:unitrace_student/views/forgot_password_screen.dart';
import 'package:unitrace_student/views/login_screen.dart';
import 'package:unitrace_student/views/map_screen.dart';
import 'package:unitrace_student/views/splash_screen.dart';
import 'package:get/get.dart';
import 'package:unitrace_student/views/student_profile.dart';
import 'package:unitrace_student/views/user_menu.dart';
import 'package:unitrace_student/widgets/map/maputils/user_menu_tile.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: appRoutes(),
      // home: LocationTracking(),
    );
  }
}
