import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HostQuePage extends StatefulWidget {
  String nameOforganiationtransfer;
  String nameOfQueTransfer;
  HostQuePage({this.nameOforganiationtransfer, this.nameOfQueTransfer});
  @override
  _HostQuePageState createState() => _HostQuePageState();
}

class _HostQuePageState extends State<HostQuePage> {
  TextEditingController addquecontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance
        .collection("organisations")
        .doc(widget.nameOforganiationtransfer)
        .collection("que");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),

      // floatingActionButton: FloatingActionButton(child: Icon(Icons.add),),

      body: Column(children: [
        // Container(
        //   width: 100,
        //   child: Row(

        //     children: [
        //     TextFormField(
        //     controller: addquecontroller,
        //     decoration:InputDecoration(
        //       labelText: "new que name",

        //     )
        //     ),
        //     ],
        //   ),
        // ),

        Container(
          height: 200,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                      itemCount:
                          snapshot.hasData ? snapshot.data.docs.length : 0,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.grey[200],
                            elevation: 2,
                            child: ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    // color: Colors.grey[200],
                                  ),
                                  margin: EdgeInsets.all(1),
                                  // height: 200,

                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SingleChildScrollView(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                            snapshot.data.docs[index].id,
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
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(30)),
                                )),
                          ),
                        );
                      });
                }),
          ),
        ),
      ]),
    );
  }
}
