import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'PartnerCategories.dart';
import 'PartnersRegistration.dart';
import 'ServiceProvidersCategories.dart';
import 'ServiceProvidersRegistration.dart';

class AdminProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminProfileState();
  }
}

class _AdminProfileState extends State<AdminProfile> {
  String _uname = '';
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _uname = (prefs.getString('uname') ?? '');
      String _fname = (prefs.getString('firstName') ?? '');
      String _mname = (prefs.getString('middleName') ?? '');
      String _lname = (prefs.getString('lastName') ?? '');
      String _token = (prefs.getString('token') ?? '');
      print("your names is" + " " + _uname + "your token is" + " " + _token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF79A544),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF79A544),
          title: Text("Admin Profile",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Poppins", fontSize: 10),
              textAlign: TextAlign.center),
        ),
        body: SafeArea(
            child: Container(
          child: Column(children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                    decoration: BoxDecoration(color: Color(0xFF99C364)),
                    child: Row(children: [
                      Flexible(
                        flex: 3,
                        child: Center(
                          child: Column(children: [
                            Expanded(
                                flex: 2,
                                child: Image.asset(
                                    'assets/images/services_providers_icon.png')),
                            Expanded(
                                flex: 1,
                                child: Text('Admin\n Allan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          ]),
                        ),
                      ),
                    ]))),

            /// am separating this

            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(color: Color(0xFF588248)),
                padding: EdgeInsets.fromLTRB(20, 15, 30, 10),
                // padding: EdgeInsets.all(10.0),
                child: Padding(
                    // Even Padding On All Sides
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Date of Birth",
                                style: TextStyle(color: Colors.white)),
                            Text("01 Jan 2021",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )),
                        new Divider(height: 2, color: Colors.white),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Telephone",
                                style: TextStyle(color: Colors.white)),
                            Text("+27 706 384625",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )),
                        new Divider(height: 2, color: Colors.white),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Email",
                                style: TextStyle(color: Colors.white)),
                            Text("info@dallanfarm.com",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )),
                        new Divider(height: 2, color: Colors.white),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                            child: Container(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                onPrimary:
                                    Colors.black, // This is what you need!
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ServiceProvidersCategories()));
                              },
                              child: Text("REGISTER SERVICE PROVIDER CATEGORY",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  )),
                            ), //Color Of Icon),,
                          ),
                        )),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                            child: Container(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                onPrimary:
                                    Colors.black, // This is what you need!
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ServiceProvidersRegistration()));
                              },
                              child: Text("REGISTER SERVICE PROVIDER",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  )),
                            ), //Color Of Icon),,
                          ),
                        )),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                            child: Container(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                onPrimary:
                                    Colors.black, // This is what you need!
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PartnerCategories()));
                              },
                              child: Text("REGISTER PARTNER CATEGORY",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  )),
                            ), //Color Of Icon),,
                          ),
                        )),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                            child: Container(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                onPrimary:
                                    Colors.black, // This is what you need!
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PartnersRegistration()));
                              },
                              child: Text("REGISTER PARTNER",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  )),
                            ), //Color Of Icon),,
                          ),
                        )),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    )), //Container
              ),
            ),
            //BottomNav()
          ]),
        )));
  }
}
