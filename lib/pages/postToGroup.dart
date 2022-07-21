import 'dart:convert';
import 'package:farmers_network/pages/HomePage.dart';

import 'package:farmers_network/viewmodels/ServiceProfileViewModel.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PostToGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostToGroupState();
  }
}

class _PostToGroupState extends State<PostToGroup> {
  String _uname = '';
  TextEditingController postController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        body: Container(
            child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Image.asset('assets/iamges/logo.png', height: 50, width: 50),
                Text(_uname)
              ],
            ),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(color: Color(0xFF4B7447)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter post';
                        }
                        return null;
                      },
                      controller: postController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Post',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.black, // This is what you need!
                        ),
                        onPressed: () {
                          _show();
                        },
                        child: Text('Add to post'),
                      ), //Color Of Icon),,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          onPrimary: Colors.black, // This is what you need!
                        ),
                        onPressed: () {
                          //call
                        },
                        child: Text('Post'),
                      ), //Color Of Icon),,
                    ),
                  ),
                ])),

            //BottomNav()
          ]),
        )));
  }

  void _show() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.6,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                            child: Divider(height: 10)),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: InkWell(
                            child: Row(children: [
                              Icon(
                                Icons.location_pin,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                'Add photo',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green),
                              )
                            ]),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: InkWell(
                            child: Row(children: [
                              Icon(
                                Icons.location_pin,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                'Take a Video',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green),
                              )
                            ]),
                          ),
                        ),
                      ]) //Row
                      ));
            }));
  }
}
