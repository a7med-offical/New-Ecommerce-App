// ignore: must_be_immutable
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.obsecureText= false,
      this.keyboardType,
      this.onSubmitted,
      this.controller
      });

  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? labelText;
  bool obsecureText ;
  Function(String)? onSubmitted;
  TextInputType? keyboardType;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical:12.0),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        keyboardType:keyboardType ,
        obscureText: obsecureText,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            labelText: labelText,
            suffixIcon: suffixIcon,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            ))),
      ),
    );
  }
}
