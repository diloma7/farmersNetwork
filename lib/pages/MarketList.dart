import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/ProductDetails.dart';
import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MarketList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MarketListState();
  }
}

class _MarketListState extends State<MarketList> {
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
                Text('Products ',
                    style: TextStyle(fontSize: 12, color: Colors.green)),
                Text('Services',
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
              Container(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/AFarmers.jpg'),
                      fit: BoxFit.cover,
                    )),
                    child: Text("Promotion"),
                  ),
                  Expanded(
                      child: FutureBuilder(
                          future: _loadData(),
                          builder: (BuildContext ctx,
                                  AsyncSnapshot<List> snapshot) =>
                              snapshot.hasData
                                  ? GridView.builder(
                                      itemCount: snapshot.data!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,mainAxisExtent: 205,),
                                      itemBuilder:
                                          (BuildContext context, index) => Card(
                                              margin: const EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Image.memory(base64
                                                      .decode(defaultImage)),
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
                                                      '500 grams'.toLowerCase(),
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          height: 1.2,
                                                          color: Colors.green,
                                                          fontFamily:
                                                              'Poppins')),
                                                  Text('USD 60',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          height: 1.2,
                                                          color: Colors.green,
                                                          fontFamily:
                                                              'Poppins'))
                                                ],
                                              )))
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    )))
                ],
              )),
              //Products Services
              //tabProducts(),
              Container(
                  child: Column(
                children: [
                  Expanded(
                      child: FutureBuilder(
                          future: _loadData(),
                          builder: (BuildContext ctx,
                                  AsyncSnapshot<List> snapshot) =>
                              snapshot.hasData
                                  ? GridView.builder(
                                      itemCount: snapshot.data!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemBuilder: (BuildContext context,
                                              index) =>
                                          InkWell(
                                            child: Card(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Image.memory(base64
                                                        .decode(defaultImage)),
                                                    Text(
                                                        snapshot.data![index]
                                                                ['title']
                                                            .toLowerCase(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.green,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                        '500 grams'
                                                            .toLowerCase(),
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            height: 1.2,
                                                            color: Colors.green,
                                                            fontFamily:
                                                                'Poppins')),
                                                    Text('USD 60',
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            height: 1.2,
                                                            color: Colors.green,
                                                            fontFamily:
                                                                'Poppins'))
                                                  ],
                                                )),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetails()),
                                              );
                                            },
                                          ))
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    )))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = FORUMS + token;
      print(endPoint);
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

  Widget tabServices() {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: FutureBuilder(
                future: _loadData(),
                builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                    snapshot.hasData
                        ? GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, index) => Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                  //snapshot.data![index]['_links']['self']['href']
                                  contentPadding: const EdgeInsets.all(8),
                                  leading:
                                      Image.asset('assets/images/whatsapp.png'),
                                  title: Text(snapshot.data![index]['title']),
                                  subtitle: Text(
                                      snapshot.data![index]['description']),
                                  trailing: Image.asset(
                                      'assets/images/services_providers_icon.png'),
                                  onTap: () {
                                    print(snapshot.data![index]['_links']
                                        ['self']['href']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Providerlists(
                                              snapshot.data![index]['title'])),
                                    );
                                  } //=> print(snapshot.data![index]['_links']['self']['href'])
                                  ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ))));
  }
}
