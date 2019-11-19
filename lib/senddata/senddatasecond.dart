import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final String m = "";

class senddatasecond extends StatelessWidget {
  String message;
  String message1;

  senddatasecond({Key key, @required this.message, @required this.message1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _senddatasecond(
        message: message,
        message1: message1,
      ),
    );
  }
}

class _senddatasecond extends StatefulWidget {
  String message;
  String message1;

  _senddatasecond({Key key, @required this.message, this.message1})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _senddatasecondState(this.message, this.message1);
  }

  void setContent(String m) {}
}

class _senddatasecondState extends State<_senddatasecond> {
  String m;
  String m1;

  _senddatasecondState(this.m, this.m1);

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(msg: m + " " + m1);
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
