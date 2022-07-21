import 'dart:convert';

import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:farmers_network/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProviders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceProvidersState();
  }
}

class _ServiceProvidersState extends State<ServiceProviders> {
  late String token;
  String query = '';
  String link = '';
  TextEditingController txtSearch = TextEditingController();

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
    var searchBook;
    return Scaffold(
        backgroundColor: Color(0xFFF4F5F1),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Service Providers',
              style: TextStyle(fontSize: 15, color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          backgroundColor: Color(0xFF4b7344),
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(children: [
          Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: TextFormField(
              style: TextStyle(color: Color(0xFF4B7447), fontSize: 13),
              controller: txtSearch,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Search for service providers',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: FutureBuilder(
                      future: _loadData(),
                      builder:
                          (BuildContext ctx, AsyncSnapshot<List> snapshot) {
                        return snapshot.hasData
                            ? GridView.builder(
                                itemCount: snapshot.data?.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 6 / 3),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, index) =>
                                    SizedBox(
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        color: Colors.white,
                                        child: ListTile(
                                            //snapshot.data![index]['_links']['self']['href']
                                            /*
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SecondScreen(
                                        userName: mycontroller.text,
                                      ),
                                    ),
                                  );
                                   */
                                            //on sreen two
                                            /*

                                   class SecondScreen extends StatefulWidget {
  String userName;
  SecondScreen({
    this.userName,
  });

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

}
                                   */
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: Container(
                                                padding: EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange),
                                                child: Image(
                                                  image: Image.memory(
                                                          base64.decode(snapshot
                                                                  .data![index]
                                                              ['image']))
                                                      .image,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  width: 50,
                                                )),
                                            title: Container(
                                                child: Text(
                                                    snapshot.data![index]
                                                        ['name'],
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        color: Colors.green))),
                                            onTap: () {
                                              // print(snapshot.data![index]['_links']['self']                                ['href']);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Providerlists(snapshot
                                                                .data![index]
                                                            ['name'])),
                                              );
                                            } //=> print(snapshot.data![index]['_links']['self']['href'])
                                            ),
                                      ),
                                    ))
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      })))
        ])));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint = SERVICE_PROVIDERS;
      print(endPoint);
      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['serviceProviders'];
      posts = map;
      print(posts);
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
