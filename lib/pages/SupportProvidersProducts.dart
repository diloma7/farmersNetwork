import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SupportProvidersProducts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SupportProvidersProductsState();
  }
}

class _SupportProvidersProductsState extends State<SupportProvidersProducts> {
  late String token;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
            ),
            backgroundColor: Color(0xFF4b7344),
            bottom: const TabBar(
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              tabs: [
                Text('Revenue',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                Text('Expenses',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
            title: Container(
                child: Row(
              //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 50,
                    )),
              ],
            )),
            elevation: 0,
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

  Widget TabRevenue() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 70,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Plan",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green)),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child:
                                                    Icon(Icons.add, size: 12))
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("\$3000",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                      ))),
                            ],
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 70,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Actual",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child:
                                                    Icon(Icons.add, size: 12))
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("\$4000",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ))),
                            ],
                          ),
                        )))
              ]),
          Container(
              padding: EdgeInsets.all(8),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Expenses",
                          style: TextStyle(
                              fontSize: 10, color: Colors.lightGreen)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit,
                            size: 12, color: Colors.lightGreen))
                  ])),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Sales",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$200",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.8,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Commisions",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$800",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.7,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Bonus",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$1000",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.7,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Royalties",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$250",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.92,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Sponsorship",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$1500",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.5,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Interests",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.orange)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$250",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.78,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
        ])));
  }

  Widget TabExpenses() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 70,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Plan",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child:
                                                    Icon(Icons.add, size: 12))
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("\$2615",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ))),
                            ],
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 70,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Actual",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child:
                                                    Icon(Icons.add, size: 12))
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("\$1125",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ))),
                            ],
                          ),
                        )))
              ]),
          Container(
              padding: EdgeInsets.all(8),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Expenses",
                          style: TextStyle(
                              fontSize: 10, color: Colors.lightGreen)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit,
                            size: 12, color: Colors.lightGreen))
                  ])),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Land Preparations",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$140",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.68,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Seeds",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$100",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.58,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  "Crop/Animal Production",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$180",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.85,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  "Crop/Animal Nutrition",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$120",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.72,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Transport",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$125",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.62,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Labour",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$150",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.62,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Credit Cost",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.green)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("\$150",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.lightGreen)),
                                            )
                                          ]))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 1,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.orange),
                                          )))),
                            ],
                          ),
                        ))),
              ]),
        ])));
  }
}
