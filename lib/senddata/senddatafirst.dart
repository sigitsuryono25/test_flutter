import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/senddata/senddatasecond.dart';

void main() => runApp(senddatafirst());

class senddatafirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _senddatafirst(),
    );
  }
}

class _senddatafirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _senddatafirststate();
  }
}

class _senddatafirststate extends State<_senddatafirst> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Intent"),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () =>
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        senddatasecond(
                          message: "Kontent", message1: "Kontent 1",)))
          },
          child: Text("Send Data"),
        ),
      ),
    );
  }
}
