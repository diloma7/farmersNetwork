import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/register.dart';
import '../common/theme_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgot_password_verification_page.dart';
import 'package:http/http.dart' as http;
import 'widgets/header_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 50;
    return Scaffold(
        //resizeToAvoidBottomInset =false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          backgroundColor: Color(0xFF4b7344),
          title: Text(
            "Forgot Password",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
         body:SingleChildScrollView(
           child: SafeArea(
             child: Container(
               height: 800,
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Center(
                       child: Container(
                         margin: EdgeInsets.only(top: 120.0),
                         child: Text(
                           'Password Recovery',
                           style: TextStyle(
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w900,
                             color: Color(0xFF4b7344),
                             fontSize: 25.0,
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 15.0,
                     ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(10,0,10,0),
                       child: Container(
                         width: 350.0,
                         child: Text(
                           //'We have made the shopping experience easier than ever.Swipe to learn more',
                           'Enter the phone number associated with your account to reset your password.',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               fontFamily: 'Poppins',
                               color: Color(0xFF4b7344),
                               fontSize: 15.0),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 15.0,
                     ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(25,10,25,0),
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Column(
                           children: <Widget>[
                                           Form(
                                             key: _formKey,
                                             child: Column(
                                               children: <Widget>[
                                                   TextFormField(
                                                     style:const TextStyle(height: 1),
                                                     controller: emailController,
                                                     validator: (value) {
                                                       if (value == null || value.isEmpty) {
                                                         return 'Phone Number required';
                                                       }
                                                       return null;
                                                     },
                                                     decoration: const InputDecoration(
                                                         fillColor: Color(0XF0F0F0F0),
                                                         filled: true,
                                                         labelText: 'Phone Number',
                                                         labelStyle: TextStyle(
                                                             color: Colors.green,
                                                             fontFamily: 'Poppins',
                                                             fontSize: 12),
                                                         focusedBorder: OutlineInputBorder(
                                                             borderSide: BorderSide(color: Colors.green)),
                                                         enabledBorder: OutlineInputBorder(
                                                           borderSide: BorderSide(color:Color(0XFFe8e7e3))),
                                                         errorBorder: OutlineInputBorder(
                                                           borderSide: BorderSide(color:  Colors.red, width: 0.5)
                                                         )
                                                         // contentPadding: EdgeInsets.all(14)
                                                       //isDense: true, // Added this
                                                     ),
                                                   ),
                                                   // TextFormField(
                                                   //   controller: emailController,
                                                   //   style: TextStyle(
                                                   //     fontSize: 12,
                                                   //     color: Colors.green,
                                                   //   ),
                                                   //   // textAlign: TextAlign.center,
                                                   //   decoration: InputDecoration(
                                                   //     labelText: 'Enter Phone number ',
                                                   //     filled: true,
                                                   //   ),
                                                   //   validator: (val) {
                                                   //     if (val!.isEmpty) {
                                                   //       return "Phone can't be empty";
                                                   //     }
                                                   //
                                                   //     return null;
                                                   //   },
                                                   // ),

                                                 SizedBox(height: 20.0),
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                                                   child: SizedBox(
                                                     height: 50.0,
                                                     width: double.infinity,
                                                     child: ElevatedButton(
                                                       style: ElevatedButton.styleFrom(
                                                         primary: Color(0XFFEB8A44),
                                                         onPrimary:
                                                             Colors.black, // This is what you need!
                                                       ),
                                                       onPressed: () {
                                                         if (_formKey.currentState!.validate()) {
                                                           Navigator.pushReplacement(
                                                             context,
                                                             MaterialPageRoute(
                                                                 builder: (context) =>
                                                                     ForgotPasswordVerificationPage()),
                                                           );
                                                         }
                                                       },
                                                       child: Text(" Send Instructions",
                                                         textAlign: TextAlign.center,
                                                         style: TextStyle(
                                                           fontSize: 15,
                                                           fontWeight: FontWeight.bold,
                                                           color: Colors.white,
                                                         ),
                                                       ),
                                                     ), //Color Of Icon),,
                                                   ),
                                                 ),
                             // InternationalPhoneNumber(),
                           ],
                         ),
                                           )
                           ]
                         )
                       ),
                     ),

                     // Container(
                     //   height: 50,
                     //   width: 350,
                     //   child: ElevatedButton(
                     //     style: ElevatedButton.styleFrom(
                     //       primary: Colors.green[700],
                     //       onPrimary: Colors.white,
                     //     ),
                     //     child: Text(
                     //       'Send Instructions',
                     //       style: TextStyle(
                     //         fontFamily: 'Poppins',
                     //         fontSize: 16.0,
                     //         fontWeight: FontWeight.bold,
                     //         letterSpacing: 1.0,
                     //       ),
                     //     ),
                     //     onPressed: () {},
                     //   ),
                     // ),
                     SizedBox(
                       height: 10.0,
                     ),
                     Container(
                       width: 310.0,
                       child: Text(
                         //'We have made the shopping experience easier than ever.Swipe to learn more',
                         'By clicking send instructions, you will receive an SMS instructing you to reset password.',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           //fontStyle: FontStyle.normal,
                             fontFamily: 'Poppins',
                             color: Color(0xFF4b7344),
                             //fontWeight: FontWeight.w700,
                             //fontWeight: FontWeight.bold,
                             fontSize: 15.0),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
        //SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SafeArea(
        //         child: Container(
        //           margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
        //           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        //           child: Column(
        //             children: [
        //               Container(
        //                 // margin: EdgeInsets.fromLTRB(0, 70, 20, 0),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                         alignment: Alignment.centerRight,
        //                         child: Text(
        //                           'Password Recovery',
        //                           style: TextStyle(
        //                               fontSize: 16,
        //                               fontWeight: FontWeight.w900,
        //                               color: Color(0xFF4b7344)),
        //                           // textAlign: TextAlign.center,
        //                         )),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //                     Container(
        //                         alignment: Alignment.centerRight,
        //                         child: Text(
        //                           'Enter the phone number associated with your account to reset your password',
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.green),
        //                           // textAlign: TextAlign.center,
        //                         )),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               SizedBox(height: 40.0),
        //               Form(
        //                 key: _formKey,
        //                 child: Column(
        //                   children: <Widget>[
        //                     Container(
        //                       padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        //                       child: TextFormField(
        //                         controller: emailController,
        //                         style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.green,
        //                         ),
        //                         textAlign: TextAlign.center,
        //                         decoration: InputDecoration(
        //                           labelText: 'Enter Phone number ',
        //                           filled: true,
        //                         ),
        //                         validator: (val) {
        //                           if (val!.isEmpty) {
        //                             return "Phone can't be empty";
        //                           }
        //
        //                           return null;
        //                         },
        //                       ),
        //                     ),
        //                     SizedBox(height: 8.0),
        //                     Container(
        //                       margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        //                       child: SizedBox(
        //                         height: 40.0,
        //                         width: double.infinity,
        //                         child: ElevatedButton(
        //                           style: ElevatedButton.styleFrom(
        //                             primary: Colors.orangeAccent,
        //                             onPrimary:
        //                                 Colors.black, // This is what you need!
        //                           ),
        //                           onPressed: () {
        //                             if (_formKey.currentState!.validate()) {
        //                               Navigator.pushReplacement(
        //                                 context,
        //                                 MaterialPageRoute(
        //                                     builder: (context) =>
        //                                         ForgotPasswordVerificationPage()),
        //                               );
        //                             }
        //                           },
        //                           child: Text(
        //                             " Send Instructions",
        //                             textAlign: TextAlign.center,
        //                             style: TextStyle(
        //                               fontSize: 12,
        //                               fontWeight: FontWeight.bold,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                         ), //Color Of Icon),,
        //                       ),
        //                     ),
        //                     SizedBox(height: 8.0),
        //                     Container(
        //                       child: Center(
        //                           child: Text(
        //                         "By clicking send instruction, you will \nreceive an SMS instructing you reset\n your password",
        //                         textAlign: TextAlign.center,
        //                         style: TextStyle(
        //                           fontSize: 12,
        //                           color: Colors.green,
        //                         ),
        //                       )),
        //                     ),
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // )
    );
  }
}
