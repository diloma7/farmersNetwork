import 'dart:convert';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/RegistrationVerificationPage.dart';
import 'package:farmers_network/pages/TrackTransaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationVerification extends StatefulWidget {
  @override
  _RegistrationVerificationState createState() =>
      _RegistrationVerificationState();
}

class _RegistrationVerificationState extends State<RegistrationVerification> {
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
        automaticallyImplyLeading: false,
        title: Align(
            alignment: Alignment.center,
            child: Text('Verification',
                style: TextStyle(fontSize: 14, color: Colors.white))),
        iconTheme: IconThemeData(color: Colors.white),
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
                flex: 3,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Image.asset(
                        'assets/images/app.jpg',
                      )),
                      Center(
                          child: Container(
                              margin: EdgeInsets.all(30),
                              child: Text(
                                  'Thank you registering with Farmers Network.Please check your phone to verify your account',
                                  style: TextStyle(
                                      color: Color(0xFF4b7344),
                                      height: 1.5,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                  textAlign: TextAlign.center))),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        child: Center(
                          child: SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFB9004),
                                  onPrimary:
                                      Colors.black, // This is what you need!
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationVerificationPage()),
                                  );
                                },
                                child: Text("Verify",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
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
