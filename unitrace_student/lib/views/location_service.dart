import 'dart:convert';
import 'dart:convert' as convert;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
class LocationService{
  String key = MAP_API_KEY;

  Future<String> GetPlaceId(String value) async{
    String url ="https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$value&inputtype=textquery&key=$key";
    var response = await http.get(Uri.parse(url));
    var result =  convert.jsonDecode(response.body);
    var placeId = result['candidates'][0]['place_id'] as String;
    print(placeId);
    return placeId;
  }

  Future<Map<String,dynamic>> GetPlaces(String value)async {
    String placeId = await GetPlaceId(value);
    String url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await http.get(Uri.parse(url));
    var json =  convert.jsonDecode(response.body);

    var result = json['result'] as Map<String,dynamic>;

    return result;
  }

  // Future<Map<String,dynamic>> getRoute()async{
  //   LatLng origin =LatLng(12.873791605499298, 80.2263099299348);
  //   LatLng desiny = LatLng(12.944148477216835, 80.24029080159562);
  //   String url = 
  //   return {"":""};

  // }

  // Future<Map<String,dynamic>> getRoute(LatLng origin,LatLng destination)async{
  //   String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=${MAP_API_KEY}}";
  //   var response = await http.get(Uri.parse(url));
  //   var json =  convert.jsonDecode(response.body);
  //   var result = json['routes'][0]['legs'][0] as Map<String,dynamic>;
  //   return result;
  // }

}
