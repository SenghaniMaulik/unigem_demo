import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final text;

  Pages({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text, textAlign: TextAlign.center, style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold),),
          ]
      ),
    );
  }
}