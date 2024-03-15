import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Display a toast message using the Fluttertoast package.
void showToast({required String message}){
  Fluttertoast.showToast(
    msg: message, //The message to be displayed.
    toastLength: Toast.LENGTH_SHORT, //The duration for which the toast should be displayed.
    gravity: ToastGravity.BOTTOM, //The position where the toast should appear on the screen.
    timeInSecForIosWeb: 1, //The time duration for which the toast should be displayed on iOS and web platforms.
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
  );
}