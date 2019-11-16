import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter/main.dart';

void main() => runApp(MyAppDua());

class MyAppDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.blue,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<Home> {
  TextEditingController _usernameController;

  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    _usernameController = new TextEditingController();
    _passwordController = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Main Dua Dart"),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'masukkan username',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Masukkan password"),
                ),
                RaisedButton(
                  onPressed: () {
//                  print("aaaaaaaa");
                    _onPressed(_usernameController.text,
                        _passwordController.text, context);
                  },
                  child: Text("Clicked Me Ya"),
                ),
              ],
            )));
  }

  void _onPressed(String username, String password, BuildContext context) {
    if (username.trim().length > 0 && password.trim().length > 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      Fluttertoast.showToast(msg: "Silahkan isi dulu yak");
    }
  }
}
