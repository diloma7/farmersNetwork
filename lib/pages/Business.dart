import 'dart:convert';
import 'package:farmers_network/apis/api.dart';

import 'package:farmers_network/viewmodels/CashFlowViewModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Business extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BusinessState();
  }
}

class _BusinessState extends State<Business> {
  late String token;
  late String id;
  String dropCategory = 'Expenses';
  var CashFlow = new CashFlowViewModel();
  final _formKey = GlobalKey<FormState>();

  // List of items in our dropdown menu
  var itemsCategory = [
    'Revenue',
    'Expenses',
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
      _loadCashFlow();
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
                Text('Expenses',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                Text('Revenue',
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
                                            InkWell(
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(Icons.add,
                                                        size: 12)),
                                                onTap: () =>
                                                    _displayDialog(context))
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
                                            InkWell(
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(Icons.add,
                                                        size: 12)),
                                                onTap: () =>
                                                    _displayDialog(context))
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
          ListView.builder(
              padding: const EdgeInsets.all(6),
              shrinkWrap: true,
              itemCount: cashFlow.populateData('ExpenditureActual')!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) => Container(
                  width: 150,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cashFlow
                                          .populateData(
                                              'ExpenditureActual')[index]
                                          .elementAt(0),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      cashFlow
                                          .populateData(
                                              'ExpenditureActual')[index]
                                          .elementAt(3)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: cashFlow
                                                            .populateData('ExpenditureActual')[
                                                                index]
                                                            .elementAt(3) ==
                                                        0 ||
                                                    cashFlow
                                                            .populateData('BudgetExpenditure')[
                                                                index]
                                                            .elementAt(3) ==
                                                        0
                                                ? 0.0
                                                : (cashFlow
                                                        .populateData('ExpenditureActual')[
                                                            index]
                                                        .elementAt(3) /
                                                    cashFlow
                                                        .populateData(
                                                            'BudgetExpenditure')[index]
                                                        .elementAt(3)),
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))
                                ],
                              )
                            ],
                          )))))
        ])));
  }

  _displayDialog(BuildContext context) async {
    // print(jsonObj);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(top: 10.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Financial Records',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.green)),
                        child: Icon(
                          Icons.close,
                          size: 18.0,
                        )),
                  )
                ],
              ),
              content: Container(
                  width: 200,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF4B7447)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Transport';
                                  }
                                  return null;
                                },
                                // controller: firstnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF4B7447)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  return null;
                                },
                                // controller: firstnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF4B7447)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  return null;
                                },
                                // controller: firstnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF4B7447)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  return null;
                                },
                                // controller: firstnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF4B7447)),
                                // controller: lastnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name',
                                ),
                              ),
                            ),
                            //partners dropdown

                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: TextFormField(
                                // controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                            Container(
                                margin:
                                    EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                                child: Row(children: <Widget>[
                                  Expanded(child: Divider(color: Colors.green)),
                                  Text("OR",
                                      style: TextStyle(color: Colors.green)),
                                  Expanded(child: Divider(color: Colors.green)),
                                ])),
                          ])),
                    ],
                  )));
        });
  }

  var cashFlow = CashFlowViewModel();
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
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            InkWell(
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(Icons.add,
                                                        size: 12)),
                                                onTap: () =>
                                                    _displayDialog(context))
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
                                            InkWell(
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Icon(Icons.add,
                                                        size: 12)),
                                                onTap: () =>
                                                    _displayDialog(context))
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
          ListView.builder(
              padding: const EdgeInsets.all(6),
              shrinkWrap: true,
              itemCount: cashFlow.populateData('BudgetExpenditure')!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) => Container(
                  width: 150,
                  child: InkWell(
                      onTap: () {},
                      child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cashFlow
                                          .populateData(
                                              'BudgetExpenditure')[index]
                                          .elementAt(0),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      cashFlow
                                          .populateData(
                                              'BudgetExpenditure')[index]
                                          .elementAt(3)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: LinearProgressIndicator(
                                            backgroundColor: Colors.orange,
                                            value: 0.8,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.green),
                                          )))
                                ],
                              )
                            ],
                          )))))
        ])));
  }

  Future<List> _loadCashFlow() async {
    List cashflowData = [];
    try {
      String endPoint;
      endPoint = bulkFetch + id + "/cashFlows?token=$token";
      //print(endPoint);
      final http.Response response = await http.get(Uri.parse(endPoint));
      cashflowData = json.decode(response.body);
      //print(json.encode(cashflowData));
    } catch (err) {
      //print(err);
    }
    return cashflowData;
  }
}
