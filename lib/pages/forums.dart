import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/HomePage.dart';

import 'package:farmers_network/pages/ViewGroup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'forum_comments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Forums extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForumsState();
  }
}

class _ForumsState extends State<Forums> {
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
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Color(0xFF4b7344),
              // set your color
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            icon: Icon(Icons.keyboard_arrow_left_outlined,
                                color: Color(0xFF4b7344)),
                          ),
                          Text(
                            "Communities",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ), // set an icon or image
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search Groups...',
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontFamily: 'Poppins'),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // set your search bar setting
                    ],
                  )),
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("ads banner")),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                        child: SizedBox(
                          height: 22,
                          child: Text(
                            'Join Groups',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Color(0xFF2A4E05),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                        child: SizedBox(
                            height: 22,
                            child: InkWell(
                              child: Text(
                                'View All',
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
                      builder: (BuildContext ctx,
                              AsyncSnapshot<List> snapshot) =>
                          snapshot.hasData
                              ? Container(
                                  height: 180,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(6),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context,
                                            index) =>
                                        Container(
                                            width: 150,
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewGroup()),
                                                  );
                                                },
                                                child: Card(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      children: [
                                                        Image.memory(
                                                            base64.decode(
                                                                defaultImage)),
                                                        Text(
                                                            snapshot
                                                                .data![index]
                                                                    ['title']
                                                                .toLowerCase(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .green,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text(
                                                            '30k Members'
                                                                .toLowerCase(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                height: 1.2,
                                                                color: Colors
                                                                    .green,
                                                                fontFamily:
                                                                    'Poppins')),
                                                        InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        JoinForums(snapshot.data![index]['_links']['self']
                                                                            [
                                                                            'href']),
                                                                  ));
                                                            },
                                                            child: Text('Join',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    height: 1.2,
                                                                    color: Colors
                                                                        .orange,
                                                                    fontFamily:
                                                                        'Poppins')))
                                                      ],
                                                    )))),
                                  ))
                              : Center(
                                  child: CircularProgressIndicator(),
                                )),
                  FutureBuilder(
                      future: _loadAllComments(),
                      builder: (BuildContext ctx,
                              AsyncSnapshot<List> snapshot) =>
                          snapshot.hasData
                              ? Container(
                                  height: 180,
                                  child: ListView.builder(
                                      padding: const EdgeInsets.all(6),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (BuildContext context,
                                              index) =>
                                          Container(
                                            width: 150,
                                            child: Column(children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 12, 0, 0),
                                                      child: SizedBox(
                                                        height: 22,
                                                        child: Text(
                                                          snapshot.data![index]
                                                              ['text'],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xFF2A4E05),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                        child: Text('Join',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                height: 1.2,
                                                                color: Colors
                                                                    .orange,
                                                                fontFamily:
                                                                    'Poppins'))),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8, 0, 8, 0),
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.close,
                                                        ),
                                                        iconSize: 10,
                                                        color: Colors.green,
                                                        splashColor:
                                                            Colors.purple,
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Hilda 14hr',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        height: 1.2,
                                                        color: Colors.orange,
                                                        fontFamily: 'Poppins')),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    snapshot.data![index]
                                                            ['text']
                                                        .toLowerCase(),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.green,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Image.memory(
                                                  base64.decode(defaultImage))
                                            ]),
                                          )))
                              : Center(
                                  child: CircularProgressIndicator(),
                                )),
                ]))));
  }

  JoinForums(String link) async {
    final response = await http.post(Uri.parse(VERIFY),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{}));
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
      // print(posts);
    } catch (err) {
      //print(err);
    }
    return posts;
  }

  Future<List> _loadAllComments() async {
    List posting = [];
    try {
      String endPoint;
      endPoint = FORUM_COMMENTS + "$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['forumComments'];
      posting = map;
      print(posting[0]);
      // print(posts);
    } catch (err) {
      //print(err);
    }
    return posting;
  }
}
