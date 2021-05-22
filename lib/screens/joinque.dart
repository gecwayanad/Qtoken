import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/homepagejoine.dart';
import 'package:qtoken/screens/hostDetailsCollection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qtoken/screens/joineData.dart';

class JoinQue extends StatefulWidget {
  int count;
  String orgname;
  String queName;
  JoinQue({this.count, this.orgname, this.queName});
  @override
  _JoinQueState createState() => _JoinQueState();
}

class _JoinQueState extends State<JoinQue> {
  @override
  Widget build(BuildContext context) {
    String orgnisationName = widget.orgname;
    String queueName = widget.queName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text("joinQue"),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('asset/images/ticket.png'),
                  fit: BoxFit.fitWidth,
                )),
                height: 250,
                width: 250,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-20 / 360),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(110, 90, 20, 20),
                    child: Text(
                      "${widget.count}",
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    ),
                  ),
                ),
              ),

              // Text("current token number 4"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => JoineData(
                        organisationNameForJoin: orgnisationName,
                        queueNameForJoin: queueName,
                      )));

          // ref.set({

          // });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
