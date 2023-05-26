import 'dart:async';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:unitrace_student/controllers/google_map_direction.dart';
import 'package:unitrace_student/controllers/slider_controller.dart';
import 'package:unitrace_student/utils/constants.dart';
import 'package:unitrace_student/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';
import '../models/driver_model.dart';
import '../models/studentModel.dart';
import 'dart:typed_data';

class DetailController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<DocumentSnapshot> subscription;
  final RxList<Student> student = RxList();
  final RxList<Driver> driver = RxList();
  final RxList<Student> sameBusStudents = RxList();
  final RxBool streamStatus = true.obs;
  StreamSubscription<List<DocumentSnapshot<Map<String, dynamic>>>>? _streamSubscription;
  late List<LatLng> latLngList;

   RxBool isPresent = true.obs;
  Rx<BitmapDescriptor> studentIcon = Rx<BitmapDescriptor>(BitmapDescriptor.defaultMarker);
  // stream group
  final group = StreamGroup<dynamic>();

  // for dynamic change of driverLocation
  Rx<LatLng> driverLocation = Rx<LatLng>(LatLng(12.801370707395389, 80.2242027191328));
  List<LatLng> studentDriverPolylineCoordinates = [];


  //map controller
  late GoogleMapController mapController;
  void setMapController(GoogleMapController controller) {
      mapController = controller;
  }
  Rx<LatLng> center = LatLng(12.801370707395389, 80.2242027191328).obs;
  
  RxString busSpeed = '0'.obs;
  //markers
  final RxList<Marker> fixedMarkers = RxList();
  List<LatLng> polylineCoordinates = [];


  // Ride details
  RxDouble distance = 0.0.obs;
  RxDouble timeInMin = 0.0.obs;
  RxBool rideStarted = false.obs;
  RxString lastSharedTime = ''.obs;
  RxBool reached = false.obs;

  //alert settings
  SliderController _sliderController = Get.put(SliderController());
  late RxDouble distanceAlert = 0.0.obs ;
  late RxInt timeAlert = 0.obs;
  RxBool alert = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }
  
  Future<void> fetchStudents() async{

    if(_auth.currentUser == null){
          return;
          
        }else{
          try {
        
        //get student details
        final QuerySnapshot<Map<String,dynamic>> querySnapshot = 
        await _firestore.collection('student')
        .where('email', isEqualTo: _auth.currentUser!.email).get();

        student.value = querySnapshot.docs
        .map((QueryDocumentSnapshot<Map<String,dynamic>> documentSnapshot) => 
        Student.fromJson(documentSnapshot.data())).toList();

        reached.value = student.first.isReached;
        isPresent.value = student.first.isPresent;
        //student bus
        final String studentBus = student.first.bus;


        //getting bus driver details
        final QuerySnapshot<Map<String,dynamic>> driverSnapshot= 
        await _firestore.collection('driver')
        .where('bus', isEqualTo: studentBus).get();

        driver.value = driverSnapshot.docs
        .map((QueryDocumentSnapshot<Map<String,dynamic>> documentSnapshot) 
        => Driver.fromJson(documentSnapshot.data())).toList();


        //geting latlng of all students in the bus
        final studentCollection = FirebaseFirestore.instance.collection('student');
        final latlngSnapshot = await studentCollection.where('bus', isEqualTo: studentBus).get();
        

        //list of all students
        sameBusStudents.value = latlngSnapshot.docs
        .map((doc) => Student.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

        //list of latlng of all students of bus
        latLngList = sameBusStudents
            .map((student) => LatLng(student.latitude, student.longitude))
            .toList();
        final docRef = _firestore.collection('driverLocation').doc(driver[0].email);
        final docSnapshot = await docRef.get();
        final data = docSnapshot.data()!;
        final lastSharedTimestamp = (data['lastShared'] as Timestamp).toDate().millisecondsSinceEpoch;


        final now = DateTime.now();
        final timestampDate = DateTime.fromMillisecondsSinceEpoch(lastSharedTimestamp);


        if (timestampDate.isBefore(DateTime(now.year, now.month, now.day))) {
          reached.value = false;
          _firestore.collection('student').doc(student.first.email).update({
              'isReached': false,     
            },);
        }

        //live broadcast driver
        startStream(latLngList);
 
        setmarker();

      } on Exception catch (e) {
        Utils().ShowToastMessage(e.toString());
      }
  }
  }

  void startStream(List<LatLng> latLngList) {
    
    //live broadcast driver
    final driverLocationStream = _firestore.collection('driverLocation').doc(driver[0].email).snapshots();
    
    //live broadcast student
    final studentStream = _firestore.collection('student').doc(student[0].email).snapshots();
    
    final studentCollectionSubscription = studentStream.listen((event) async{
    final studentData = event.data()!;
    final isPresent = studentData['isPresent'];
    final isReached = studentData['isReached'];
    
    },);
    
    final stream = rx.CombineLatestStream.list([driverLocationStream, studentStream]);
    final broadcastStream = stream.asBroadcastStream();
    
    _streamSubscription = broadcastStream.listen((data) async {
      final locationData = data[0].data()!;
      final studentData = data[1].data()!;
    
      final lat = locationData['latitude'];
      final lng = locationData['longitude'];
      final speed = locationData['speed'];
      final timestamp = locationData['lastShared'];
      final isRideStarted = locationData['isRideStarted'];          
    
      final isPresent = studentData['isPresent'];
      final isReached = studentData['isReached'];

      busSpeed.value = speed.toString();
      if(isPresent == false){
        studentIcon.value = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      }else{
        studentIcon.value = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      }
    
    if(isRideStarted == false){
      rideStarted.value = false;
      lastSharedTime.value =  DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now());
    }else{
      rideStarted.value = true;
    }
    
    if(isReached == false){
      getPolylineStudentDriver(driverLocation.value.latitude, driverLocation.value.longitude, 
      student.first.latitude, student.first.longitude);
      reached.value = false;
    
    }
    
    var distanceInMeter = await Geolocator.distanceBetween
    (driverLocation.value.latitude, driverLocation.value.longitude,
    student.first.latitude, student.first.longitude);
    
    if(distanceInMeter <= 150){
      reached.value = true;
      studentDriverPolylineCoordinates.clear();
      _firestore.collection('student').doc(student.first.email).update({
        'isReached': true,     
      },);
    
    }
    
    distance.value = distanceInMeter/1000;
    timeInMin.value = (distanceInMeter/speed/60);
    
    if (alert.isTrue && (distance.value <= distanceAlert.value || timeInMin.value <= timeAlert.value)) {
      _sliderController.playRingtone();
    }
    
    
    polylineCoordinates = await GoogleMapsDirections.getDirections(
      LatLng(12.800992375605247, 80.22411998608543), 
      LatLng(12.800992375605247, 80.22411998608543), 
      latLngList);
    
    driverLocation.value = LatLng(lat, lng);
          
    });
  }

  void stopStream() {
    _streamSubscription?.cancel();
  }

  setmarker()  {
    fixedMarkers.clear();
    fixedMarkers.add(
      Marker(
      markerId: MarkerId("HITS"),
      position: LatLng(12.800992375605247, 80.22411998608543),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
   )
    );
    for (var i = 0; i < sameBusStudents.length; i++) {
      if(sameBusStudents[i].email != student.first.email){
        fixedMarkers.add(
        Marker(
        markerId: MarkerId(sameBusStudents[i].name),
        position: LatLng(sameBusStudents[i].latitude, sameBusStudents[i].longitude),
        infoWindow: InfoWindow(
          title: sameBusStudents[i].name,
          snippet: sameBusStudents[i].email,
        ),
        icon:  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),    
      ));
      }
    }
  }
  
  void getPolylineStudentDriver(double driverLat,double driverlng,double studentLat,double studentLng, ) async{
    PolylinePoints _polylinePoints = PolylinePoints();
    studentDriverPolylineCoordinates.clear();

    print("changing polyline");
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      MAP_API_KEY,
      PointLatLng(driverLat, driverlng),
      PointLatLng(studentLat, studentLng),
      travelMode: TravelMode.driving
    );

    if (result.points.isNotEmpty){
      result.points.forEach((PointLatLng point){
        studentDriverPolylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
  }
  
  Uri url = Uri.parse(
      'https://studentportal.hindustanuniv.ac.in/home.htm;jsessionid=CFF0C02CAB8483F59677940E4BD488D0');


  Future<void> launchInBrowser() async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  launchPhoneURL(String DriverNo) async {
  String url = 'tel:' + DriverNo;
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

updateAttendencePresent(){
    _firestore.collection('student').doc(student.first.email).update({
      'isPresent': true,     
    },);
    Utils().ShowToastMessage("Attendence updated to Present");
    isPresent.value = true;
}
updateAttendenceAbsent(){
    _firestore.collection('student').doc(student.first.email).update({
      'isPresent': false,     
    },);
        Utils().ShowToastMessage("Attendence updated to Absent");
        isPresent.value = false;

}

}