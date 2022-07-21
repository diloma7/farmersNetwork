import 'dart:convert';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/viewmodels/ServiceProfileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductDescriptionState();
  }
}

class _ProductDescriptionState extends State<ProductDescription> {
  String _uname = '';
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
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/weatherbackground.jpg',
                ),
                fit: BoxFit.fill,
              )),
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Positioned(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1000,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                        Text('one'),
                      ],
                    )),
                  ))),
            )
          ],
        ));
  }
}
