import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePageJoine extends StatefulWidget {
  String organiisationNameToShow;
  int count;
  String queueNameToShow;
  HomePageJoine({this.organiisationNameToShow, this.queueNameToShow, this.count});
  @override
  _HomePageJoineState createState() => _HomePageJoineState();
}

class _HomePageJoineState extends State<HomePageJoine> {
  List items = [1,3,4,5,5,6,8,9,7];
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text("joined ques"),

      ),
      body:  Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
              DocumentReference _reference = FirebaseFirestore.instance
                .collection("organisations")
                .doc(widget.organiisationNameToShow)
                .collection('que')
                .doc(widget.queueNameToShow);
              return StreamBuilder(
                stream: _reference.snapshots(),
                builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
                 

                    return Card(
                      
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
                                SizedBox(height: 10,),
                                Text("organisation: ${widget.organiisationNameToShow}" , style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, 
                                color: Colors.black87
                                
                                ),
                                textAlign: TextAlign.left,),
                                SizedBox(height: 10,),
                                 Row(
                                   children: [
                                     Text("current token:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, 
                                color: Colors.black87
                                
                                ),),
                                Text(returnval(snapshot) , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, 
                                color: Colors.black
                                
                                ),),
                                   ],
                                 ),
                                 Text("Your token:${widget.count}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, 
                                color: Colors.black87
                                
                                ),),
                                SizedBox(height: 10,),
                                Text(snapshot.data.reference.id  , style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, 
                                color: Colors.black87
                                
                                ),),

                              ],
                            ),
                          ),
                        ),
                      ),
                                );
                  }
                  );
                
              
          },
        ),
      )
    );

  }
      returnval(AsyncSnapshot<DocumentSnapshot> snapshot){
       Map map = snapshot.data.data();
       var sortedKeys = map.keys.toList()..sort();
       return sortedKeys[0];
    }
}