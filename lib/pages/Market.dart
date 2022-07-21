import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/ViewGroup.dart';
import 'package:farmers_network/pages/forum_comments.dart';
import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Market extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MarketState();
  }
}

class _MarketState extends State<Market> {
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
    return Scaffold(
        backgroundColor: Color(0xFFF4F5F1),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          backgroundColor: Color(0xFF4b7344),
          title: Text(
            "Market",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,14,0),
                    child: TextFormField(
                        style: TextStyle(
                            color: Color(0xFF4B7447),
                            height: 1.5),
                        // controller: firstnameController,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {  },),
                          contentPadding: EdgeInsets.all(14),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'search for markets',
                        ),
                      ),
                  ),
                  SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 22,
                  child: Text(
                    'Shop By Local Markets',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2A4E05),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: SizedBox(
                    height: 22,
                    child: InkWell(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Color(0xFF2A4E05),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForumsComments(
                                      link: '',
                                    )));
                      },
                    )),
              ),
            ],
          ),
          FutureBuilder(
              future: _loadData(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? Container(
                          height: 90,
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3,0,5,0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) =>
                                  Container(
                                      width: 100,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF4F5F1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewGroup()),
                                            );
                                          },
                                          child:SizedBox(
                                            width: 400,
                                              height: 100,
                                              child: InkWell(
                                                child: Image.network(
                                                  'https://i.picsum.photos/id/82/60/60.jpg?hmac=PCZU77QJ6yJuzwrtGPfYSnMRotg1y6eP9pH4sge4dNo',
                                                ),
                                              )
                                          ),
                                        /* ClipRRect(
                                              borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(10.0))
                                              child: Column(
                                                children: [

                                                ],
                                              )*/
                                          )
                                      )
                                  ),
                            ),
                          )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left:20),
                child: SizedBox(
                  height: 20,
                  child: Text(
                    'Shop By International Markets',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2A4E05),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: SizedBox(
                    height: 20,
                    child: InkWell(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Color(0xFF2A4E05),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForumsComments(
                                      link: '',
                                    )));
                      },
                    )),
              ),
            ],
          ),
          FutureBuilder(
              future: _loadData(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? Container(
                          height: 100,
                      margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3,0,5,0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) =>
                                  Container(
                                    width: 100,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewGroup()),
                                            );
                                          },
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.vertical(
                                                  top: Radius.circular(0.0)),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    child: Image.network(
                                                      'https://i.picsum.photos/id/82/60/60.jpg?hmac=PCZU77QJ6yJuzwrtGPfYSnMRotg1y6eP9pH4sge4dNo',
                                                    ),
                                                  )
                                                ],
                                              )))),
                            ),
                          ))
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 22,
                  child: Text(
                    'Discover Services',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2A4E05),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                    height: 22,
                    child: InkWell(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Color(0xFF2A4E05),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForumsComments(
                                      link: '',
                                    )));
                      },
                    )),
              ),
            ],
          ),
          FutureBuilder(
              future: _loadData(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? Container(
                          height: 170,
                          child: ListView.builder(
                            // padding: const EdgeInsets.all(5),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) =>
                                Container(
                                    width: 170,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewGroup()),
                                          );
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.fromLTRB(18,0,5,20),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF8EBA43),
                                                // Set a border for each side of the box
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(15.0))),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                    'https://i.picsum.photos/id/866/170/100.jpg?hmac=FGmQlho-OeKuryY1QzdxCPC9UmZn8w7NBizgbINwPcI'),
                                                SizedBox(height: 10),
                                                Text(
                                                    snapshot.data![index]
                                                            ['title']
                                                        /*.toLowerCase()*/,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            )))),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left:20),
                child: SizedBox(
                  height: 22,
                  child: Text(
                    'Recommended for you',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2A4E05),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0,15, 0),
                child: SizedBox(
                    height: 22,
                    child: InkWell(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Color(0xFF2A4E05),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForumsComments(
                                      link: '',
                                    )));
                      },
                    )),
              ),
            ],
          ),
          FutureBuilder(
              future: _loadData(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? Container(
                          height: 200,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(6),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) =>
                                Container(
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewGroup()),
                                          );
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                    'https://i.picsum.photos/id/866/170/100.jpg?hmac=FGmQlho-OeKuryY1QzdxCPC9UmZn8w7NBizgbINwPcI'),
                                                Text(
                                                    snapshot.data![index]
                                                            ['title']
                                                        .toLowerCase(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.green,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '30k Members'.toLowerCase(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        height: 1.2,
                                                        color: Colors.green,
                                                        fontFamily: 'Poppins')),
                                                InkWell(
                                                    child: Text('Join',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            height: 1.2,
                                                            color:
                                                                Colors.orange,
                                                            fontFamily:
                                                                'Poppins')))
                                              ],
                                            )))),
                          ))
                      : Center(
                          child: CircularProgressIndicator(),
                        )
          ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          child: AdWidget(),
                        ),
                      )
        ]
                )
            )
        )
    );
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = FORUMS + "$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['forums'];
      posts = map;
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
