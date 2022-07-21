import 'dart:convert';

import 'package:farmers_network/pages/widgets/BottomNav.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rewards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RewardsState();
  }
}

late int _points;

class _RewardsState extends State<Rewards> {
  @override
  void initState() {
    super.initState();
    _loadSharedData();
  }

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _points = jsonResponse['points'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF7c9f48),
          title: Text(
            "",
            style: TextStyle(color: Colors.yellow, fontSize: 12),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Color(0Xff618c2a),
                    border: Border.all(color: Color(0Xff618c2a), width: 1),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: Text(
                    "You have earned $_points points. you can reedem the points for 25kg DAP fertilizer",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      //color: Color(0Xff618c2a),
                      child: Center(
                          child: Text(
                        'UPDATE',
                        style: TextStyle(color: Colors.yellow, fontSize: 15),
                        textAlign: TextAlign.center,
                      )),
                    )),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: <Widget>[
              //Flexible
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(34.0, 10.0, 36.0, 1.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        onPrimary: Colors.black, //\nThis is what you need!
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Rewards()));
                        //call
                        //\nlogiApi(_ucontroller.text,_pscontroller.text);
                        //After successful login we will redirect to profile page. Let's create profile page now
                        //\nprint(logiApi);
                      },
                      child: Text("REDEEM NOW"),
                    ), //Color Of Icon),,
                  ), //BoxDecoration
                ), //Container
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),

                  child: Padding(
                      //\nEven Padding On All Sides
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/ProfileHolder.png'),
                              Text(
                                  "Redeem points for seeds\n from listed verified \n vendors",
                                  style: TextStyle(color: Colors.green))
                            ],
                          )),
                          new Divider(height: 2, color: Colors.green),
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/ProfileHolder.png'),
                              Text(
                                  "Redeem points for seeds\n from listed verified \n vendors",
                                  style: TextStyle(color: Colors.green))
                            ],
                          )),
                          new Divider(height: 2, color: Colors.green),
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/ProfileHolder.png'),
                              Text(
                                  "Redeem points for seeds\n from listed verified \n vendors",
                                  style: TextStyle(color: Colors.green))
                            ],
                          )),
                          new Divider(height: 2, color: Colors.green),
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset('assets/images/ProfileHolder.png'),
                              Text(
                                  "Redeem points for seeds\n from listed verified \n vendors",
                                  style: TextStyle(color: Colors.green))
                            ],
                          )),
                          new Divider(height: 2, color: Colors.green),
                          SizedBox(
                            height: 2,
                          ),
                        ],
                      )), //Container
                ),
              ),
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    child: Image.asset('assets/images/loyalty.png'),
                  )),

              BottomNav()
            ]), //Column
          ) //Padding
              ), //Container
        ) //Container
        );
  }
}
