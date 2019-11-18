import 'package:flutter/material.dart';
import 'package:test_flutter/bottomnav/Home.dart';
import 'package:test_flutter/bottomnav/Lokasi.dart';

import 'bottomnav/People.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //custom your class
      theme: ThemeData(
          primaryColor: Colors.red[700],
          primaryColorDark: Colors.red[500],
          accentColor: Colors.yellow[300]),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Content();
  }
}

class Content extends State<MainMenu> {
  //content dari bottom nav
  static int _selectedIndex = 0;
  List<Widget> _content = <Widget>[Home(), people(), lokasi()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: _content.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          //first item
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          //second item
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("People")),
          //third item
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Lokasi"))
        ],
        onTap: _onTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
