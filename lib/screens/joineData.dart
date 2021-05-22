import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/homepagejoine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoineData extends StatefulWidget {
  String organisationNameForJoin;
  String queueNameForJoin;
  JoineData({this.organisationNameForJoin, this.queueNameForJoin});
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
    DocumentReference ref = FirebaseFirestore.instance
        .collection("organisations")
        .doc(widget.organisationNameForJoin)
        .collection('que')
        .doc(widget.queueNameForJoin);
    CollectionReference joinePersonal = _firestore.collection("users");
    return Scaffold(
        body: Container(
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: nameOfJoinee,
              decoration: InputDecoration(
                labelText: "name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: TextFormField(
              controller: adressOfJoinee,
              decoration: InputDecoration(
                labelText: "adress",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () async {
              User user = _auth.currentUser;

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePageJoine()));
              // Map data = new Map();
              List dataconvert;
              ref.get().then((value) {
                final all = value.data();
                int dataleng = all.length + 1;
                all['${dataleng}'] =
                    '${adressOfJoinee.text + '///' + nameOfJoinee.text}';

                ref.set(all);
              }).whenComplete(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePageJoine()));
              });
            },
            child: Text("Join"),
          )
        ],
      )),
    ));
  }
}
