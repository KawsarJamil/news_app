import 'package:flutter/material.dart';
import 'all.dart';
import 'business.dart';
import 'sports.dart';
import 'entertainment.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  static const String path = "home";
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News App",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            Icon(Icons.notification_important_outlined),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // drawer: Drawer(),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TabBar(
                  indicatorColor: Colors.teal,
                  indicatorWeight: 4,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  labelPadding: EdgeInsets.all(10),
                  tabs: [
                    Text("All"),
                    Text("Business"),
                    Text("Sports"),
                    Text("Entertainment"),
                  ]),
              Expanded(
                child: TabBarView(
                  children: [
                    all(),
                    business(),
                    sports(),
                    entertainment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
