import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unitrace_admin/utils/utils.dart';
import 'package:unitrace_admin/widget/round_button.dart';

import '../../utils/profile_list.dart';
import '../../widget/custom_profile_text.dart';

class DriverProfileForm extends StatefulWidget {
  const DriverProfileForm({super.key});

  @override
  State<DriverProfileForm> createState() => _DriverProfileFormState();
}

class _DriverProfileFormState extends State<DriverProfileForm> {
  final TextEditingController profileemailController = TextEditingController();
  final TextEditingController profilepassController = TextEditingController();
  final TextEditingController profilerepassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController empIdController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController residenceNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? _selectedBloodType;
  String? _selectedBus;
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Default Password is driver123",
                  border: InputBorder.none
                ),
              ),
              CustomTextField(
                labelText: 'Name',
                controller: nameController,
              ),
              CustomTextField(
                labelText: 'Emp id.',
                controller: empIdController,
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                labelText: 'Date of Birth',
                controller: dobController,
                keyboardType: TextInputType.datetime,
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
                labelText: 'Address',
                controller: addressController,
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                  title: "Submit",
                  loading: loading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      _auth
                          .createUserWithEmailAndPassword(
                        email: profileemailController.text,
                        password: "driver123",
                      )
                          .then((value) {
                        firestore
                            .collection('driver')
                            .doc(value.user!.email)
                            .set({
                          'bus': _selectedBus,
                          'email': profileemailController.text.toLowerCase().trim(),
                          'name': nameController.text,
                          'empId': empIdController.text,
                          'dob': dobController.text,
                          'bloodType': _selectedBloodType,
                          'mobileNo': mobileNoController.text,
                          'address': addressController.text,
                          'role': "driver",
                        });
                        setState(() {
                          loading = false;
                        });
                        Utils().ShowToastMessage("Driver Added Successfully");
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

                  SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
    ;
  }
}
