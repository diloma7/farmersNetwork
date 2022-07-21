import 'dart:convert';
//import 'package:farmers_network/apis/api.dart';
//import 'package:farmers_network/pages/partners.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BusinessDataEntry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BusinessDataEntryState();
  }
}

class _BusinessDataEntryState extends State<BusinessDataEntry> {
  late String token;
  String dropCategory = 'Expenses';

  // List of items in our dropdown menu
  var itemsCategory = [
    'Expected Cash Out',
    'Expected Cash In',
    'Cash Out',
    'Cash In',
  ];

  String dropBudget = 'Budget';

  // List of items in our dropdown menu
  var figuresCategory = [
    'Budget',
    'Actual',
  ];
  @override
  void initState() {
    super.initState();
    // _loadSharedData();
  }

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      token = jsonResponse['token'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
            ),
            backgroundColor: Color(0xFFF5FCF4),
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              tabs: [
                Text('Expected Cash Out',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                Text('Expected Cash In',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                Text('Cash Out',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                Text('Cash In',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
            title: Container(
                child: Row(
              //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 50,
                    )),
              ],
            )),
            elevation: 0,
          ),
          body: TabBarView(
            children: [
              TabExpenses(),
              TabRevenue(),
              TabExpenses(),
              TabRevenue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget TabRevenue() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Sales';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Commissions',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Bonus';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bonus',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Royalties';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Royalties',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Sponsorship';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sponsorship',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Interests';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Interests',
              ),
            ),
          ),
        ])));
  }

  Widget TabExpenses() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Land Preparations';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Land Preparations',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Seeds/Seedlings';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Seeds/ Seedlings',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Crop/ Animal Production';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Crop/ Animal Production',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Crop/ Animal Nutrition';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Crop/ Animal Nutrition',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Transport';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Transport',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Labour';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Labour',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Credit Cost';
                }
                return null;
              },
              // controller: firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Credit Cost',
              ),
            ),
          ),
        ])));
  }
}
