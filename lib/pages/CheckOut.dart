import 'dart:convert';

import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/TrackTransaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();

    _loadSharedData();
  }

  String _route = '';
  final _formKey = GlobalKey<FormState>();
  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _route = jsonResponse['userType'];
    });
  }

  bool isChecked = false;
  String dropdownvalue = 'Courier';
  var items = [
    'Courier',
    'Pick Up',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          title: Text('Checkout',
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
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    child: Column(children: [
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Container(
                    height: 60,
                    color: Colors.orange,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Total'), Text('USD 240')],
                    )),
                Card(
                    child: ListTile(
                  leading: Image.asset('assets/images/serviceProvider.png'),
                  title: const Text("Green Bananas Seeds"),
                )),
                Card(
                    child: ListTile(
                  leading: Image.asset('assets/images/serviceProvider.png'),
                  title: const Text("African Yellow Bananas"),
                )),
                Container(
                    height: 40,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text('Delivery Method :'),
                        Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton(
                                  value: dropdownvalue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                        value: items, child: Text(items));
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFF4B7447)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    // controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFF4B7447)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    // controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Country',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFF4B7447)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter City';
                      }
                      return null;
                    },
                    // controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'City',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFF4B7447)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Street';
                      }
                      return null;
                    },
                    // controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Street',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFF4B7447)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    // controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xFF4B7447)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    // controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = !isChecked;
                      setState(() {});
                    },
                  ),
                  Text("Agree to Delivery T&Cs",
                      style: TextStyle(color: Colors.green, fontSize: 10)),
                ]),
                Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              // This is what you need!
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackTransaction()),
                              );
                            },
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11)),
                          ),
                          SizedBox(width: 20), //Color Of Icon),,
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    width: 1.0, color: Colors.orangeAccent)
                                // This is what you need!
                                ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackTransaction()),
                              );
                            },
                            child: Text("Pay Now",
                                style: TextStyle(
                                    color: Color(0xFF4b7344),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11)),
                          ), //Color Of Icon),,
                        ])),
              ]))
        ])))));
  }
}
