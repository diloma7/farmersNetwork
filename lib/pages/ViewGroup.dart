import 'dart:core';

import 'package:farmers_network/pages/JoinGroup.dart';
import 'package:farmers_network/pages/Forums.dart';
import 'package:flutter/material.dart';

class ViewGroup extends StatefulWidget {
  const ViewGroup({Key? key}) : super(key: key);

  @override
  _ViewGroupState createState() => _ViewGroupState();
}

class _ViewGroupState extends State<ViewGroup> {
  String groupName = "";
  String postTitle = "";
  String description = "";
  void initState() {
    // _loadSharedData();
    // _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFBF3F7F2),
        appBar: AppBar(
          title: Text(groupName,
              style: TextStyle(fontSize: 12, color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Forums()),
              );
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: InkWell(
                    child: Text('Join',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JoinGroup()),
                      );
                    }))
          ],
          backgroundColor: Color(0xFF4b7344),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
                margin: EdgeInsets.fromLTRB(30, 8, 30, 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                // height: 30,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/whatsapp.png',
                      height: 24.0,
                      //color: Colors.green,
                      semanticLabel:
                          'Click to join the group $groupName Whatsapp',
                    ),
                    Text('Click here to join' + " " + groupName)
                  ],
                )),
            Container(
              decoration: BoxDecoration(color: Color(0XFFFAFAFA)),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Hilda 14hr'),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text('This is where descritpion will be' + description,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Color(0xFF2A4E05),
                            ))),
                Image.network(
                    'https://i.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
                    width: double.infinity)
              ]),
            ),
            Container(
              decoration: BoxDecoration(color: Color(0XFFFAFAFA)),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Hilda 14hr'),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text('This is where descritpion will be' + description,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Color(0xFF2A4E05),
                            ))),
                Image.network(
                    'https://i.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
                    width: double.infinity)
              ]),
            )
          ])),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 50,
          width: 200,
          child: FloatingActionButton(
            // isExtended: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text('Join Network',
                style: TextStyle(fontSize: 12, color: Colors.white)),
            backgroundColor: Colors.orange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinGroup()),
              );
            },
          ),
        ));
  }
}
