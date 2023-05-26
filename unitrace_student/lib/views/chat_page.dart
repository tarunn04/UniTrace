import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unitrace_student/controllers/details_controller.dart';
import 'package:intl/intl.dart';

import '../utils/constants.dart';
import '../utils/text_themes.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  DetailController _detailController = Get.find<DetailController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat',style: MyTextTheme.notosans.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
        backgroundColor: redBg,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('messages')
                .orderBy('timestamp',descending: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                
                // Keep track of the last date to display it once for the entire chat of that day
                DateTime? lastDate;

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                    String message = data['message'] ?? '';
                    String name = data['userName'] ?? '';
                    String sender = data['senderEmail'] ?? '';
                    String role = data['role'] ?? '';
                    DateTime timestamp = (data['timestamp'] as Timestamp).toDate();

                    bool isMe = sender == _detailController.student.first.email; // Change this to check against the current user's ID
                    
                    // Check if the date has changed since the last message and display it once
                    bool isNewDate = lastDate == null || timestamp.day != lastDate!.day;
                    String dateText = isNewDate ? DateFormat('dd MMM yyyy').format(timestamp) : '';

                    lastDate = timestamp;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          
                          if (isNewDate) ...[
                            SizedBox(height: 8.0),
                            Center(
                              child: Text(
                                dateText,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.notoSans().fontFamily,
                                  color: Colors.grey[500],
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,)
                          ],

                          Row(
                            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [

                              if (!isMe) ...[
                                CircleAvatar(
                                  backgroundImage: NetworkImage('https://i.pravatar.cc/40'),
                                ),
                                SizedBox(width: 8.0),
                              ],

                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: role == 'driver' ? Color.fromARGB(255, 210, 217, 244) :
                                    isMe ? redBg: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          color: isMe ? Colors.white70 : Colors.black54,
                                          fontFamily: GoogleFonts.notoSans().fontFamily,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        message,
                                        style: TextStyle(
                                          color: isMe ? Colors.white : Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        '${DateFormat('h:mm a').format(timestamp)}',
                                        style: TextStyle(
                                          color: isMe ? Colors.white70 : Colors.black54,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),




          Container(
            width: Get.width,
            height: Get.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20,),
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        Icon(Icons.attach_file,color: Colors.grey.shade500,),
                        SizedBox(width: 10,),

                        Icon(Icons.camera_alt_outlined,color: Colors.grey.shade500,),
                        SizedBox(width: 10,),
                        
                      ],
                    ),
                  ),

                  Container(
                    height: Get.height * 0.045,
                    width: Get.width * 0.1,
                    decoration: BoxDecoration(
                      color: redBg,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: (){
                        if (_messageController.text.isEmpty) {
                          return;
                        }
                        FirebaseFirestore.instance.collection('messages').add({
                          'message': _messageController.text,
                          'timestamp': DateTime.now(),
                          'userName': _detailController.student.first.name,
                          'senderEmail':_detailController.student.first.email,
                          'role':_detailController.student.first.role,
                        });
                        _messageController.clear();
                      },
                      icon: Icon(Icons.send,size: 20,color: Colors.white,),
                    ),
                  ),
                ],
              ),
          )
        ],
      ),
    );
  }
}
