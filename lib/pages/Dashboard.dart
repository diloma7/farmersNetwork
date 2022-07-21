import 'dart:convert';
import 'dart:core';
import 'package:farmers_network/apis/weatherApi.dart';

import 'package:farmers_network/pages/Business.dart';
import 'package:farmers_network/pages/CashFlowPage.dart';
import 'package:farmers_network/pages/Market.dart';
import 'package:farmers_network/pages/forums.dart';
import 'package:farmers_network/pages/partners.dart';
import 'package:farmers_network/pages/pdfs/app.dart';
import 'package:farmers_network/pages/resources.dart';
import 'package:farmers_network/pages/FarmSupportProviders.dart';

import 'package:farmers_network/pages/weather.dart';
import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:farmers_network/viewmodels/ModelViewUser.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var loc;
  var personalData = ModelViewUser();
  var today = {};
  var _uname;
  late String _currentLat;
  late String _currentlong;
  late VideoPlayerController controller; // used to controller videos
  late Future<void> futureController;
  //_getAddressFromLatLng();

  void initState() {
    // _loadSharedData();
    controller = VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4");
    futureController = controller.initialize();
    controller.setLooping(
        true); // this will keep video looping active, means video will keep on playing
    controller.setVolume(25.0);
    _getCurrentLocation().whenComplete(() {
      setState(() {});
    });
    // _getCurrentLocation();
    super.initState();
  }

  Key _formKey = GlobalKey<FormState>();
  var timezone = '';
  var humidity;
  var temp;
  var dayofWeek;
  var dateinfo;
  var datax;
  var zone;

  int _points = 0;
  String _route = '';

  List weather = [];

  _getCurrentLocation() async {
    _loadSharedData();
    final response =
        await http.get(Uri.parse("https://ipinfo.io/?token=142ece6d9cb1c6"));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(response.body);
      //print(jsonResponse["city"]);
      final splitted = jsonResponse["loc"].split(',');
      final lat = splitted[0];
      final long = splitted[1];
      setState(() {
        _currentLat = lat;
        _currentlong = long;
        zone = jsonResponse["timezone"].split('/');
        zone = zone[1];
        getLocationData();
      });
    } else {}
  }

  @override
  void dispose() {
    controller.dispose(); // when app is been closed destroyed the controller
    super.dispose();
  }

  getLocationData() async {
    // PermissionStatus permission = await LocationPermissions().requestPermissions();
    var result = await Api().getWeather(_currentLat.toString(),
        _currentlong.toString(), 'hourly,minutely', 'metric');
    var body = json.decode(result.body);
    //print(result);
    //print(body);
    setState(() {
      timezone = body['timezone'];
      today = body['current'];
      weather = body['daily'];
    });
    var d = today['dt'];
    //print(d);
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(d * 1000);
    dayofWeek = DateFormat('EEEE').format(date);
    dateinfo = DateFormat('d MMM y').format(date);
  }

  getDay(d) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(d * 1000);
    return DateFormat('EEEE').format(date);
  }

  var icons;
  double currentTemp = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          toolbarHeight: 120,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Color(0xFF4b7344), // set your color
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              child: Image.asset(
                                'assets/images/login.png',
                                height: 50,
                              )
                          )
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Icon(Icons.notifications,
                              size: 20, color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                          child: Text("Hello" + " " + _uname,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Poppins",
                                  color: Colors.white))),
                      // set an icon or image
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: ElevatedButton.icon(
                              label: Text('Download',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Poppins",
                                      color: Colors.white)),
                              icon: Icon(Icons.download,
                                  size: 18, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => pdfA()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4b7344),
                                  side: BorderSide(
                                    width: 1.0,
                                    color: Colors.white,
                                  ))))
                    ],
                  ), // set your search bar setting
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 4, 4, 2),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          'News Updates',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2A4E05),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    height: 50, child: AdWidget()
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 2),
                      child: SizedBox(
                        height: 13,
                        child: Text(
                          'Rewards',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2A4E05),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xC7EB892E),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://picsum.photos/seed/774/600',
                                    width: 50,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'You have accumulated $_points Points.Redeem 25kg DAP Fertilizer.',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {},
                                    ),
                                    //let's create a common header widget
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/Consultant.png',
                                      height: 50,
                                    ),
                                    Text(
                                      "Business",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Business()));
                            },
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/forums.png',
                                      height: 50,
                                    ),
                                    Text("Community",
                                        style: TextStyle(fontSize: 8))
                                  ],
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forums()));
                            },
                          )),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Resources()));
                              },
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/resources.png',
                                        height: 50,
                                      ),
                                      Text("Resources",
                                          style: TextStyle(fontSize: 8))
                                    ],
                                  )))),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CashFlowPage()));
                              },
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/Business.png',
                                        height: 50,
                                      ),
                                      Text("Investment",
                                          style: TextStyle(fontSize: 8))
                                    ],
                                  )))),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Market()));
                              },
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/market.png',
                                        height: 50,
                                      ),
                                      Text("Market",
                                          style: TextStyle(fontSize: 8))
                                    ],
                                  ))))
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          'Daily Report',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2A4E05),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 130,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Text(
                                "Weather",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4b7344)),
                              ),
                              InkWell(
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF7393B3),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      children: [
                                                        Text(zone.toString()),
                                                        /*Image.network(
                                                    "https://openweathermap.org/img/wn/" +
                                                        weather[0]['weather'][0]
                                                            ['icon'] +
                                                        '@2x.png',
                                                    width: 40,
                                                    height: 40,
                                                  ),*/
                                                      ],
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            today['temp'].toString() + " \u00B0",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                fontFamily:'Poppins',
                                                                color: Colors.white
                                                            )
                                                        )
                                                      ],
                                                    )),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('H :', style: TextStyle( fontSize: 10,fontFamily:'Poppins', color: Colors .white)),
                                                      SizedBox(width: 2),
                                                      Text(today['temp'].toString() +" \u00B0",//today['feels_like'].toString(),
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:'Poppins',
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white)
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('L',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Colors
                                                                  .white)),
                                                      SizedBox(width: 10),
                                                      Text(
                                                          today['feels_like']
                                                                  .toString() +
                                                              " \u00B0",
                                                          //,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                        margin: EdgeInsets.all(10))),
                                      onTap: () {
                                         Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                          builder: (context) => Weather()
                                            )
                                         );
                                },
                              )
                            ])),
                        Expanded(
                            flex: 1,
                            child: Column(
                                children: [
                              Text(
                                "Business",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4b7344)),
                              ),
                              Container(
                                  height: 100,
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text("Plan",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10)),
                                                      Text("\$2625",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10)),
                                                      Text("(34%)",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10))
                                                    ]
                                                )
                                            )
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child:
                                                        LinearProgressIndicator(
                                                      backgroundColor:
                                                          Colors.orange,
                                                      value: 0.8,
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.green),
                                                    )))),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text("Expenses",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10)),
                                                      Text("\$1125",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10)),
                                                      Text("(2%)",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10))
                                                    ]))),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child:
                                                        LinearProgressIndicator(
                                                      backgroundColor:
                                                          Colors.green,
                                                      value: 0.7,
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.orange),
                                                    )))),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text("Total Revenue",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10)),
                                                      Text("\$3710",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10)),
                                                      Text("(11%)",
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 10))
                                                    ]))),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child:
                                                        LinearProgressIndicator(
                                                      backgroundColor:
                                                          Colors.green,
                                                      value: 0.87,
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.orange),
                                                    ))))
                                      ],
                                    ),
                                  )
                              )
                            ]))
                      ],
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
                          'Farmers Support Providers',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Color(0xFF2A4E05),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SizedBox(
                        height: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FarmSupportProviders()));
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                color: Color(0xFF2A4E05),
                                fontFamily: 'Poppins',
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Card(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black54.withOpacity(0.5), BlendMode.darken),
                                        image: AssetImage(
                                            'assets/images/serviceProvider.jpeg'),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(10,30,0,0),
                                      child: Text("Services Providers",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              color: Colors.white))),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FarmSupportProviders()));
                              },
                            )),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Card(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black54.withOpacity(0.5), BlendMode.darken),
                                    image: AssetImage(
                                        "assets/images/developmentPartners.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(10,30,0,0),
                                    child: Text("Development Partners",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            color: Colors.white))),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FarmSupportProviders()));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Card(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black54.withOpacity(0.5), BlendMode.darken),
                                    image:
                                        AssetImage("assets/images/offtake.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(10,30,0,0),
                                    child: Text("Offtake Partners",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            color: Colors.white))),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Partners()));
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  getVideo() {
    Column(
      children: <Widget>[
        Center(
          child: FutureBuilder(
            future: futureController,
            builder: (context, snapshot) {
              // if video to ready to play, else show a progress bar to the user
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        //button to play/pause the video
        RaisedButton(
          color: Colors.transparent,
          child:
              Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
            });
          },
        )
      ],
    );
  }

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _uname = jsonResponse['firstName'];
      _points = jsonResponse['points'];
      _route = jsonResponse['userType'];
    });
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }

    if (hour < 19) {
      return 'Good Evening';
    }
    return 'Good Night';
  }
}
