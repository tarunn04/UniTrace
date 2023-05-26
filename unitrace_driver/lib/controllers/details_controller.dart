import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unitrace_driver/controllers/google_map_direction.dart';
import 'package:unitrace_driver/utils/utils.dart';

import '../models/driver_model.dart';
import '../models/studentModel.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http; 


class DetailController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxList<Student> students = RxList();
  final RxList<Driver> driver = RxList();
  final RxList<LatLng> latlngList = RxList();

  //map stuff
  final RxSet<Marker> markers = RxSet();
  List<LatLng> polylineCoordinates = [];
  Color polylineRed = Colors.red.shade300;
  Color polylineGreen = Colors.green.shade300;
  late GoogleMapController mapController;

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  Rx<LatLng> center = LatLng(12.801370707395389, 80.2242027191328).obs;

  //Ride Status
  late RxBool isRideStarted ;
  StreamSubscription? _rideStreamSubscription;
  Position? position;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isRideStarted = true.obs;
    fetchDriver();
  }

  @override
  void onClose() {
    _rideStreamSubscription?.cancel();
    super.onClose();
  }


  Future<void> fetchDriver() async{
    if(_auth.currentUser == null){
          // Utils().ShowToastMessage('No user found');
          return;
          
        }else{
          try {
        
        //get driver details
        final QuerySnapshot<Map<String,dynamic>> querySnapshot = 
        await _firestore.collection('driver')
        .where('email', isEqualTo: _auth.currentUser!.email).get();
        
        driver.value = querySnapshot.docs
        .map((QueryDocumentSnapshot<Map<String,dynamic>> documentSnapshot) => 
        Driver.fromJson(documentSnapshot.data())).toList();


        //student bus
        final String studentBus = driver.first.bus;

        //getting student driver details
        final QuerySnapshot<Map<String,dynamic>> driverSnapshot= 
        await _firestore.collection('student')
        .where('bus', isEqualTo: studentBus).get();

        students.value = driverSnapshot.docs
        .map((QueryDocumentSnapshot<Map<String,dynamic>> documentSnapshot) 
        => Student.fromJson(documentSnapshot.data())).toList();

        // //list of latlng of all students of bus
        latlngList.value = students
            .map((student) => LatLng(student.latitude, student.longitude))
            .toList();

          polylineCoordinates = await GoogleMapsDirections.getDirections(
          LatLng(12.801370707395389, 80.2242027191328), 
          LatLng(12.801370707395389, 80.2242027191328), 
          latlngList.value,
          );
          StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? studentStream;

              final studentRef = FirebaseFirestore.instance
              .collection('student')
              .where('bus', isEqualTo: driver.first.bus);

              studentStream = studentRef.snapshots().listen((snapshot) {
                final List<Student> updatedStudents = [];

                for (final doc in snapshot.docs) {
                  final student = Student.fromJson(doc.data());
                  updatedStudents.add(student);
                }

                // update students list and markers
                students.value = updatedStudents;
                setmarker();
              });
            
            
          // setmarker();

      } on Exception catch (e) {
        Utils().ShowToastMessage(e.toString());
        print(e);
      }
  }
  }

  setmarker(){
    markers.add(
      Marker(markerId: MarkerId(driver.first.name),
      position: LatLng(12.801370707395389, 80.2242027191328),
      infoWindow: InfoWindow(
        title: driver.first.name,
        snippet: driver.first.email,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    for (var i = 0; i < students.length; i++) {
      print("${students[i].latitude}, ${students[i].longitude}");
      markers.add(Marker(
        markerId: MarkerId(students[i].email),
        position: LatLng(students[i].latitude, students[i].longitude),
        infoWindow: InfoWindow(
          title: students[i].name,
          snippet: students[i].email,
        ),
        icon: students[i].isPresent ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed):BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    }
  }

  Future<void> startRide() async {
    _rideStreamSubscription = await Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 0,
        timeLimit: Duration(seconds: 10),
      ),
    ).listen((Position position) {
      _firestore.collection('driverLocation').doc(_auth.currentUser!.email).update({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'speed':position.speed.round(),
        'lastShared':position.timestamp,
        'isRideStarted': true,
 
      }); 
    });
  }

  void stopRide(){
    _firestore.collection('driverLocation').doc(_auth.currentUser!.email).update({
        'isRideStarted': false,   
      },
      );
     if (_rideStreamSubscription != null) {
    _rideStreamSubscription!.cancel();
    _rideStreamSubscription = null;
  }
  }

  

}