import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/MarketList.dart';
import 'package:farmers_network/pages/ProvidersProducts.dart';
import 'package:farmers_network/viewmodels/ServiceProfileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceProviderProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceProviderProfilePageState();
  }
}

class _ServiceProviderProfilePageState
    extends State<ServiceProviderProfilePage> {
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
      token = jsonResponse['token'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f8fa),
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
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        backgroundImage:
                            Image.memory(base64.decode(defaultImage)).image))),
            Container(
                child: Column(children: [
              Text('Service Provider',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: Color(0xFF4b7344))),
              Text(providerDetails.website,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: Color(0xFF4b7344))),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.location_pin,
                  size: 20,
                  color: Colors.white,
                ),
                Text(providerDetails.geoLocation,
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Color(0xFF4b7344)))
              ]),
              //rate
              Container(
                  margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ]))
            ])),

            Container(
                margin: EdgeInsets.fromLTRB(60, 0, 4600, 0),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.facebook,
                            size: 14, color: Colors.blue),
                        onPressed: () {
                          print("Pressed");
                        }),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.googlePlus,
                            size: 14, color: Colors.red),
                        onPressed: () {
                          print("Pressed");
                        }),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.linkedin, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.phone,
                            size: 14, color: Colors.blue),
                        onPressed: () {
                          print("Pressed");
                        }),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.whatsapp, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                decoration: BoxDecoration(color: Colors.orange),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.facebookMessenger,
                                  size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text('Chats',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Poppins')),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: Icon(Icons.groups,
                                  size: 14, color: Colors.white),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text(
                              'Groups',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.barcode, size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                            child: Text('Business Card',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Poppins')),
                          ),
                        ],
                      )
                    ])),

            Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('About',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4b7344)))),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(providerDetails.aboutServiceProvider,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              color: Color(0xFF4b7344))),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Market Effectiveness',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4b7344))),
                    ),
                    Divider(height: 15, color: Colors.green),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(providerDetails.ratingMessage,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              color: Color(0xFF4b7344))),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('how often were you viewed among service providers?',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            color: Color(0xFF4b7344))),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Less Often',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: Color(0xFF4b7344))),
                        Text('More Often',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: Color(0xFF4b7344))),
                      ],
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.orange,
                          minHeight: 3,
                          value: 0.8,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('You Were Contacted',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: Color(0xFF4b7344)))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Less Often'),
                        Text('More Often'),
                      ],
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.orange,
                          value: 0.8,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('You Were Hired',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: Color(0xFF4b7344)))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Less Often',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: Color(0xFF4b7344))),
                        Text('More Often',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                color: Color(0xFF4b7344))),
                      ],
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.orange,
                          value: 0.8,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        )),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                          child: SizedBox(
                            height: 22,
                            child: Text(
                              'Market',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: Color(0xFF2A4E05),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProviderProducts()));
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    color: Color(0xFF2A4E05), fontSize: 9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FutureBuilder(
                            future: _loadData(),
                            builder: (BuildContext ctx,
                                    AsyncSnapshot<List> snapshot) =>
                                snapshot.hasData
                                    ? Container(
                                        height: 150,
                                        child: ListView.builder(
                                            padding: const EdgeInsets.all(6),
                                            shrinkWrap: true,
                                            itemCount: 2,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                    index) =>
                                                Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 0, 5, 0),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.42,

                                                    // vertical: 5.0, horizontal: 10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child: Image.memory(
                                                              base64.decode(
                                                                  defaultImage),
                                                            )),
                                                        Text(
                                                            snapshot
                                                                .data![index]
                                                                    ['title']
                                                                .toLowerCase(),
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .green,
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text(
                                                            '500 grams'
                                                                .toLowerCase(),
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .green,
                                                                fontFamily:
                                                                    'Poppins')),
                                                        Text('USD',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                height: 1.5,
                                                                color: Colors
                                                                    .green,
                                                                fontFamily:
                                                                    'Poppins')),
                                                      ],
                                                    ))))
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      )),
                      ],
                    )
                  ],
                )),

            //BottomNav()
          ]),
        )));
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
