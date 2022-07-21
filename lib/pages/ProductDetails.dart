import 'dart:convert';
import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:farmers_network/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsState();
  }
}

class _ProductDetailsState extends State<ProductDetails> {
  late String token;
  //late String link;
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
        backgroundColor: Color(0xFFDADADA),
        body: SafeArea(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        child: Image.network(
                          'https://images.pexels.com/photos/11341064/pexels-photo-11341064.jpeg?cs=srgb&dl=pexels-alexey-demidov-11341064.jpg&fm=jpg',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 280,
                      child: Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                            color: Colors.green,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0))),
                      ),
                    ),
                  ],
                ))));
  }
}
