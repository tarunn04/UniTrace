import 'package:flutter/material.dart';
import 'package:unitrace_admin/Theme/text_theme.dart';
import 'package:unitrace_admin/utils/profile_list.dart';

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({Key? key}) : super(key: key);

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? _selectedBus;


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: w*0.3,
      decoration: BoxDecoration(
        color: Color.fromARGB(237, 244, 244, 244),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButtonFormField<String>(
                hint: Text('BUS',style: MyTextTheme.headline4.copyWith(
                  fontSize: 20
                )),
                alignment: Alignment.bottomCenter,
                value: _selectedBus,
                decoration: InputDecoration(
                  border: InputBorder.none,
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
      ),
    );
  }
}
