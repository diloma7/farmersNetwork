import 'dart:convert';

import 'package:farmers_network/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AdjustedPages/Program.dart';

// import 'AdjustedPages/Program.dart';

class LoyaltyProgram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoyaltyProgramState();
  }
}

 int? _points;

class _LoyaltyProgramState extends State<LoyaltyProgram> {
  @override
  void initState() {
    super.initState();
    _loadSharedData();
  }

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _points = jsonResponse['points'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF4F5F1)
            ),

          ),
          Container(
            height: 150,
               decoration: BoxDecoration(
               color: Color(0xFF4B7447)
              ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,30,0,8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                  onPressed: (){
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                    );
                                  },
                                  icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white, size: 30)
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text("Loyalty Program",
                                style: TextStyle(fontSize: 15, color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(100,0,10,0),
                              child: Container(
                                  // margin: EdgeInsets.fromLTRB(20, 5, 10, 0),
                                child: Icon(Icons.notifications,
                                        size: 20, color: Colors.white)
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              height: 100,
              width: 150,
              top: 100,
              left: 100,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    children: [
                      Text('Balance',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text(_points.toString()+ ' points',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontSize: 12)),
                    ]
                ),
              )
          ),
          Container(
            child: Positioned(
                height: 500,
                width: 400,
                top: 210,
                left: 10,
                child: Programs()
            ),
          )
       ]
      ) ,
    );
  }
}
