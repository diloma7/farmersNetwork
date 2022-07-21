import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/pdfs/app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Resources extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResourcesState();
  }
}

class _ResourcesState extends State<Resources> {
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
        backgroundColor: Color(0xFFFFFFFF),
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
            "Resources",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          centerTitle: true,
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
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.black,
                                                offset: Offset(0.5, 1))
                                          ]),
                                      child: Image.asset(
                                          'assets/images/whatsapp.png')),
                                  title: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.black,
                                                offset: Offset(0.5, 1))
                                          ]),
                                      child:
                                          Text(snapshot.data![index]['name'])),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => pdfA()));
                                  }),
                            ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = RESOURCES + "$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['resources'];
      posts = map;
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
