import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HostShowQueueMembers extends StatefulWidget {
  String orgName;
  String queueName;
  HostShowQueueMembers({this.orgName, this.queueName});
  @override
  _HostShowQueueMembersState createState() => _HostShowQueueMembersState();
}

class _HostShowQueueMembersState extends State<HostShowQueueMembers> {
  @override
  Widget build(BuildContext context) {
    DocumentReference ref = FirebaseFirestore.instance
        .collection("organisations")
        .doc(widget.orgName)
        .collection('que')
        .doc(widget.queueName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text("peoples in queue"),
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.hasData ? snapshot.data.data().length : 0,
                  itemBuilder: (_, index) {
                    print(snapshot.data.data().length);
                    return GestureDetector(
                      onTap: () {},
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
                                    "Token Number: ${snapshot.data.data().keys.elementAt(index)}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    snapshot.data
                                        .data()
                                        .values
                                        .elementAt(index),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      try {
                                        snapshot.data.data().remove(index);
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Text("checked"),
                                  )
                                  // Text(snapshot.data.docs[index].get("adress"), style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                                  // color: Colors.black87

                                  // ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }),
      )),
    );
  }
  // readUserData(AsyncSnapshot<DocumentSnapshot> snapshot, int index){
  //   List storesplitted = [];
  //   final mapdata = snapshot.data.data();
  //   mapdata.forEach((key, value) {

  //     // List splitted = value.split('///');
  //     storesplitted.add(value.split('///'));
  //   });
  //   // return "${storesplitted[1]}}";
  //   return "${storesplitted} ";

  // }
}
