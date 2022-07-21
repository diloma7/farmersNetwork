import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api.dart';
import '../HomePage.dart';
import 'package:http/http.dart' as http;

import '../forgot_password_page.dart';
import '../registration_page.dart';

class AdjustedLogin extends StatefulWidget {
  const AdjustedLogin({Key? key}) : super(key: key);

  @override
  State<AdjustedLogin> createState() => _AdjustedLoginState();
}

class _AdjustedLoginState extends State<AdjustedLogin> {
  @override
  Key _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool isChecked = false;

  logiApi(String title, String pass) async {
    final response = await http.post(
      Uri.parse(LOGIN),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': title,
        'password': pass,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];
      prefs.setString('userData', response.body);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Check username and password"),
          action: SnackBarAction(
            label: 'Enter Again',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4B7447),
        centerTitle: true,
        title: const Text('Login',
            style: TextStyle(fontSize: 16, color: Colors.white)
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 800,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/app.jpg',
                        height: 50,
                      )
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Color(0xFF4B7447),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,20,0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children:  [
                        TextFormField(
                          style:const TextStyle(height: 1.50),
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email / Phone Number required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Color(0XF0F0F0F0),
                              filled: true,
                              labelText: 'Email / Phone Number',
                              labelStyle: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Poppins',
                                  fontSize: 12),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Color(0XFFe8e7e3)),
                              ),
                              contentPadding: EdgeInsets.all(14)
                            //isDense: true, // Added this
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style:const TextStyle(height: 1.50),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password';
                            }
                            return null;
                          },
                          obscureText: _isObscure,
                          decoration:  InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                              fillColor: const Color(0XF0F0F0F0),
                              filled: true,
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Poppins',
                                  fontSize: 12),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color:Color(0XFFe8e7e3)),
                              ),
                              contentPadding: const EdgeInsets.all(14)
                            //isDense: true, // Added this
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {});
                        },
                      ),
                      const Text("Remember Me",
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontSize: 10)),
                      const SizedBox(width: 90),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ForgotPasswordPage()),
                          );
                        },
                        child: const Text(
                          "Forgot your password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,2, 15, 3),
                  child: GestureDetector(
                    onTap: (){
                      logiApi(usernameController.text, passwordController.text);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0XFFEB8A44),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //let's create a common header widget
                    ),
                  ),
                ),
                const SizedBox(height:15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,15,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  const [
                      Expanded(
                          child: Divider(
                              thickness: 2, height: 10,endIndent: 20, color: Color(0xFF4B7447))
                      ),
                      Text('OR',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF4B7447)),),
                      Expanded(
                          child: Divider(
                              thickness: 2, height: 20, indent: 20,color: Color(0xFF4B7447))
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        //open link
                      },
                      child: SizedBox(
                        height: 37,
                        width: 149,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset('assets/images/fcbk.jpeg'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // print('Go to google');
                      },
                      child: SizedBox(
                        height: 37,
                        width: 149,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset('assets/images/google.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: <InlineSpan>[
                          const TextSpan( text: 'Don\'t you have an account? ', style: TextStyle(color: Color(0xFF4B7447), fontSize: 15)),
                          TextSpan( recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationPage())
                              );
                            }, text: 'Register', style: const TextStyle(
                            color: Color(0XFFEB8A44),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          )),
                        ]
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                Center(
                  child: RichText(
                    // textAlign: TextAlign.center,
                    text: TextSpan(children: <InlineSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             TermsPage()));
                            },
                          text: 'Terms of Use Policy About Blog Language',
                          style: const TextStyle(
                              color: Color(0xFF7c9f48),
                              fontSize: 11)),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
