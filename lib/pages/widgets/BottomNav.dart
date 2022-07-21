import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Shop.dart';
import '../Dashboard.dart';
import '../LoginPage.dart';
import '../messages.dart';
import '../reports.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardPage()));
                }, // handle your image tap here

                child: Image.asset(
                  'assets/images/home.png',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reports()));
                }, // handle your image tap here
                child: Image.asset(
                  'assets/images/reports.png',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Shop()));
                }, // handle your image tap here
                child: Image.asset(
                  'assets/images/shop.png',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Chat()));
                }, // handle your image tap here
                child: Image.asset(
                  'assets/images/chat.png',
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('userData', "");
                  print(prefs.getString('userData'));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }, // handle your image tap here
                child: Image.asset(
                  'assets/images/Settings.png',
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
