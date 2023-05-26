import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/details_controller.dart';
import '../controllers/login_controller.dart';
import '../utils/constants.dart';
import '../utils/text_themes.dart';
import '../widgets/map/maputils/myprofile_details.dart';
import '../widgets/map/maputils/user_menu_tile.dart';

class UserUtilMapScreen extends StatefulWidget {
  const UserUtilMapScreen({super.key});

  @override
  State<UserUtilMapScreen> createState() => _UserUtilMapScreenState();
}

class _UserUtilMapScreenState extends State<UserUtilMapScreen> {
  final AppAuthController _appAuthController = Get.put(AppAuthController());
  DetailController _detailController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
          color: Colors.black,
        ),
        backgroundColor: redBg,
        // backgroundColor: Colors.white,
        elevation: 0,
        
        title: Text('My Profile',style: MyTextTheme.notosans.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // color: Colors.white,
        ),),
      ),
      
      body: Container(
        height: Get.height,
        width: Get.width,

        child: Column(
          children: [
            MyProfileDetails(
              name: _detailController.driver[0].name,
              email: _detailController.driver[0].email,
              
            ),
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text("User Menu",
                    style: MyTextTheme.notosans.copyWith(
                      fontSize: 16,
                      color: Color.fromARGB(163, 78, 77, 77),
                      fontWeight: FontWeight.w400,
                    ),),

                    SizedBox(height: Get.height *0.01,),
                    
                    UserMenuTile(
                      userText: "Profile",
                      userIcon: Icons.person,
                      onPressed: () => Get.toNamed('/driverProfile'),
                    ),

                    UserMenuTile(
                      userText: "Student list",
                      userIcon: CupertinoIcons.person_2_alt,
                      onPressed: (){
                        Get.toNamed('/studentList');
                      },

                    ),

                    UserMenuTile(
                      userText: "Discussion",
                      userIcon: Icons.chat_rounded,
                      onPressed: (){
                        Get.toNamed('/chatScreen');
                      },

                    ),
                    UserMenuTile(
                      userText: "About App",
                      userIcon: Icons.info_outline,
                      onPressed: () => Get.toNamed('/appAbout'),

                    ),
                    UserMenuTile(
                      userText: "ERP",
                      userIcon: CupertinoIcons.square_list_fill,
                      onPressed: (){
                       
                      },
                    ),
                    UserMenuTile(
                      userText: "Logout",
                      userIcon: Icons.logout,
                      onPressed: () {
                         _appAuthController.logout();
                      }
                    ),

                    SizedBox(height: Get.height*0.04,),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

