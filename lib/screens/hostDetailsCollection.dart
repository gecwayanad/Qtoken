import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/hostque.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HostDetails extends StatefulWidget {
  @override
  _HostDetailsState createState() => _HostDetailsState();
}

class _HostDetailsState extends State<HostDetails> {
  TextEditingController nameOfOrg = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController nameque = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: nameOfOrg,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Organisation name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: discription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "adress",
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: TextFormField(
                    controller: nameque,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Name of que",
                    )),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[600],
                textColor: Colors.white,
                onPressed: () async {
                  //adding data to shared
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString('users organisations', nameOfOrg.text);

                  DocumentReference ref = FirebaseFirestore.instance
                      .collection("organisations")
                      .doc("${nameOfOrg.text}");
                  ref.collection("que").doc(nameque.text).set({});
                  ref.set(
                    {
                      'name': '${nameOfOrg.text}',
                      'discription': '${discription.text}',
                    },
                  ).whenComplete(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HostQuePage(
                                  nameOforganiationtransfer: nameOfOrg.text,
                                  nameOfQueTransfer: nameque.text,
                                )));
                  });
                  // User user = _auth.currentUser;
                  // try {
                  //    ref.doc("").set({
                  //   'name':'1',
                  //   'adress':'thacharuthodi'
                  // }).whenComplete((){
                  //   Navigator.push(context, MaterialPageRoute(builder: (_)=> HostQuePage()));
                  // });
                  // } catch (e) {
                  //   print(e);
                  // }
                },
                child: Text("submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
