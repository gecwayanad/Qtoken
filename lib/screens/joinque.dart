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
  JoinQue({ this.count, this.orgname, this.queName});
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
        title: Text(
          "joinQue"
        ),
      ),
      
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("peoples in the que ${widget.count}"),
              // Text("current token number 4"),
              RaisedButton(onPressed: ()async{
                Navigator.push(context, MaterialPageRoute(builder: (_)=> JoineData(
                  organisationNameForJoin: orgnisationName,
                  queueNameForJoin: queueName,
                )));
             
        
              // ref.set({

              // });
              },
              child: Text(
                "join"
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}