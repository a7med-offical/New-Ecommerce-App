import 'package:flutter/material.dart';

class SnackbarUtil {
  static void showSnackbar(BuildContext context, String message,void Function() onPressed) {
    final snackBar = SnackBar(
      backgroundColor: Colors.deepPurpleAccent,
      content: Text(message,style: TextStyle(color: Colors.white),),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed:onPressed 

      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
