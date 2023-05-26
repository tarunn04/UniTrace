import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:unitrace_driver/Screen/driver_profile.dart';
import 'package:unitrace_driver/Screen/forgot_password_screen.dart';
import 'package:unitrace_driver/Screen/login_screen.dart';
import 'package:unitrace_driver/Screen/splash_screen.dart';
import 'package:unitrace_driver/Screen/user_menu.dart';

import 'Routes/routes.dart';
import 'Screen/dummy_map_screen.dart';

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
      // home: DummyMap(),
    );
  }
}
