import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String address;
  String bloodType;
  String branch;
  String bus;
  String dob;
  String duration;
  String email;
  double latitude;
  double longitude;
  String mobileNo;
  String name;
  String residenceNo;
  String role;
  String rollNo;
  bool isPresent;
  bool isReached;

  Student({
    required this.address,
    required this.bloodType,
    required this.branch,
    required this.bus,
    required this.dob,
    required this.duration,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.mobileNo,
    required this.name,
    required this.residenceNo,
    required this.role,
    required this.rollNo,
    required this.isPresent,
    required this.isReached,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
  GeoPoint latLng = json['latlng'];
  double latitude = latLng.latitude;
  double longitude = latLng.longitude;
  return Student(
    address: json['address'] ?? '',
    bloodType: json['bloodType'] ?? '',
    branch: json['branch'] ?? '',
    bus: json['bus'] ?? '',
    dob: json['dob'] ?? '',
    duration: json['duration'] ?? '',
    email: json['email'] ?? '',
    latitude: latitude,
    longitude: longitude,
    mobileNo: json['mobileNo'] ?? '',
    name: json['name'] ?? '',
    residenceNo: json['residenceNo'] ?? '',
    role: json['role'] ?? '',
    rollNo: json['rollNo'] ?? '',
    isPresent: json['isPresent'] ?? false, 
    isReached: json['isReached'] ?? false,
  );
}

  Map<String, dynamic> toJson() {
  GeoPoint latLng = GeoPoint(latitude, longitude);
  return {
    'address': address,
    'bloodType': bloodType,
    'branch': branch,
    'bus': bus,
    'dob': dob,
    'duration': duration,
    'email': email,
    'latlng': latLng,
    'mobileNo': mobileNo,
    'name': name,
    'residenceNo': residenceNo,
    'role': role,
    'rollNo': rollNo,
    'isPresent': isPresent,
    'isReached': isReached,
  };
}


}
