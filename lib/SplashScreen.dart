import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/MainLogin.dart';
import 'package:test_flutter/MainMenu.dart';
import 'package:test_flutter/prefs/SharefPrefs.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blueAccent,
      home: MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<MySplashScreen> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    checkLoggedInData();
    new Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        if (username.isNotEmpty) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
                  (Route route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyAppDua()),
                  (Route route) => false);
        }
      });
    });

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("graphics/ic_launcher.png"),
            ),
            Text("Flutterku yang pertama")
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void checkLoggedInData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var prefs = SharefPrefs(_prefs);
    username = prefs.getKey("username");
  }
}
