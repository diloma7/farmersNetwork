import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../registration_page.dart';
import 'AdjustedLogin.dart';

class AdjustedLandingPage extends StatefulWidget {
  const AdjustedLandingPage({Key? key}) : super(key: key);

  @override
  State<AdjustedLandingPage> createState() => _AdjustedLandingPageState();
}

class _AdjustedLandingPageState extends State<AdjustedLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xFF7c9f48),
      body: SingleChildScrollView(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 1,
            height: 100.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                    Colors.black54.withOpacity(0.6), BlendMode.dstATop),
                image: const AssetImage('assets/images/background.jpeg'),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 273),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: SizedBox(
                        height: 48,
                        width: 48,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('assets/images/logo3.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                      child: Column(
                          children: const [
                            Text(  "Farmers",
                                  style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 2.5,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text( "Networks",
                              style: TextStyle(
                                  letterSpacing: 2.5,
                                  fontSize: 18,
                                  color: Colors.white),
                            )
                          ]),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0XFFF9DC24),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      //let's create a common header widget
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdjustedLogin()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const  Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      //let's create a common header widget
                    ),
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}
