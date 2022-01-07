import 'package:flutter/material.dart';

class entertainment extends StatefulWidget {
  const entertainment({Key? key}) : super(key: key);
  static const String path = "entertainment";
  @override
  _entertainmentState createState() => _entertainmentState();
}

class _entertainmentState extends State<entertainment> {
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
