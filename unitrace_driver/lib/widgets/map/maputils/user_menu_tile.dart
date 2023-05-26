// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/text_themes.dart';

class UserMenuTile extends StatefulWidget {
  String userText;
  IconData userIcon;
  Function onPressed;
  UserMenuTile({
    Key? key,
    required this.userText,
    required this.userIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<UserMenuTile> createState() => _UserMenuTileState();
}

class _UserMenuTileState extends State<UserMenuTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
        height: Get.height * 0.068,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color.fromARGB(255, 232, 229, 229),
                  child: Icon(widget.userIcon,
                  color: Color.fromRGBO(79, 78, 78, 0.852),
                  size: 22,
                  ),
                ),
    
                SizedBox(width: Get.width*0.05,),
    
                Text(widget.userText,
                style: MyTextTheme.notosans.copyWith(
                  fontSize: 20,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
                ),
              ],
            ),
            
            Icon(Icons.arrow_forward_ios,size: 20,),
          ],
        ),
      ),
    );
  }
}
