import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/ProvidersProducts.dart';
import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:farmers_network/viewmodels/ServiceProfileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FarmProfilePageState();
  }
}

class _FarmProfilePageState extends State<FarmProfilePage> {
  String _uname = '';
  String token = '';
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
      _uname = jsonResponse['firstName'];
      token = jsonResponse['token'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFDADADA),
        appBar: AppBar(
          title: Text(providerDetails.profileName,
              style: TextStyle(fontSize: 12, color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          backgroundColor: Color(0xFF4b7344),
          elevation: 0,
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(children: [
            Container(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset('assets/images/logo.png'))),
            Container(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(children: [
                      Text(providerDetails.website),
                      Row(children: [
                        Icon(
                          Icons.location_pin,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(providerDetails.geoLocation)
                      ]),
                      //rate
                      Row(children: [
                        for (var i = 0; i < 4; i++)
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.orange,
                          ),
                        for (var i = 0; i < 1; i++)
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.grey,
                          ),
                      ])
                    ]))),

            Container(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.facebook),
                            onPressed: () {
                              print("Pressed");
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.googlePlus),
                            onPressed: () {
                              print("Pressed");
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            onPressed: () {
                              print("Pressed");
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.phone),
                            onPressed: () {
                              print("Pressed");
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.whatsapp),
                            onPressed: () {
                              print("Pressed");
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ))),
            Card(
                child: Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Row(children: [
                      Column(
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.tractor),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text('Orders'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.facebookMessenger),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text('Chats'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: Icon(
                                Icons.groups,
                                size: 24,
                              ),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text('Groups'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.barcode),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text('Business Card'),
                          ),
                        ],
                      )
                    ]))),
            Container(
              child: Column(
                children: [
                  Text('About',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green)),
                  Text(providerDetails.aboutServiceProvider)
                ],
              ),
            ),
            Divider(height: 2),
            Row(children: [
              Text('Dallan Entreprise'),
              InkWell(
                  child: Text('See All',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.green)))
            ]),
            tabServices(),

            //BottomNav()
          ]),
        )));
  }

  Widget tabServices() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            child: Column(children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: Container(height: 70, child: Card())),
                FutureBuilder(
                    future: _loadData(),
                    builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                        snapshot.hasData
                            ? GridView.builder(
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 6 / 3),
                                itemBuilder: (BuildContext context, index) =>
                                    SizedBox(
                                      child: Container(
                                          margin: const EdgeInsets.all(10),
                                          color: Colors.white,
                                          child: Column(children: [
                                            Container(
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
                                            Container(
                                                child: Text(
                                                    snapshot.data![index]
                                                        ['name'],
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        color: Colors.green))),
                                            //quantity
                                            Container(
                                                child: Text(
                                                    snapshot.data![index]
                                                        ['name'],
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        color: Colors.green))),
                                            Container(
                                                child: Row(children: [
                                              Text(
                                                snapshot.data![index]['name'],
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 10,
                                                    color: Colors.green),
                                              ),
                                              IconButton(
                                                  // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    print("Pressed");
                                                  }),
                                            ]))
                                            //=> print(snapshot.data![index]['_links']['self']['href'])
                                          ])),
                                    ))
                            : Center(
                                child: CircularProgressIndicator(),
                              ))
              ]),
        ])));
  }

  Future<List> _loadData() async {
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
