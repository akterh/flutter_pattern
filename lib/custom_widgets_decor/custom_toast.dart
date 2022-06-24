import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ToastComponent {
  static showToast(String msg, context, {duration = 0, gravity = 0}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black38,
        fontSize: 16.0
    );
  }
}