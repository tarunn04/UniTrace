// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:unitrace_driver/controllers/details_controller.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   DetailController _detailController = Get.put(DetailController());
//   late Position position;
//   late GoogleMapController googleMapController;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


//    getCurrentPosition()async{
//     position = await Geolocator.getCurrentPosition(desiredAccuracy:
//     LocationAccuracy.high);
//    }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCurrentPosition();
//   }
//   StreamSubscription<Position>? _positionStreamSubscription;

   

//   void _startlistning()async{
//     _positionStreamSubscription = Geolocator.getPositionStream(
//       locationSettings: LocationSettings(
//         accuracy: LocationAccuracy.high,
//         distanceFilter: 10,
//         timeLimit: Duration(seconds: 5)
//       )
//     ).listen((Position position) {
//     print("latlng ${position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString()}");
//     print("speed ${position == null ? 'Unknown' : position.speed.toString()}");
//     firestore.collection('locations').doc(_firebaseAuth.currentUser!.email).set({
//       'latitude': position.latitude,
//       'longitude': position.longitude,
//       'speed':position.speed.round(),
//     });
//   });
//   }
  


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Obx(() =>GoogleMap(
//           initialCameraPosition: CameraPosition(
//           target: _detailController.center.value,
//           zoom: 11,
//           ),
//           onMapCreated:(controller) {
//             googleMapController = controller;
//             getCurrentPosition();
//           },
//           myLocationEnabled: true,
//           myLocationButtonEnabled: true,
//           markers: _detailController.markers.value,
//          ),
//          ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         _startlistning();
//       },)
//     );
//   }
// }