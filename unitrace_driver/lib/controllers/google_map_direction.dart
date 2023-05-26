import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:unitrace_driver/utils/constants.dart';

class GoogleMapsDirections {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';
  static const String _apiKey = MAP_API_KEY;

  static Future<List<LatLng>> getDirections(LatLng origin, LatLng destination, List<LatLng> waypoints) async {
    String url = '$_baseUrl?'
        'origin=${origin.latitude},${origin.longitude}&'
        'destination=${destination.latitude},${destination.longitude}&'
        'waypoints=optimize:true|${_waypointsToString(waypoints)}&'
        'key=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'OK') {
        List<LatLng> polylineCoordinates = _decodePolyline(data['routes'][0]['overview_polyline']['points']);
        return polylineCoordinates;
      } else {
        throw Exception(data['error_message']);
      }
    } else {
      throw Exception('Failed to fetch directions');
    }
  }

  static String _waypointsToString(List<LatLng> waypoints) {
    String waypointsString = '';

    for (LatLng waypoint in waypoints) {
      waypointsString += '${waypoint.latitude},${waypoint.longitude}|';
    }

    return waypointsString;
  }

  static List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylineCoordinates = [];
    for (final latlng in decodeEncodedPolyline(encoded)) {
      polylineCoordinates.add(LatLng(latlng[0], latlng[1]));
    }

    return polylineCoordinates;
  }

  static List<List<double>> decodeEncodedPolyline(String encoded) {
    List<List<double>> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      poly.add([lat / 1E5, lng / 1E5]);
    }

    return poly;
  }
}
