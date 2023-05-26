// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileList {
  final List<String> busList = [
    'kaveri',
    'ganga',
    'yamuna',
  ];

  final List<String> bloodGroup = [
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'B-',
    'O-',
    'AB-'
  ];
}

class DriverCollege {
  String name;
  String email;
  String empId;
  String bloodType;
  String bus;
  String mobileNo;
  String address;
  String dob;

  DriverCollege({
    required this.name,
    required this.email,
    required this.empId,
    required this.bloodType,
    required this.bus,
    required this.mobileNo,
    required this.address,
    required this.dob,
  });

  factory DriverCollege.fromJson(Map<String, dynamic> json) {
    return DriverCollege(
      name: json['name'],
      address: json['address'],
      bloodType: json['bloodType'],
      bus: json['bus'],
      dob: json['dob'],
      email: json['email'],
      empId: json['empId'],
      mobileNo: json['mobileNo'],
    );
  }
}

class Student {
  String name;
  String email;
  String rollNo;
  String bloodType;
  String bus;
  String mobileNo;
  String address;
  String dob;
  String latlng;
  String branch;
  String duration;
  String residenceNo;

  Student({
    required this.name,
    required this.email,
    required this.rollNo,
    required this.bloodType,
    required this.bus,
    required this.mobileNo,
    required this.address,
    required this.dob,
    required this.latlng,
    required this.branch,
    required this.duration,
    required this.residenceNo,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      address: json['address'],
      bloodType: json['bloodType'],
      bus: json['bus'],
      dob: json['dob'],
      email: json['email'],
      rollNo: json['rollNo'],
      mobileNo: json['mobileNo'],
      latlng: json['latlng'],
      branch: json['branch'],
      duration: json['duration'],
      residenceNo: json['residenceNo'],
    );
  }
}
