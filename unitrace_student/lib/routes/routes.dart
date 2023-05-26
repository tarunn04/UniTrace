import 'package:get/get.dart';
import 'package:unitrace_student/views/about.dart';
import 'package:unitrace_student/views/chat_page.dart';
import 'package:unitrace_student/views/driver_profile.dart';
import 'package:unitrace_student/views/forgot_password_screen.dart';
import 'package:unitrace_student/views/login_screen.dart';
import 'package:unitrace_student/views/map_screen.dart';
import 'package:unitrace_student/views/splash_screen.dart';
import 'package:unitrace_student/views/student_profile.dart';
import 'package:unitrace_student/views/user_menu.dart';
import '../views/custom_alert_page.dart';


appRoutes() => [
  
  GetPage(name: '/', 
  page:() => SplashScreen(),
  transition: Transition.leftToRightWithFade,
  transitionDuration: Duration(milliseconds: 300),
  ),

  GetPage(name: '/login', 
  page:() => LoginScreen(),
  ),

  GetPage(name: '/forgotPassword', 
  page:() => ForgotPasswordScreen(),
  ),

  GetPage(name: '/mapScreen',
   page: () => MapScreen(),
   transition: Transition.noTransition,
   ),

   GetPage(name: '/driverProfile',
   page: () => DriverProfile(),
   transition: Transition.fade,
   transitionDuration: Duration(milliseconds: 100),
   ),

   GetPage(name: '/userMenu',
   page: () => UserUtilMapScreen(),
   ),

   GetPage(name: '/mapScreen',
   page: () => MapScreen(),
   transition: Transition.noTransition,
   ),

   GetPage(name: "/appAbout",
    page: () => About(),
   transition: Transition.noTransition,
   ),

    GetPage(name: '/studentProfile',
   page: () => StudentProfile(),
   transition: Transition.noTransition,
   ),

     GetPage(name: '/driverProfile',
   page: () => DriverProfile(),
   transition: Transition.noTransition,
   ),

  //   GetPage(name: '/chatScreen',
  //  page: () => chatScreen(),
  //  transition: Transition.noTransition,
  //  ),

  //   GetPage(name: '/chatScreen',
  //  page: () => ChatScreen(),
  //  transition: Transition.noTransition,
  //  ),
    GetPage(name: '/chatScreen',
   page: () => ChatPage(),
   transition: Transition.noTransition,
   ),

    GetPage(name: '/customAlert',
   page: () => CustomAlertPage(),
   transition: Transition.noTransition,
   ),



];