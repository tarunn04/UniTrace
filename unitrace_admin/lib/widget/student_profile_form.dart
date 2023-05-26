import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unitrace_admin/utils/utils.dart';
import 'package:unitrace_admin/widget/round_button.dart';

import '../utils/profile_list.dart';
import 'custom_profile_text.dart';

class StudentProfileForm extends StatefulWidget {
  const StudentProfileForm({super.key});

  @override
  State<StudentProfileForm> createState() => _StudentProfileFormState();
}

class _StudentProfileFormState extends State<StudentProfileForm> {
  final TextEditingController profileemailController = TextEditingController();
  final TextEditingController profilepassController = TextEditingController();
  final TextEditingController profilerepassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController residenceNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latlngController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool loading = false;
// added

  String? _selectedBloodType;
  String? _selectedBus;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedBus,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Select Bus',
                ),
                items: ProfileList().busList.map((bus) {
                  return DropdownMenuItem<String>(
                    value: bus,
                    child: Text(bus),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBus = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a bus';
                  }
                  return null; // return null if value is valid
                },
              ),
              CustomTextField(
                labelText: 'Email',
                controller: profileemailController,
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Default password is student123",
                  border: InputBorder.none,
                  enabled: false,
                ),
              ),
              CustomTextField(
                labelText: 'Name',
                controller: nameController,
              ),
              CustomTextField(
                labelText: 'Roll No.',
                controller: rollNoController,
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                labelText: 'Date of Birth (dd/mm/yyyy)',
                controller: dobController,
                keyboardType: TextInputType.datetime,
              ),
              CustomTextField(
                labelText: 'Branch - Department',
                controller: branchController,
              ),
              CustomTextField(
                labelText: 'Duration',
                controller: durationController,
              ),
              DropdownButtonFormField<String>(
                value: _selectedBloodType,
                decoration: InputDecoration(
                    labelText: 'Blood Type', border: InputBorder.none),
                items: ProfileList().bloodGroup.map((bloodType) {
                  return DropdownMenuItem<String>(
                    value: bloodType,
                    child: Text(bloodType),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBloodType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the blood group';
                  }
                  return null; // return null if value is valid
                },
              ),
              CustomTextField(
                labelText: 'Mobile No.',
                controller: mobileNoController,
                keyboardType: TextInputType.phone,
              ),
              CustomTextField(
                labelText: 'Residence No.',
                controller: residenceNoController,
                keyboardType: TextInputType.phone,
              ),
              CustomTextField(
                labelText: 'Address',
                controller: addressController,
              ),
              CustomTextField(
                labelText: 'Latitude & Longitude', // added
                controller: latlngController,
                keyboardType: TextInputType.text, // added
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                loading: loading,
                  title: "Submit",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });

                      _auth
                          .createUserWithEmailAndPassword(
                              email: profileemailController.text.toString(),
                              password: "student123")
                          .then((value) {
                            final latLng = latlngController.text.split(',');
                            final latitude = double.parse(latLng[0].trim());
                            final longitude = double.parse(latLng[1].trim());
                            final geoPoint = GeoPoint(latitude, longitude);
                        firestore
                            .collection("student")
                            .doc(value.user!.email)
                            .set({
                              
                              "email":
                                  profileemailController.text.toString().trim().toLowerCase(),
                              "name": nameController.text.toString().trim(),
                              "rollNo": rollNoController.text.toString(),
                              "dob": dobController.text.toString(),
                              "branch": branchController.text.toString(),
                              "duration": durationController.text.toString(),
                              "bloodType": _selectedBloodType,
                              "mobileNo": mobileNoController.text.toString(),
                              "residenceNo": residenceNoController.text.toString(),
                              "address": addressController.text.toString(),
                              "latlng": geoPoint, // added
                              "bus": _selectedBus,
                              "role": "student",
                            });
                        setState(() {
                          loading = false;
                          
                        });

                        Utils().ShowToastMessage("User added");
                        _formKey.currentState!.reset();
                          TextEditingController().clear();

                        
                      }).onError((error, stackTrace) {
                        setState(() {
                            loading = false;
                        });
                        Utils().ShowToastMessage("Error: $error");
                      });
                    }
                  }),
            
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
