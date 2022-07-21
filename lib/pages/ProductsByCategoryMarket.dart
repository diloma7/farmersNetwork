import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/MarketList.dart';
import 'package:farmers_network/viewmodels/ServiceProfileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductsByCategoryMarket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductsByCategoryMarketState();
  }
}

class _ProductsByCategoryMarketState extends State<ProductsByCategoryMarket> {
  late String _uname;
  late String token;

  var providerDetails = ServiceProfileViewModel();
  void initState() {
    super.initState();
    _loadSharedData();
  }

//tabs

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      token = jsonResponse['token'];
      _uname = jsonResponse['firstName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          title: Center(
              child: Text(_uname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4b7344)))),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined,
                color: Color(0xFF4b7344)),
          ),
          backgroundColor: Color(0xFFf7f8fa),
          elevation: 0,
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(children: [_tabSection()]),
        )));
  }

  Widget _tabSection() {
    return DefaultTabController(
        length: 2,
        child: SizedBox(
          height: 100.0,
          child: Column(
            children: <Widget>[
              Container(child: Text('test')),
              TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "tab1",
                  ),
                  Tab(
                    text: "tab2",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
