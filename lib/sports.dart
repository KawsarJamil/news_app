import 'package:flutter/material.dart';

class sports extends StatefulWidget {
  const sports({Key? key}) : super(key: key);
  static const String path = "sports";
  @override
  _sportsState createState() => _sportsState();
}

class _sportsState extends State<sports> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text("All"),
        )
      ],
    );
  }
}
