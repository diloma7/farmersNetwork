import 'dart:async';

import 'package:farmers_network/pages/AdjustedPages/AdjustedLanding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Landing.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) {
          return  AdjustedLandingPage()/*LandingPage()*/;
        }));
        //Navigator.push(context,LoginPage(),(route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF8EBA43), Color(0xFF4B7447)],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.6, 0.6),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Column(
          children: [
            Flexible(
                flex: 20,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                )),
            Flexible(
                flex: 25,
                fit: FlexFit.tight,
                child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                            //size: Size.fromRadius(48),
                            child: Image.asset('assets/images/dlogo.png',
                                fit: BoxFit.cover))))),
            Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                )),
            Flexible(
                flex: 30,
                fit: FlexFit.tight,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Column(children: [
                      Text(
                        'FARMERS',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 36,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'NETWORKS',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            color: Colors.white),
                      ),
                    ]))),
            Flexible(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
                    child: Divider(
                      color: Colors.yellow,
                      height: 36,
                    ))),
            Flexible(
                flex: 10,
                fit: FlexFit.tight,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text(
                      'LOADING',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ))),
            Flexible(
                flex: 15,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                )),
            Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text(
                      'Powered by InfoAge Solutions',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ))),
          ],
        ));
  }
}
