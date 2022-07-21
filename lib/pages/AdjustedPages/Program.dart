import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/AdWidget.dart';

class Programs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgramsState();
  }
}

class _ProgramsState extends State<Programs> {
  late String token;
  late String id;
  String dropCategory = 'Expenses';

  // List of items in our dropdown menu
  var itemsCategory = [
    'Reward Wallet',
    'Redeem',
  ];

  String dropBudget = 'Budget';

  // List of items in our dropdown menu
  var figuresCategory = [
    'Budget',
    'Actual',
  ];
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
      token = jsonResponse['token'];
      id = jsonResponse['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          flexibleSpace: Column(
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(5,30,5,0),
               child: const TabBar(
                 indicatorColor: Color(0XFFEB8A44),
                 indicatorSize: TabBarIndicatorSize.label,
                 indicatorWeight: 3,
                 unselectedLabelColor: Colors.white,
                 tabs: [
                   Text('Reward Wallet',
                       style: TextStyle(fontSize: 18, color: Colors.green)),
                   Text('Redeem',
                       style: TextStyle(fontSize: 18, color: Colors.green)),
                 ],
               ),
             ),
           ],
         ),
          elevation: 0.1,
          ),
          body: TabBarView(
            children: [
              TabExpenses(),
              TabRevenue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget TabExpenses() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  // SizedBox(height: 20),
                  SafeArea(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                              children: <Widget>[
                             Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 20),
                                  child: Container(
                                    height: 70,
                                    child: ListTile(
                                      subtitle: const Text(
                                          'Complete your profile and earn 30 Farmers Network points',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color: Colors.green)),
                                      leading: Image.asset('assets/images/app.jpg', width: 30),
                                      // trailing:
                                    ),
                                  ),
                                ),
                              ),
                            Card(
                              elevation: 3,
                              child: Container(
                                height: 70,
                                child: ListTile(
                                  subtitle: const Text(
                                      'Shopping on the farmers network market and earn 10% off your order',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.green)),
                                  leading: Image.asset('assets/images/app.jpg', width: 30),
                                ),
                              ),
                            ),
                                SizedBox(height: 10),
                            Card(
                              elevation: 3,
                              child: Container(
                                height: 70,
                                child: ListTile(
                                  subtitle: Text(
                                      'Update your report to earn a free ticket to Nairobi International Trade Fare T&Cs Apply',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.green)),
                                  leading: Image.asset('assets/images/report.png', width: 30),
                                ),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 3,
                              child: Container(
                                height: 70,
                                child: ListTile(
                                  subtitle: Text(
                                      'Upload  and share your business card on Farmers Network to earn 10 points',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.green)),
                                  leading: Image.asset('assets/images/report.png', width: 30),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,10,155,15),
                              child: Text('What can you do with you points',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800
                                )
                              ),
                            ),
                            Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          child: Card(
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/report.png'),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text("Farm Inputs",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white))),
                                            ),
                                          ),
                                          onTap: () {},
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: Card(
                                          child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/developmentPartners.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text("Training",
                                                    style: TextStyle(
                                                        fontSize: 10, color: Colors.white))),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: Card(
                                          child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                AssetImage("assets/images/offtake.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text("Finance/Credit",
                                                    style: TextStyle(
                                                        fontSize: 10, color: Colors.white))),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          child: Card(
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/report.png'),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text("School Fees",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white))),
                                            ),
                                          ),
                                          onTap: () {},
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: Card(
                                          child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/developmentPartners.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text("Preferential Farmer",
                                                    style: TextStyle(
                                                        fontSize: 10, color: Colors.white))),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: Card(
                                          child: Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                AssetImage("assets/images/offtake.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text("Communications",
                                                    style: TextStyle(
                                                        fontSize: 10, color: Colors.white))),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 20),
                            Container(
                              child: AdWidget(),
                            )
                          ]), //Column
                          //Padding
                        ), //Container
                      ) //Container
                  ),
                 ]
            )
        )
    );
  }

  Widget TabRevenue() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(
                children: [
              // Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //           flex: 1,
              //           child: Container(
              //               height: 70,
              //               child: Card(
              //                 child: Column(
              //                   children: <Widget>[
              //                     Expanded(
              //                         flex: 1,
              //                         child: Container(
              //                             padding:
              //                             EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                             child: Row(
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                                 children: <Widget>[
              //                                   Align(
              //                                     alignment: Alignment.centerRight,
              //                                     child: Text("Plan",
              //                                         style: TextStyle(
              //                                             fontSize: 12,
              //                                             color: Colors.green,
              //                                             fontWeight:
              //                                             FontWeight.bold)),
              //                                   ),
              //                                   InkWell(
              //                                       child: Align(
              //                                           alignment:
              //                                           Alignment.centerRight,
              //                                           child: Icon(Icons.add,
              //                                               size: 12)),
              //                                       onTap: () =>
              //                                           _displayDialog(context))
              //                                 ]))),
              //                     Expanded(
              //                         flex: 1,
              //                         child: Container(
              //                             padding:
              //                             EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                             child: Align(
              //                               alignment: Alignment.centerRight,
              //                               child: Text("\$2615",
              //                                   style: TextStyle(
              //                                       fontSize: 14,
              //                                       color: Colors.green,
              //                                       fontWeight: FontWeight.bold)),
              //                             ))),
              //                   ],
              //                 ),
              //               ))),
              //       Expanded(
              //           flex: 1,
              //           child: Container(
              //               height: 70,
              //               child: Card(
              //                 child: Column(
              //                   children: <Widget>[
              //                     Expanded(
              //                         flex: 1,
              //                         child: Container(
              //                             padding:
              //                             EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                             child: Row(
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                                 children: <Widget>[
              //                                   Align(
              //                                     alignment: Alignment.centerRight,
              //                                     child: Text("Actual",
              //                                         style: TextStyle(
              //                                             fontSize: 12,
              //                                             color: Colors.green,
              //                                             fontWeight:
              //                                             FontWeight.bold)),
              //                                   ),
              //                                   InkWell(
              //                                       child: Align(
              //                                           alignment:
              //                                           Alignment.centerRight,
              //                                           child: Icon(Icons.add,
              //                                               size: 12)),
              //                                       onTap: () =>
              //                                           _displayDialog(context))
              //                                 ]))),
              //                     Expanded(
              //                         flex: 1,
              //                         child: Container(
              //                             padding:
              //                             EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                             child: Align(
              //                               alignment: Alignment.centerRight,
              //                               child: Text("\$1125",
              //                                   style: TextStyle(
              //                                       fontSize: 12,
              //                                       color: Colors.green,
              //                                       fontWeight: FontWeight.bold)),
              //                             ))),
              //                   ],
              //                 ),
              //               )))
              //     ]),
              Container(
                  padding: EdgeInsets.all(8),
                  child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Redeem coupons",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF4B7447)
                              ,fontWeight: FontWeight.w800)
                        ),
                  ),
            ),
              SizedBox(height: 20,),
              Container(child: AdWidget(),)]
          )
       )
    );
  }


}
