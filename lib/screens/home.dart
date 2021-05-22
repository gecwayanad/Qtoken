import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qtoken/screens/hostDetailsCollection.dart';

import 'package:qtoken/screens/hostque.dart';
import 'package:qtoken/screens/joineData.dart';
import 'package:qtoken/screens/joinePage.dart';

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
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: TextButton(
                    child: Text(
                      "Logout",
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
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: TextButton(
                    child: Text(
                      "About",
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> JoinePage()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 500),
                  child: Text(
                    "Copyrights@icpro",
                  ),
                )
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Carousel(
                        dotSize: 4.0,
                        dotColor: Colors.grey,
                        dotBgColor: Colors.transparent,
                        dotIncreasedColor: Colors.grey,
                        images: [
                          Image.asset(
                            'asset/images/hint1.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'asset/images/hint2.png',
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  ),
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
