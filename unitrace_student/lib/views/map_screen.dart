import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unitrace_student/controllers/slider_controller.dart';

import 'package:unitrace_student/models/studentModel.dart';
import 'package:unitrace_student/utils/constants.dart';
import 'package:unitrace_student/utils/utils.dart';

import '../controllers/details_controller.dart';
import '../widgets/map/floating_dock_info.dart';
import '../widgets/map/map_menu_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  DetailController _detailController = Get.put(DetailController());
  SliderController _sliderController = Get.put(SliderController());
  late GoogleMapController mapController;


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() =>GoogleMap(
          initialCameraPosition: CameraPosition(
          target: _detailController.center.value,
          zoom: 11,
          ),
          onMapCreated: (controller) {
            _detailController.setMapController(controller);
            // _userMapController.getDirection();
          },


          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          polylines: {
            Polyline(
              polylineId: PolylineId('route1'),
              color: Colors.red.shade300,
              width: 4,
              points: _detailController.polylineCoordinates,
            ),
            if (_detailController.reached.value == false)
              Polyline(
                polylineId: PolylineId('route2'),
                color: Colors.blue.shade300,
                width: 5,
                points: _detailController.studentDriverPolylineCoordinates,
              ),
          },

          markers:{
            Marker(
              markerId: MarkerId('driver'),
              position: _detailController.driverLocation.value,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              infoWindow: InfoWindow(
                title: 'Driver',
                snippet: 'Driver is here',
              ),
            ),
            
            Marker(
            markerId: MarkerId(_detailController.student.length > 0 ? _detailController.student[0].name : 'student'),
            position: _detailController.student.length > 0 ? LatLng(_detailController.student[0].latitude, _detailController.student[0].longitude) : LatLng(0, 0),
            icon: _detailController.studentIcon.value,
            infoWindow: InfoWindow(
              title: _detailController.student.length > 0 ? _detailController.student[0].name : 'Student',
              snippet: _detailController.student.length > 0 ? _detailController.student[0].email : '',
            ),
          ),

            ..._detailController.fixedMarkers,
          }
          
         ),
         ),
          Obx(
            () => Positioned(
              right: 20,
              top: 50,
                child: SizedBox(
                  height: Get.height * 0.06,
                  child: FloatingActionButton(onPressed: (){
                    _sliderController.togglePresent();
                  },
                  heroTag: "present",
                  backgroundColor: Color.fromARGB(255, 249, 247, 247),
                   child: _detailController.student.isNotEmpty && _detailController.isPresent.value? 
                   Text(
                  '\u{1F64B}', // Unicode value for the grinning face emoji
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  ) : Text(
                  '\u{1F645}', // Unicode value for not coming face emoji
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  ),
                  ),
                ),
              ),
          ),

          Obx(
            () => Positioned(
              right: 20,
              top: 110,
                child: SizedBox(
                  height: Get.height * 0.06,
                  child: FloatingActionButton(onPressed: (){
                      if(_detailController.streamStatus.value == false){
                        _detailController.startStream(_detailController.latLngList);
                        Utils().ShowToastMessage("Streaming Started");
                        _detailController.streamStatus.value = true;
                        
                      }else{
                        _detailController.stopStream();
                        Utils().ShowToastMessage("Streaming Stopped");
                        _detailController.streamStatus.value = false;

                      }
                    
                  },
                  heroTag: "stream",
                  backgroundColor: Color.fromARGB(255, 249, 247, 247),
                   child: _detailController.streamStatus.value? 
                   Icon(CupertinoIcons.location_fill, color: Colors.blue,) :
                   Icon(CupertinoIcons.location_fill,color: Colors.grey,),
                  ),
                  ),
                ),
              ),

        
          MapMenuBar(),

          FloatingDockInfo(),
        ],
      ),
    );
  }
}

