import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/joinque.dart';

class JoineAvailableQue extends StatefulWidget {

  String nameOfOrg;
  JoineAvailableQue({ this.nameOfOrg});
  @override
  _JoineAvailableQueState createState() => _JoineAvailableQueState();
}

class _JoineAvailableQueState extends State<JoineAvailableQue> {
  
  @override
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance.collection("organisations").doc(widget.nameOfOrg).collection('que');

    return Scaffold(
      appBar: AppBar(
        title: Text("available ques"),
      ),
      body:  StreamBuilder(
            stream: ref.snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView.builder( 
              itemCount: snapshot.hasData?snapshot.data.docs.length:0,
              itemBuilder: (_, index){


                return GestureDetector(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=> JoinQue(
                   count: snapshot.data.docs[index].data().values.length,
                   joinref: snapshot.data.docs[index].reference,
                   queName:snapshot.data.docs[index].id ,
                   orgname: widget.nameOfOrg,
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
                              Text(snapshot.data.docs[index].id, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, 
                              color: Colors.black
                              
                              ),),
                              SizedBox(height: 10,),
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
              }
              );
            }
          ),
    );
  }
}