import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Partners extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnersState();
  }
}

class _PartnersState extends State<Partners> {
  late String token;
  late List partnerCategories = [];
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
            "Partners",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ListTile(
                                //snapshot.data![index]['_links']['self']['href']
                                contentPadding: const EdgeInsets.all(1.0),
                                title: Text(snapshot.data![index]['name']),
                              ),
                              Container(
                                  color: Colors.white,
                                  height: 150,
                                  child: ListView.builder(
                                    itemCount: snapshot
                                        .data![index]['partners'].length,
                                    itemBuilder:
                                        (BuildContext context, index1) => Card(
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Providerlists(
                                                                snapshot.data![
                                                                        index]
                                                                    ['name'])),
                                                  );
                                                },
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                        'https://picsum.photos/250?image=9',
                                                        width: 100,
                                                        height: 100),
                                                    Container(
                                                        width: 140,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Center(
                                                              child: Text(snapshot
                                                                              .data![
                                                                          index]
                                                                      [
                                                                      'partners']
                                                                  [
                                                                  index1]['name'])),
                                                        ))
                                                  ],
                                                ))),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics:
                                        ClampingScrollPhysics(), // todo comment this out and check the result
                                  )),
                            ]),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = PARTNERS_LIST + "$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse;
      posts = map;
      print(posts);
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
