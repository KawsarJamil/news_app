import 'package:flutter/material.dart';
import 'package:news_app/all.dart';
import 'package:news_app/details.dart';
import 'home_screen.dart';

void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "news app",
      initialRoute: home.path,
      routes: {
        home.path:(context)=>home(),
        all.path:(context)=>all(),
        //DetailScreen.path:(context)=>DetailScreen(),
        details.path:(context)=>details(),
      },
    );
  }
}
