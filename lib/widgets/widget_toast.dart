import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast {
  getDialog({required String mensaje, required Color color}) {
    return Fluttertoast.showToast(
      msg: mensaje.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
