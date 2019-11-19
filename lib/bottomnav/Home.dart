import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/datamodel/articles.dart';
import 'package:test_flutter/retrofit/ApiServiceNews.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var entries = <String>['A', 'B', 'C'];
  var colorCodes = <int>[600, 500, 100];
  String username = "";
  var news = new List<Articles>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    _getdata(context);
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
                itemCount: news == null ? 0 : news.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    //You need to make my child interactive
                    onTap: () => _showToast(news[index].url),
                    child: new Card(
                      //I am the clickable child
                      child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Container(
                                width: 85.0,
                                alignment: Alignment.center,
                                child: Image.network(news[index].urlToImage),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              news[index].title,
                                              overflow: TextOverflow.clip,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              news[index].publishedAt,
                                              style: TextStyle(fontSize: 9),
                                            ))
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  );
                }))
      ]),
    );
  }

  _showToast(String index) {
    Fluttertoast.showToast(msg: index);
  }

  void _getdata(BuildContext context) {
    var pd = ProgressDialog(context);
    pd.style(message: "memuat data");
//    setState(() {
//      pd.show();
//    });
    final dio = Dio();
    final client = ApiServiceNews(dio);
    client
        .getNews("apple", "popularity")
        .then((it) => _setToView(it.articles, pd));
  }

  _setToView(List<Articles> articles, ProgressDialog pd) {
//    pd.dismiss();
    setState(() {
      news = articles;
    });
  }

  void _getUserData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var username = sharedPref.getString("username");
    Fluttertoast.showToast(msg: username);
    setState(() {
      this.username = username;
    });
  }
}
