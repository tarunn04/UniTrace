import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Theme/constants.dart';

class CustomFormField extends StatefulWidget {
  String hint;
  IconData iconData;
  bool isHidden;
  bool isEmail;

  TextEditingController controller;
  CustomFormField({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.isHidden,
    required this.isEmail, required this.controller
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isHidden,
        keyboardType: widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(widget.iconData,color: authUnderlineActive,),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your ${widget.hint}";
          }
          return null;
        },
      ),
    );
  }
}
