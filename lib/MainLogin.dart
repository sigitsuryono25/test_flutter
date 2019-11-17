import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/MainMenu.dart';

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
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Main Dua Dart"),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              TextField(
                controller: _usernameController,
                textAlign: TextAlign.left,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: 'masukkan username',
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: new InputDecoration(hintText: "Masukkan password"),
              ),
              RaisedButton.icon(
                icon: Icon(Icons.chevron_right),
                color: Colors.blue,
                onPressed: () {
//                  print("aaaaaaaa");
                  _onPressed(_usernameController.text, _passwordController.text,
                      context);
                },
                label: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Belum punya akun? "),
                    GestureDetector(
                      onTap: () => null,
                      child: Text(
                        "Daftar Sekarang!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }

  void _onPressed(String username, String password, BuildContext context) {
    if (username.trim().length > 0 && password.trim().length > 0) {
//      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      prefs.then((prefs) {
        prefs.setString("username", username);
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
              (Route route) => false);
    } else {
      Fluttertoast.showToast(msg: "Silahkan isi dulu yak");
    }
  }
}
