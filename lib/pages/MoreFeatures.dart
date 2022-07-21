import 'dart:convert';

import 'package:farmers_network/pages/AdminProfile.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/LoginPage.dart';
import 'package:farmers_network/pages/LoyaltyProgram.dart';
import 'package:farmers_network/pages/ProfilePage.dart';
import 'package:farmers_network/pages/RegistrationVerification.dart';
import 'package:farmers_network/pages/Rewards.dart';
import 'package:farmers_network/pages/ServiceProviderProfilePage.dart';
import 'package:farmers_network/pages/events.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AdjustedPages/ProfilePage.dart';

class MoreFeatures extends StatefulWidget {
  @override
  _MoreFeaturesState createState() => _MoreFeaturesState();
}

class _MoreFeaturesState extends State<MoreFeatures> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();

    _loadSharedData();
  }

  String _route = '';
  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _route = jsonResponse['userType'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('More Features',
            style: TextStyle(fontSize: 12, color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
        ),
        backgroundColor: Color(0xFF4b7344),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Container(
                      //color: Color(0xFFC5C5C5),
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFC5C5C5),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Profile ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green)),
                            Icon(
                              Icons.person,
                              color: Colors.orange,
                              size: 24,
                            ),
                          ],
                        ),
                      )),
                  onTap: () {
                    if (_route == "FARMER") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    } else if (_route == "PARTNER") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceProviderProfilePage()),
                      );
                    } else if (_route == "SERVICE_PROVIDER") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceProviderProfilePage()),
                      );
                    } else if (_route == "ADMINISTRATOR") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationVerification()),
                      );
                    }
                  }),
              InkWell(
                child: Container(
                    //color: Color(0xFFC5C5C5),
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC5C5C5),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Icon(
                            Icons.payment_rounded,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              InkWell(
                child: Container(
                    //color: Color(0xFFC5C5C5),
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC5C5C5),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Loyalty Programs',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Icon(
                            Icons.person,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoyaltyProgram()),
                  );
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC5C5C5),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rewards',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Icon(
                            Icons.clean_hands_outlined,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC5C5C5),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Farm Reviews',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFC5C5C5)),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Planner',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Color(0xFF1F3902),
                              )),
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Events()),
                  );
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC5C5C5),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Settings',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green)),
                          Icon(
                            Icons.settings,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ],
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFC5C5C5),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Row(children: [
                          Icon(Icons.power_settings_new, color: Colors.grey),
                          Text('Logout',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.green))
                        ]),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
