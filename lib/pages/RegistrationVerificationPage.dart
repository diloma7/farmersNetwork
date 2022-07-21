import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../common/theme_helper.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'LoginPage.dart';

class RegistrationVerificationPage extends StatefulWidget {
  const RegistrationVerificationPage({Key? key}) : super(key: key);

  @override
  _RegistrationVerificationPageState createState() =>
      _RegistrationVerificationPageState();
}

class _RegistrationVerificationPageState
    extends State<RegistrationVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'Enter the 4 digit code sent to you ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF4b7344),
                                        height: 1.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('at ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF4b7344),
                                        height: 1.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))),
                            SizedBox(height: 30.0),
                            Container(
                                height: 50,
                                child: OTPTextField(
                                  length: 4,
                                  width: 300,
                                  fieldWidth: 50,
                                  fieldStyle: FieldStyle.box,
                                  outlineBorderRadius: 0,
                                  style: TextStyle(fontSize: 30),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  onCompleted: (pin) {
                                    setState(() {
                                      _pinSuccess = true;
                                    });
                                  },
                                )),
                            SizedBox(height: 15.0),
                            Text('Code expires in 120 sec',
                                style: TextStyle(
                                    color: Color(0xFF4b7344),
                                    height: 1.5,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            SizedBox(height: 15.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            GestureDetector(
                                child: Text(
                              'Resend Code',
                              style: TextStyle(
                                  color: Color(0xFFCC7707), fontSize: 12),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
