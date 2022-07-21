import 'dart:convert';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/TrackTransaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCompletion extends StatefulWidget {
  @override
  _OrderCompletionState createState() => _OrderCompletionState();
}

class _OrderCompletionState extends State<OrderCompletion> {
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
      backgroundColor: Color(0xFFf7f8fa),
      appBar: AppBar(
        title: Text('Order Completion',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Text('')),
            Expanded(
                flex: 1,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 60,
                          child:
                              Image.asset('assets/images/ok.png', height: 50)),

                      Container(
                          height: 60,
                          margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  'Thank you for placing your order with African Logistics',
                                  style: TextStyle(
                                      color: Color(0xFF4b7344),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          11)))), //replace African Logistics with businessname
                      Expanded(flex: 1, child: Text('')),
                      Container(
                        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        child: Center(
                          child: SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  onPrimary:
                                      Colors.black, // This is what you need!
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TrackTransaction()),
                                  );
                                },
                                child: Text("Track Order",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11)),
                              )), //Color Of Icon),,
                        ),
                      ),
                    ])),
            Expanded(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
