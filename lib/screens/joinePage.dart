import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/joineAvailableQUes.dart';

class JoinePage extends StatefulWidget {
  @override
  _JoinePageState createState() => _JoinePageState();
}

class _JoinePageState extends State<JoinePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference ref =
      FirebaseFirestore.instance.collection("organisations");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Text(
            "Available organisations",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        body: Container(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder(
              stream: ref.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView.builder(
                    itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => JoineAvailableQue(
                                        nameOfOrg: snapshot.data.docs[index].id,
                                      )));
                        },
                        child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(30),
                                // color: Colors.grey[200],
                                ),
                            margin: EdgeInsets.all(1),
                            // height: 200,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data.docs[index].id,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data.docs[index].get("adress"),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }),
        )));
  }
  // calcdata(AsyncSnapshot snapshot){

  //   }
  // }
}
