import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/home.dart';
import 'package:qtoken/screens/host/hostshowqueuemembers.dart';
import 'package:qtoken/screens/hostDetailsCollection.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String hostorgName = widget.nameOforganiationtransfer;
    String hostQueueName = widget.nameOfQueTransfer;
    CollectionReference ref = FirebaseFirestore.instance
        .collection("organisations")
        .doc(hostorgName)
        .collection("que");
     
        
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:10),
            child: GestureDetector(
              onTap: (){
                showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Delete Organisation", style: TextStyle(color: Colors.red),),
                  content: Text("Do you want to delete this organisation? \n \n your data will be erased!!"),
                  
                  actions:
                  
                   <Widget>[
                     
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            color:  Colors.red,
                            onPressed: ()async{
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            
                            CollectionReference refDoc = FirebaseFirestore.instance.collection("organisations");
                            refDoc.doc(preferences.getString('users organisations')).delete().whenComplete(() {
                              preferences.setString('users organisations', '').whenComplete(() => {
                                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => HomePage()))
                              });
                            });
                            
                            
                            
                            // .whenComplete((){
                            //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => HostDetails()));
                            // });
                          },
                          child: Text("Delete Organisation", style: TextStyle(color:Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: RaisedButton(
                              color:  Colors.blue,
                              onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Cancel",  style: TextStyle(color:Colors.white),),
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
              );
            
              },
              child: Icon(Icons.exit_to_app,)),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Add()));
       
      },
      ),

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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> HostShowQueueMembers(
                              orgName: widget.nameOforganiationtransfer,
                              queueName: snapshot.data.docs[index].id,
                            )));
                          },
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
                                          // Text(
                                            
                                             
                                          //   style: TextStyle(
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.normal,
                                          //       color: Colors.black87),
                                          // ),
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







 class Add extends StatefulWidget {
          @override
          _AddState createState() => _AddState();
        }
        
        class _AddState extends State<Add> {
            TextEditingController nameque = TextEditingController();

          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(),
                          body: Container(
                child:Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
               
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
                  child: Text("Add Queue"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey[600],
                  textColor: Colors.white,
                  onPressed: () async {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    final tempName = preferences.getString('users organisations');
                    
                    DocumentReference ref = FirebaseFirestore.instance
                        .collection("organisations")
                        .doc(tempName);
                    ref.collection("que").doc(nameque.text).set({})
                   
                    .whenComplete(() {
                     Navigator.pop(context);
                    });
                  }
                
                )]
                ),
              )),
            );
          }
        }