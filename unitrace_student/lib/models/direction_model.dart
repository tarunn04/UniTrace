import 'package:flutter_polyline_points/src/utils/request_enums.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final String distance;
  final String duration;
  final List<LatLng> polyline;

  Directions({
    required this.distance,
    required this.duration,
    required this.polyline, required TravelMode mode, required String apiKey,
  });
}
