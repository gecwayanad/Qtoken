import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/joinePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoineData extends StatefulWidget {
  @override
  _JoineDataState createState() => _JoineDataState();
}

class _JoineDataState extends State<JoineData> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  


  TextEditingController nameOfJoinee = TextEditingController();
  TextEditingController adressOfJoinee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference joinePersonal = _firestore.collection("users");
    return Scaffold(
      body:Container(
        child: Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameOfJoinee,
              decoration: InputDecoration(
                labelText: "name"
              ),
            ),
            TextFormField(
              controller: adressOfJoinee,
              decoration: InputDecoration(
                labelText: "adress"
              ),
               
            ),
            RaisedButton(onPressed: ()async{
              try {
                User user = _auth.currentUser;
                SharedPreferences userData = await SharedPreferences.getInstance();
                userData.setString("name",nameOfJoinee.text );
                userData.setString("adress",adressOfJoinee.text );
                // joinePersonal.doc(user.uid).set({
                //   nameOfJoinee.text:adressOfJoinee.text
                // });
              } catch (e) {
                print(e);
              }

                 Navigator.push(context, MaterialPageRoute(builder: (_)=> JoinePage()));
             
                },
                child: Text("submit"),
                )
          ],
        )),
      )
    );
  }
}