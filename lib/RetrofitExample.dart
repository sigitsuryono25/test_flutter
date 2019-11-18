import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/retrofit/ApiService.dart';
import 'package:test_flutter/retrofit/ApiServiceNews.dart';

final logger = Logger();

void main() => runApp(RetrofitExample());

class RetrofitExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _RetrofitExample(),
      theme: ThemeData(
          primaryColorDark: Colors.blue,
          primaryColor: Colors.blue[200],
          accentColor: Colors.red),
    );
  }
}

class _RetrofitExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RetrofitExampleState();
  }
}

class _RetrofitExampleState extends State<_RetrofitExample> {
  String nama = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrofit Example"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Text(nama),
      ),
    );
  }

  setToInterface(List<Task> it) {
    setState(() {
      nama = it[0].name;
    });
  }

  void _getdata() {
    final dio = Dio();
    final client = ApiServiceNews(dio);
    client.getNews("apple", "popularity").then((it) => print(it.status));
  }
}
