
// ignore: must_be_immutable
import 'package:app/Constants/colors.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  customButton({super.key, this.onTap, this.text});
  Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        decoration: BoxDecoration(
          color: pKcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: 150,
        child: Center(child: Text(text!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}