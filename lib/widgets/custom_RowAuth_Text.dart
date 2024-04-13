
import 'package:app/Constants/colors.dart';
import 'package:flutter/material.dart';

class RowAuthText extends StatelessWidget {
  RowAuthText({super.key, this.ButtonStatus, this.textStatus,this.onPressed});

  String? textStatus;
  String? ButtonStatus;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textStatus!,
          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: onPressed,child : Text( ButtonStatus!,
          style: const TextStyle(fontSize: 18,color: pKcolor,fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}