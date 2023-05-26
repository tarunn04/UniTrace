class Driver {
  final String name;
  final String email;
  final String mobileNo;
  final String empId;
  final String dob;
  final String address;
  final String bloodType;
  final String bus;
  final String medicalCondition;
  final String role;


  Driver({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.empId,
    required this.dob,
    required this.address,
    required this.bloodType,
    required this.bus, 
    required this.medicalCondition,
    required this.role,

  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      medicalCondition: json['medicalCondition'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobileNo: json['mobileNo'] ?? '',
      empId: json['empId'] ?? '',
      dob: json['dob'] ?? '',
      address: json['address'] ?? '',
      bloodType: json['bloodType'] ?? '',
      bus: json['bus'] ?? '', role: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medicalCondition': medicalCondition,
      'name': name,
      'email': email,
      'mobileNo': mobileNo,
      'empId': empId,
      'dob': dob,
      'address': address,
      'bloodType': bloodType,
      'bus': bus,
      'role': role,
    };
  }
}

