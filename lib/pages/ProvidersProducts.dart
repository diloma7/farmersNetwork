import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/ProductDetails.dart';
import 'package:farmers_network/pages/api.dart';
import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProviderProducts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProviderProductsState();
  }
}

class _ProviderProductsState extends State<ProviderProducts> {
  late String token;
  //late String link;
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
    return Scaffold(
        backgroundColor: Color(0xFFFAFFFF),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF4b7344),
          elevation: 0,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Color(0xFF4b7344),
              // set your color
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_left_outlined,
                          color: Colors.white),
                    ),
                    Text(
                      "Africana Logistics",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 10, 0),
                        child: Icon(Icons.add_shopping_cart_sharp,
                            size: 20, color: Colors.white))
                  ],
                ), // set an icon or image
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.green,
                          //labelStyle:,
                          indicatorColor: Colors.orange,
                          tabs: [
                            Tab(
                              text: 'Products',
                            ),
                            Tab(
                              text: 'Services',
                            ),
                          ],
                        ),
                        Divider(height: 2, color: Colors.grey),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(8),
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://images.pexels.com/photos/11341064/pexels-photo-11341064.jpeg?cs=srgb&dl=pexels-alexey-demidov-11341064.jpg&fm=jpg',
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Promotion',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Get 10% of all fruits orders',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                fontFamily: "Poppins",
                                                color: Colors.white),
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                      child: FutureBuilder(
                                          future: _loadData(),
                                          builder:
                                              (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                                                  snapshot.hasData
                                                      ? GridView.builder(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                  0, 10, 0, 10),
                                                          itemCount: snapshot
                                                              .data!.length,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                  mainAxisSpacing:
                                                                      10,
                                                                  crossAxisSpacing:
                                                                      10,
                                                                  crossAxisCount:
                                                                      2),
                                                          itemBuilder: (BuildContext
                                                                      context,
                                                                  index) =>
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              ProductDetails()),
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                      decoration: BoxDecoration(color: Color(0xFFEEEEff)),
                                                                      padding: EdgeInsets.all(8),
                                                                      // vertical: 5.0, horizontal: 10.0),
                                                                      child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          ClipRRect(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                              child: Image.memory(
                                                                                base64.decode(defaultImage),
                                                                              )),
                                                                          Text(
                                                                              snapshot.data![index]['title'].toLowerCase(),
                                                                              textAlign: TextAlign.left,
                                                                              style: TextStyle(fontSize: 10, height: 1.5, color: Colors.green, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                                                                          Text(
                                                                              '500 grams'.toLowerCase(),
                                                                              textAlign: TextAlign.left,
                                                                              style: TextStyle(fontSize: 10, height: 1.5, color: Colors.green, fontFamily: 'Poppins')),
                                                                          Text(
                                                                              'USD',
                                                                              style: TextStyle(fontSize: 10, height: 1.5, color: Colors.green, fontFamily: 'Poppins')),
                                                                        ],
                                                                      ))))
                                                      : Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )))
                                ],
                              ),
                              tabProducts(),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget tabProducts() {
    return Expanded(
        child: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? GridView.builder(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, index) => Container(
                            decoration: BoxDecoration(color: Color(0xFFEEEEff)),
                            padding: EdgeInsets.all(8),
                            // vertical: 5.0, horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.memory(
                                      base64.decode(defaultImage),
                                    )),
                                Text(
                                    snapshot.data![index]['title']
                                        .toLowerCase(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 10,
                                        height: 1.5,
                                        color: Colors.green,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold)),
                                Text('500 grams'.toLowerCase(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 10,
                                        height: 1.5,
                                        color: Colors.green,
                                        fontFamily: 'Poppins')),
                                Text('USD',
                                    style: TextStyle(
                                        fontSize: 10,
                                        height: 1.5,
                                        color: Colors.green,
                                        fontFamily: 'Poppins')),
                              ],
                            )))
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }

  Widget tabServices() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.pexels.com/photos/11341064/pexels-photo-11341064.jpeg?cs=srgb&dl=pexels-alexey-demidov-11341064.jpg&fm=jpg',
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Promotion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Get 10% of all fruits orders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        color: Colors.white),
                  ),
                ],
              )),
          Expanded(
              child: FutureBuilder(
                  future: _loadData(),
                  builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                      snapshot.hasData
                          ? GridView.builder(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2),
                              itemBuilder: (BuildContext context, index) =>
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEff)),
                                      padding: EdgeInsets.all(8),
                                      // vertical: 5.0, horizontal: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.memory(
                                                base64.decode(defaultImage),
                                              )),
                                          Text(
                                              snapshot.data![index]['title']
                                                  .toLowerCase(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  color: Colors.green,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.bold)),
                                          Text('500 grams'.toLowerCase(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  color: Colors.green,
                                                  fontFamily: 'Poppins')),
                                          Text('USD',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  color: Colors.green,
                                                  fontFamily: 'Poppins')),
                                        ],
                                      )))
                          : Center(
                              child: CircularProgressIndicator(),
                            )))
        ]));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = 'http://49.12.123.33:9300/api/forums?token=' + "$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['forums'];
      posts = map;
      // print(posts);
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
