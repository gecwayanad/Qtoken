import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qtoken/screens/joineData.dart';

class JoinQue extends StatefulWidget {
  DocumentReference joinref;
  int count;
  String orgname;
  String queName;
  JoinQue({ this.count, this.joinref, this.orgname, this.queName});
  @override
  _JoinQueState createState() => _JoinQueState();
}

class _JoinQueState extends State<JoinQue> {
  

  
  @override
  Widget build(BuildContext context) {
    DocumentReference ref = FirebaseFirestore.instance.collection("organisations").doc(widget.orgname).collection('que').doc(widget.queName);
    
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
              SharedPreferences userData = await SharedPreferences.getInstance();
          
              final name = userData.getString('name');
              final adress = userData.getString('adress');
              // Map data = new Map();
              ref.get().then((value) {
                  final all = value.data();
                  all['$name'] = '$adress';

                ref.set(

                  all
                );
              });
        
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