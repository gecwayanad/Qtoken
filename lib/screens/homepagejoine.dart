import 'package:flutter/material.dart';

class HomePageJoine extends StatefulWidget {
  @override
  _HomePageJoineState createState() => _HomePageJoineState();
}

class _HomePageJoineState extends State<HomePageJoine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("joined ques"),

      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Text("your ques"),
            ),
            // StreamBuilder(builder: )
          ],
        ),
      ),
    );
  }
}