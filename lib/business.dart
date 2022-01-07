import 'package:flutter/material.dart';

class business extends StatefulWidget {
  const business({Key? key}) : super(key: key);
  static const String path = "business";
  @override
  _businessState createState() => _businessState();
}

class _businessState extends State<business> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text("business"),
        )
      ],
    );
  }
}
