import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  final BuildContext context;
  final String text;

  final FlutterToast flutterToast;

  MyToast(this.context, {Key key, this.text})
      : flutterToast = FlutterToast(context),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.black26,
        height: 36,
        width: 120,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void show() {
    flutterToast.showToast(
      child: this,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
