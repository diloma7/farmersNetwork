import 'dart:convert';
import 'package:farmers_network/apis/weatherApi.dart';
import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeatherState();
  }
}

class _WeatherState extends State<Weather> {
  var loc;
  var today = {};
  late String _currentLat;
  late String _currentlong;

  //_getAddressFromLatLng();

  void initState() {
    // _loadSharedData();
    _getCurrentLocation().whenComplete(() {
      setState(() {});
    });
    // _getCurrentLocation();
    super.initState();
  }

  var timezone = '';
  var humidity;
  var temp;
  var dayofWeek;
  var dateinfo;
  var datax;
  var zone;

  List weather = [];

  _getCurrentLocation() async {
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
        zone = jsonResponse["timezone"] + " " + jsonResponse["country"];
        getLocationData();
        print(splitted);
        print(jsonResponse["timezone"]);
        // _getAddressFromLatLng();
      });
    } else {}
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

  double _drawerFontSize = 17;
  var icons;
  double currentTemp = 0.0;
  @override
  Widget build(BuildContext context) {
    // _getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.menu),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              Container(
                  // color: Color(0xFF8EBA43),
                  // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_rounded, color: Colors.white),
                      Expanded(
                        child: Text(
                          zone.toString(),
                          style: TextStyle(
                              fontSize: _drawerFontSize, color: Colors.white),
                        ),
                      ),
                      Text(
                        dateinfo.toString(),
                        style: TextStyle(
                            fontSize: _drawerFontSize, color: Colors.white),
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                // color: Color(0xFF8EBA43),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ])),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$dayofWeek',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Humidity " + today['humidity'].toString() + "%",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Low',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(today['feels_like'].toString() + " \u00B0",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(
                                width: 15,
                              ),
                              Text('High',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(today['temp'].toString() + " \u00B0",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              //        SizedBox(width: 15),
                              //      Image.network(
                              //         "https://openweathermap.org/img/wn/"+today['weather'][0]['icon']+'@2x.png',
                              //   width:40,
                              //   height:40,
                              // ),
                              // SizedBox(width: 15),
                              // Text(
                              //   weather[i]['temp']['main'].toString()+ " \u00B0",
                              //   style: TextStyle(fontSize: 18, color: Colors.white),
                              // ),
                              // SizedBox(
                              //   width: 50,
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(today['feels_like'].toString() + " \u00B0",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                    )),
                  ],
                ),
              )
            ])),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  // print(getDay(weather[i]['dt']));
                  // print(weather[i]['weather'][0]['main']);
                  return Container(
                    // color: Color(0xFF8EBA43),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          getDay(weather[i]['dt']).toString(),
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                        // FaIcon(
                        //   weather[i]['weather'][0]['main'] =='Clouds' ? FontAwesomeIcons.cloudRain:FontAwesomeIcons.cloudShowersHeavy,
                        //   color: Colors.white,
                        //   size: 24,
                        // ),
                        Image.network(
                          "https://openweathermap.org/img/wn/" +
                              weather[i]['weather'][0]['icon'] +
                              '@2x.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(width: 15),
                        Text(
                          weather[i]['temp']['max'].toString() + " \u00B0",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(width: 15),
                        Text(
                          weather[i]['temp']['min'].toString() + " \u00B0",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  );
                },
                childCount: weather.length, // 1000 list items
              ),
            ),
            SliverList(delegate: SliverChildListDelegate([AdWidget()])),
          ])),
    );
  }
}
