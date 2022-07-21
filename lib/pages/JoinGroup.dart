import 'dart:core';

import 'package:flutter/material.dart';

class JoinGroup extends StatefulWidget {
  const JoinGroup({Key? key}) : super(key: key);

  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  void initState() {
    // _loadSharedData();
    // _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFBF3F7F2),
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Color(0xFF4b7344), // set your color
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              child: Image.asset(
                                'assets/images/login.png',
                                height: 50,
                              ))),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 10, 0),
                          child: Icon(Icons.notifications,
                              size: 20, color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                          child: Text("Hello",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: Colors.white))),
                      // set an icon or image
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: ElevatedButton.icon(
                              label: Text('Download',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      color: Colors.white)),
                              icon: Icon(Icons.download,
                                  size: 18, color: Colors.white),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4b7344),
                                  side: BorderSide(
                                    width: 1.0,
                                    color: Colors.white,
                                  ))))
                    ],
                  ), // set your search bar setting
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
        ));
  }
}
