import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/details.dart';
import 'package:news_app/details.dart';

class all extends StatefulWidget {
  const all({Key? key}) : super(key: key);
  static const String path = "all";
  @override
  _allState createState() => _allState();
}

class _allState extends State<all> {
  List allnews = [];
  String url =
      "https://newsapi.org/v2/everything?q=tesla&from=2021-11-22&sortBy=publishedAt&apiKey=b7b49567b321479ba49c1389ccf8a351";
  Future getallnews() async {
    Map _allnews = {};
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      _allnews = jsonDecode(response.body);
      setState(() {
        allnews = _allnews["articles"];
      });
    }
  }

  String getimage(String url) {
    if (url != '\0') {
      return url;
    } else
      return "nothing";
  }

  String getauthor(String name) {
    if (name != '\0') {
      return name;
    } else {
      return "unknown resource";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getallnews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
          itemCount: allnews.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      details.path,
                      arguments: allnews[index],
                    );
                  },
                  title: Text("${allnews[index]["title"]}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getauthor(
                          allnews[index]["author"],
                        ),
                      ),
                      Text(
                        allnews[index]["publishedAt"],
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Hero(
                    tag: "${allnews[index]["url"]}",
                    child: Image.network(
                      getimage(allnews[index]["urlToImage"]),
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
