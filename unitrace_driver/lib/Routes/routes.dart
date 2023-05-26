import 'package:get/get.dart';
import 'package:unitrace_driver/Screen/chat_page.dart';
import 'package:unitrace_driver/Screen/student_list.dart';
import 'package:unitrace_driver/Screen/student_profile.dart';

import '../Screen/about.dart';
import '../Screen/driver_profile.dart';
import '../Screen/dummy_map_screen.dart';
import '../Screen/forgot_password_screen.dart';
import '../Screen/login_screen.dart';
import '../Screen/map_screen.dart';
import '../Screen/splash_screen.dart';
import '../Screen/user_menu.dart';

appRoutes() => [
  
  GetPage(name: '/', 
  page:() => SplashScreen(),
  transition: Transition.leftToRightWithFade,
  transitionDuration: Duration(milliseconds: 300),
  ),

  GetPage(name: '/login', 
  page:() => LoginScreen(),
  transition: Transition.leftToRightWithFade,
  ),

  GetPage(name: '/forgotPassword', 
  page:() => ForgotPasswordScreen(),
  // transition: Transition.leftToRightWithFade,
  ),

  GetPage(name: '/mapScreen',
   page: () => MapScreen(),
   transition: Transition.noTransition,
  //  transitionDuration: Duration(milliseconds: 300),
   ),

   GetPage(name: '/driverProfile',
   page: () => DriverProfile(),
   transition: Transition.fade,
   transitionDuration: Duration(milliseconds: 100),
   ),

   GetPage(name: '/userMenu',
   page: () => UserUtilMapScreen(),
   transition: Transition.leftToRightWithFade,
   transitionDuration: Duration(milliseconds: 150),
   ),

   GetPage(name: '/mapScreen',
   page: () => MapScreen(),
   transition: Transition.noTransition,
  //  transitionDuration: Duration(milliseconds: 300),
   ),

   GetPage(name: "/appAbout",
    page: () => About(),
   transition: Transition.noTransition,
  //  transitionDuration: Duration(milliseconds: 300),
   ),

    GetPage(name: '/studentList',
   page: () => StudentList(),
   transition: Transition.noTransition,
  //  transitionDuration: Duration(milliseconds: 300),
   ),

  GetPage(name: '/studentProfile',
   page: () => StudentProfile(),
   transition: Transition.noTransition,
   ),

  GetPage(name: '/chatScreen',
   page: () => ChatPage(),
   transition: Transition.noTransition,
   ),

];