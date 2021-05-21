import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:30),
                child: TextFormField(
                        decoration: InputDecoration(hintText: "Search",
                        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: IconButton(icon:Icon(Icons.search), onPressed: () { 

                     },),
                  ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                        ),
                        ),
                        ),
              ),
                      Container(
                        decoration: BoxDecoration(
                          border:Border()
                          
                        ),
                        child: ListView.builder(  itemCount: 10,
                        itemBuilder: (context, index) {
                        return Card(
                        child:ListTile(
                        
                          )
                        );
                        },),
                  
                      )
            ],
          ),
        ),
      ),
    );
  }
}