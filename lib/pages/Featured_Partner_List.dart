import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/PartnerProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PartnerLists extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnerListsState();
  }
}

class _PartnerListsState extends State<PartnerLists> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
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
        backgroundColor: Color(0xFFe0ded8),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF7c9f48),
          title: Text(
            "Featured Partner List",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.menu, color: Colors.grey),
                        Expanded(
                          child: TextField(
                            // textAlign: TextAlign.center,
                            decoration: InputDecoration.collapsed(
                              hintText: ' Search Featured Partner List',
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        Icon(Icons.search, color: Colors.grey),
                        InkWell(
                          child: Icon(
                            Icons.mic,
                            color: Colors.grey,
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        padding: const EdgeInsets.all(6),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                              //snapshot.data![index]['_links']['self']['href']
                              contentPadding: const EdgeInsets.all(8),
                              leading:
                                  Image.asset('assets/images/whatsapp.png'),
                              title: Text(snapshot.data![index]['username']),
                              subtitle:
                                  Text(snapshot.data![index]['firstName']),
                              trailing: Image.asset(
                                  'assets/images/services_providers_icon.png'),
                              onTap: () => () async {
                                    //print(snapshot.data![index]['_links']['self']
                                    //    ['href']);
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('link', 'test');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PartnerProfilePage(),
                                      ),
                                    );
                                  }
                              // print(snapshot.data![index]['_links']['self']['href'])
                              ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = LISTED_PARTNER + "$token";
      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse;
      posts = map;
    } catch (err) {}
    return posts;
  }
}
