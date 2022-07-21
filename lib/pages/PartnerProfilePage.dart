import 'dart:convert';
import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PartnerProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnerProfilePageState();
  }
}

class _PartnerProfilePageState extends State<PartnerProfilePage> {
  @override
  String _uname = '';

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
    });
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
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
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF6D9845), Color(0xFF4B7447)],
                    begin: const FractionalOffset(0.5, 0.0),
                    end: const FractionalOffset(0.6, 0.6),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  child: AdWidget(),
                ),
                Container(
                    child: Stack(children: <Widget>[
                  Card(
                      child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                      border: Border.all(color: Color(0XFFFFFFFF), width: 1),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(flex: 8, child: Text('')),
                          Expanded(
                              flex: 2,
                              child: RatingBarIndicator(
                                rating: 5,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 10.0,
                                direction: Axis.horizontal,
                              )),
                        ]),
                        Row(children: [
                          SizedBox(width: 88),
                          Expanded(
                              flex: 8,
                              child: Text('Infoage Solutions',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)))
                        ]),
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 8),
                          dense: true,
                          leading: Image.asset('assets/images/infoage.jpg',
                              width: 70, height: 70),
                          title: Text('Business Consultancy',
                              style: TextStyle(color: Colors.orangeAccent)),
                          subtitle: Text(
                              ' Market research, Strategy Distillation, Business Development, Sales, Marketing, Operations, Finance & Administration and Project Management'),
                        ),
                        Text('')
                      ],
                    ),
                  )),
                  Positioned(
                      left: 80,
                      bottom: 0,
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                onPrimary:
                                    Colors.black, //\nThis is what you need!
                              ),
                              onPressed: () {},
                              child: Text("GET IN TOUCH"),
                            )),
                      )),
                ])),

                Container(
                    padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                    child: Column(children: [
                      Text("About",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                      Divider(height: 10, color: Colors.white),
                      Text(
                          "We provide Business Consultancy Services to MSMEs to enable them to leverage their business potentials using digital transition infrastructure for Market research, Strategy Distillation, Business Development, Sales, Marketing, Operations, Finance & Administration and Project Management.\nBased on our experience with global brands in Consumer Goods, Food and Beverages, Technology, Agriculture, and construction, we provide MSMEs with solutions that give them the competitive edge to grow & scale their businesses\nWe are using global best practices, processes and skills gained by our experienced consultants. We localize this practice to meet consumer expectations of the growing entrepreneurs in Africa",
                          style: TextStyle(color: Colors.white, fontSize: 11)),
                      Divider(height: 10, color: Colors.white),
                    ])),
                Container(
                    child: Column(children: [
                  Text("Our Interests",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                  Divider(height: 10, color: Colors.white),
                  _clientCarasouel()
                ])),

                //BottomNav()
              ]),
            )));
  }

  Widget _clientCarasouel() {
    return Container(
        child: CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        viewportFraction: 1,
      ),
      itemCount: (imgList.length / 2).round(),
      itemBuilder: (context, index, realIdx) {
        final int first = index * 2;
        final int second = first + 1;
        return Row(
          children: [first, second].map((imageNumber) {
            return Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imgList[imageNumber],
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          }).toList(),
        );
      },
    ));
  }
}
