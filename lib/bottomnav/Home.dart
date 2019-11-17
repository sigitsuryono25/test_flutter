import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/prefs/SharefPrefs.dart';

class Home extends StatelessWidget {
  var entries = <String>['A', 'B', 'C'];
  var colorCodes = <int>[600, 500, 100];
  String username = "";

  @override
  Widget build(BuildContext context) {
    loadData();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Selamat Datang " + username),
          )
        ]),
        Flexible(
            child: ListView.builder(
                itemCount: entries == null ? 0 : entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    //You need to make my child interactive
                    onTap: () => _showToast(entries[index]),
                    child: new Card(
                      //I am the clickable child
                      child: Align(
                        alignment: Alignment.center,
                        child: new Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              //new Image.network(video[index]),
//                              new Padding(padding: new EdgeInsets.all(10.0)),
                              new Text(
                                entries[index],
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }))
      ]),
    );
  }

  _showToast(String index) {
    Fluttertoast.showToast(msg: index);
  }

  void loadData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var prefs = SharefPrefs(_pref);
    username = prefs.getKey("username");
  }
}
