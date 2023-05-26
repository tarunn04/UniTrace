import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unitrace_driver/utils/constants.dart';

import '../controllers/details_controller.dart';
import '../controllers/user_map_controller.dart';
import '../widgets/map/floating_dock_info.dart';
import '../widgets/map/map_menu_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
   late GoogleMapController mapController;

  DetailController _detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() =>GoogleMap(
          initialCameraPosition: CameraPosition(
          target: _detailController.center.value,
          zoom: 12,
          ),
          onMapCreated: _detailController.setMapController,
          markers: _detailController.markers.value,
           myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: true,
        
            polylines: {
            Polyline(
              polylineId: PolylineId('polyline'),

              color: _detailController.isRideStarted.value
                  ? _detailController.polylineRed
                  : _detailController.polylineGreen,
              width: 5,
              points: _detailController.polylineCoordinates,
            ), 
          }
         ),
         ),

         
          Positioned(
              bottom: 120,
              right: 20,
            child: SizedBox(
              height: Get.height * 0.06,
              child: FloatingActionButton(
                onPressed: (){
                  Get.toNamed('/chatScreen');
                },

                backgroundColor: Color.fromARGB(255, 249, 247, 247),

                heroTag: "chat",
                child: Icon(CupertinoIcons.chat_bubble_text_fill,color: redBg,),
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

