import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'details_controller.dart';

class UserMapController extends GetxController {
  DetailController _detailController = Get.find<DetailController>();
  late GoogleMapController mapController;

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  Rx<LatLng> center = LatLng(12.801370707395389, 80.2242027191328).obs;
  List<LatLng> polylineCoordinates = [];
  List<Marker> markers = [];
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _detailController.fetchDriver();
    ever(_detailController.students, (_) {
      if (_detailController.students.isNotEmpty) {
        getDirection();
      }});
  }

  void getDirection(){
    String url = "";
  }



}
