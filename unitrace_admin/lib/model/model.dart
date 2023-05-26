class StudentModel {
  final String bus;
  final String name;
  final String email;
  final String phone;
  final String rollNo;
  final String dob;
  final String branch_dept;
  final String duration;
  final String address;
  final String bloodtype;
  final String residence_no;
  final String latitude;
  final String longitude;

  StudentModel(
      {required this.bus,
      required this.name,
      required this.email,
      required this.phone,
      required this.rollNo,
      required this.dob,
      required this.branch_dept,
      required this.duration,
      required this.address,
      required this.bloodtype,
      required this.residence_no,
      required this.latitude,
      required this.longitude});
      
      toJson() => {
        'bus': bus,
        'name': name,
        'email': email,
        'phone': phone,
        'rollNo': rollNo,
        'dob': dob,
        'branch_dept': branch_dept,
        'duration': duration,
        'address': address,
        'bloodtype': bloodtype,
        'residence_no': residence_no,
        'latitude': latitude,
        'longitude': longitude,
      };
}


