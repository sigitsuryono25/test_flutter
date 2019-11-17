import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(LayoutingFlutter());

class LayoutingFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.green,
      home: _LayoutingFlutter(),
    );
  }
}

class _LayoutingFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LayoutingFlutterCreateState();
  }
}

class _LayoutingFlutterCreateState extends State<_LayoutingFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Layouting"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new GestureDetector(
        onTap: () => _ontap(),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(5.0),
//              color: Colors.green,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image(image: AssetImage("graphics/ic_launcher.png")),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Judul 100",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("Judul 100"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addArticle();
        },
      ),
    );
  }

  void _ontap() {
    Fluttertoast.showToast(msg: "Clicked");
  }

  void _addArticle() {
    Fluttertoast.showToast(msg: "Create Article Clicked");
  }
}
