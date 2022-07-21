import 'dart:convert';
import 'dart:core';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/postToEvent.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import '../pages/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
  }

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

//Navigator.of(context).pop(true)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // getServiceProviderCategories();
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
        ),
        backgroundColor: Color(0xFF4b7344),
        title:
            Text('Login', style: TextStyle(fontSize: 14, color: Colors.white)),
        elevation: 0,
      ),
      body: Container(
          child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Row(
              //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/images/app.jpg',
                      height: 50,
                    )),
              ],
            )),

        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Align(
              alignment: AlignmentDirectional(-0.75, 1),
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: Color(0xFF2A4E05),
                    ),
                  )),
            )),

        Flexible(
            flex: 8,
            child: Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              // fit: FlexFit.tight,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(30, 30, 40, 0),
                                child: TextFormField(
                                  controller: usernameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email / Phone Number required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    //set background color of the input textfield

                                    fillColor: Color(0XFFe8e7e3),
                                    filled: true,
                                    labelText: 'Email / Phone Number',
                                    labelStyle: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Poppins',
                                        fontSize: 10),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),

                                    //isDense: true, // Added this
                                  ),
                                ),
                              )),
                          Flexible(
                              flex: 3,
                              //    fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(30, 30, 40, 0),
                                  child: TextFormField(
                                      controller: passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        //set background color of the input textfield
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
                                        fillColor: Color(0XFFe8e7e3),
                                        filled: true,
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Colors.green,
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: Color(0XFFe8e7e3),
                                              width: 1.0),
                                        ),
                                      ),
                                      obscureText: _isObscure))),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: isChecked,
                                        onChanged: (value) {
                                          isChecked = !isChecked;
                                          setState(() {});
                                        },
                                      ),
                                      Text("Remember Me",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'Poppins',
                                              fontSize: 10))
                                    ]),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
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
                          )
                        ])))),

        Flexible(
          flex: 2,
          // fit: FlexFit.tight,
          child: Container(
            padding: EdgeInsets.fromLTRB(100.0, 1.0, 0.0, 0.0),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Text(
                "Forgot your password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Flexible(
            flex: 2,
            // fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.fromLTRB(43.0, 1.0, 46.0, 1.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFFF9DC24),
                    onPrimary: Colors.black,

                    // This is what you need!
                  ),
                  onPressed: () {
                    logiApi(usernameController.text, passwordController.text);
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
          flex: 3,
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                            text: 'Don\'t you have an account? ',
                            style:
                                TextStyle(color: Colors.green, fontSize: 11)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage()));
                              },
                            text: 'Register',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                            )),
                      ]),
                    )
                  ])),
        ),

        ///

        ///
        Flexible(
            flex: 2,
            //  fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            )),

        ///
      ])),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
