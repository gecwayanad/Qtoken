import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/hostDetailsCollection.dart';

import 'package:qtoken/screens/hostque.dart';
import 'package:qtoken/screens/joineData.dart';

import 'package:qtoken/screens/sighin.dart';
import 'package:google_fonts/google_fonts.dart';

String FinalEmail;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  List<Widget> addedlist = [];
  Widget addedwid(String mainheading, String discription) {
    return Column(
      children: [Text(mainheading), Text(discription)],
    );
  }

  @override
  void initState() {
    super.initState();
    // fetchData();
  }
  // fetchData()async{
  //   dynamic resultant = await DatabaseManager().receiveData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        drawer: Drawer(
            elevation: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    child: Text(
                      "LogOut",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    child: Text(
                      "About Us",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  ),
                ),
                Text(
                  "Copyrights@icpro",
                ),
              ],
            )),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('asset/images/background.png'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HostDetails()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: Text("Host Que",
                                  style: GoogleFonts.padauk(
                                      fontSize: 20, color: Colors.white)),
                            )),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => JoineData()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: Text("Join Que",
                                  style: GoogleFonts.padauk(fontSize: 20)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
