import 'dart:convert';

import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/widgets/BottomNav.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rewards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RewardsState();
  }
}

late int _points;

class _RewardsState extends State<Rewards> {
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
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Color(0xFF4b7344),
              // set your color
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            icon: Icon(Icons.keyboard_arrow_left_outlined,
                                color: Colors.white),
                          ),
                          Text(
                            "Loyalty Program",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(20, 5, 10, 0),
                              child: Icon(Icons.notifications,
                                  size: 20, color: Colors.white))
                        ],
                      ), // set an icon or image
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 150,
                            margin: EdgeInsets.fromLTRB(80, 20, 80, 10),
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: Color(0Xffffffff),
                              border: Border.all(
                                  color: Color(0Xffffffff), width: 1),
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(children: [
                              Text('Balance',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Text(_points.toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Poppins',
                                      fontSize: 12)),
                            ]),
                          ),
                        ],
                      ),
                      // set your search bar setting
                    ],
                  )),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: <Widget>[
              //Flexible
              SizedBox(height: 30),
              Container(
                child: Card(
                  child: ListTile(
                    subtitle: const Text(
                        'Complete your profile and earn 30 Farmers Network points',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.green)),
                    leading: Image.asset('assets/images/app.jpg',
                        width: 30, height: 60),
                    // trailing:
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    subtitle: const Text(
                        'Shopping on the farmers network market and earn 10% off your order',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.green)),
                    leading: Image.asset('assets/images/app.jpg', width: 30),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    subtitle: const Text(
                        'Update your report to earn a free ticket to Nairobi International Trade Fare T&Cs Apply',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.green)),
                    leading: Image.asset('assets/images/report.png', width: 30),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    subtitle: Text(
                        'Upload  and share your business card on Farmers Network to earn 10 points',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.green)),
                    leading: Image.asset('assets/images/report.png', width: 30),
                  ),
                ),
              ),
              Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Card(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/serviceProvider.png'),
                                      fit: BoxFit.cover),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text("Farm Inputs",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white))),
                              ),
                            ),
                            onTap: () {},
                          )),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Card(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/developmentPartners.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text("Training",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white))),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Card(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/offtake.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text("Finance/Credit",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white))),
                            ),
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  )),
              Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Card(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/serviceProvider.png'),
                                      fit: BoxFit.cover),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text("School Fees",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white))),
                              ),
                            ),
                            onTap: () {},
                          )),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Card(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/developmentPartners.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text("Preferential Farmer",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white))),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Card(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/offtake.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text("Communications",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white))),
                            ),
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  )),
            ]), //Column
          ) //Padding
              ), //Container
        ) //Container
            ));
  }
}
