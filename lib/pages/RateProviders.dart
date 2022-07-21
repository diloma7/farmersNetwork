import 'package:farmers_network/pages/widgets/BottomNav.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RateProviders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RateProvidersState();
  }
}

class _RateProvidersState extends State<RateProviders> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              color: Color(0xFF4b7344), // set your color
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              child: Image.asset(
                                'assets/images/login.png',
                                height: 50,
                              ))),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(20, 5, 10, 0),
                              child: Icon(Icons.notifications,
                                  size: 20, color: Colors.white)),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: Text('Africa\nLogistics',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      color: Colors.white)))
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                          child: Text("Rate Service Provider",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: Colors.white))),
                      // set an icon or image
                    ],
                  ), // set your search bar setting
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
                child: Column(children: [
              Text(
                'Quality:How do you rate the quality of products?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8EBA43),
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.orange,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.orange,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.orange,
                      );
                    case 3:
                      return Icon(Icons.sentiment_dissatisfied,
                          color: Colors.orange);
                    case 4:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.orange,
                      );
                    default:
                      return Container();
                  }
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ])),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(children: [
                Text(
                  'Prices :How do you rate the quality of price?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8EBA43),
                  ),
                ),
                SizedBox(height: 5),
                RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.orange,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.orange,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.orange,
                        );
                      case 3:
                        return Icon(Icons.sentiment_dissatisfied,
                            color: Colors.orange);
                      case 4:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.orange,
                        );
                      default:
                        return Container();
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ])),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(children: [
                Text(
                  'Services: How do you rate our services?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8EBA43),
                  ),
                ),
                SizedBox(height: 5),
                RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.orange,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.orange,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.orange,
                        );
                      case 3:
                        return Icon(Icons.sentiment_dissatisfied,
                            color: Colors.orange);
                      case 4:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.orange,
                        );
                      default:
                        return Container();
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ])),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(children: [
                Text(
                  'Awareness: How do you hear about us?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8EBA43),
                  ),
                ),
                SizedBox(height: 5),
                RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.orange,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.orange,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.orange,
                        );
                      case 3:
                        return Icon(Icons.sentiment_dissatisfied,
                            color: Colors.orange);
                      case 4:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.orange,
                        );
                      default:
                        return Container();
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ])),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(children: [
                Text(
                  'Overall: How do you rate us overall?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8EBA43),
                  ),
                ),
                SizedBox(height: 5),
                RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.orange,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.orange,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.orange,
                        );
                      case 3:
                        return Icon(Icons.sentiment_dissatisfied,
                            color: Colors.orange);
                      case 4:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.orange,
                        );
                      default:
                        return Container();
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ])),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(children: [
                Text(
                  'Service Providers\'s Social Media',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF4b7344),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.facebook, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.googlePlus, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.linkedin, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.phone, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.whatsapp, size: 14),
                        onPressed: () {
                          print("Pressed");
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                )
              ])),
        ])));
  }
}
