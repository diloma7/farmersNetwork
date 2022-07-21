import 'dart:core';
import 'package:farmers_network/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import '../pages/registration_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF7c9f48),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/landing.jpg'),
            ),
          ),
          child: Column(children: <Widget>[
            Flexible(flex: 4, fit: FlexFit.tight, child: Container()),
            Flexible(
              flex: 9,
              fit: FlexFit.tight,
              child: Text(''),
            ),
            Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Align(
                      alignment: AlignmentDirectional(-0.75, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                        child: Text(
                          'Welcome to',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFF9F9F8),
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ))),

            Flexible(
              flex: 5,
              // fit: FlexFit.tight,
              child: Container(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 0.0, 10.0),
                  alignment: Alignment.topLeft,
                  child: Center(
                      //widthFactor: 2.5,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(1.0, 5.0, 0.0, 0.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/logo.jpg',
                                height: 40,
                              ))),
                      Container(
                          padding: EdgeInsets.fromLTRB(1.0, 10.0, 0.0, 0.0),
                          child: Column(children: [
                            Text(
                              "Farmers",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Networks",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ]))
                    ],
                  ))),
            ),

            Flexible(
                flex: 3,
                // fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(43.0, 10.0, 46.0, 1.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFFF9DC24),
                        onPrimary: Colors.green,

                        // This is what you need!
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    //let's create a common header widget
                  ),
                )),

            ///
            Flexible(
                flex: 3,
                // fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(43.0, 10.0, 46.0, 1.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFFFFFFFF),
                        onPrimary: Colors.green,

                        // This is what you need!
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    //let's create a common header widget
                  ),
                )),
            Flexible(
                flex: 6,
                // fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(43.0, 10.0, 46.0, 1.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text('') //let's create a common header widget
                      ),
                )),

            ///
          ]),
        ));
  }
}
