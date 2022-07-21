import 'dart:convert';
import 'dart:core';
import 'package:farmers_network/pages/widgets/ImageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  //_getAddressFromLatLng();

  void initState() {
    _loadSharedData();
    super.initState();
  }

  String _uname = '';
  String _points = '';
  String _route = '';
  bool isChecked = false;
  List<String> _category = [
    'Please choose a Category',
    'Livestock',
    'Poultry',
    'Diary',
    'Crops'
  ];
  String _selectedCategory = 'Please choose a Category';
  Key _formKey = GlobalKey<FormState>();

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              child: Image.asset(
                                'assets/images/login.png',
                                height: 50,
                              ))),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                              child: Image.asset(
                                'assets/images/login.png',
                                height: 50,
                              )))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Container(
                        child: Text(
                      'Add Product Image',
                      style: TextStyle(
                          color: Color(0xFF4b7344),
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    )),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PickImageScreen(),
                            // PickImageScreen(),
                            // PickImageScreen()
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                        child: Text(
                      'Product Details',
                      style: TextStyle(
                          color: Color(0xFF4b7344),
                          fontFamily: 'Poppins',
                          fontSize: 15,
                      fontWeight: FontWeight.w800),
                    )),
                  ),
                      SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        width: 400,
                          decoration: BoxDecoration(
                            // color: Colors.black
                            border: Border.all(color: Colors.grey,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                        child: DropdownButton(
                          value: _selectedCategory,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: _category.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCategory = newValue!;
                            });
                          },
                        ),

                      ),
                    ),

                      SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      style: TextStyle(
                        color: Color(0xFF4B7447),
                        fontFamily: "Poppins",
                        fontSize: 10,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      //controller: firstnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product Category',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color(0xFF4B7447),
                          fontFamily: "Poppins",
                          fontSize: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Product Name ';
                        }
                        return null;
                      },
                      //controller: firstnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product Name ',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      maxLines: 3,
                      style: TextStyle(
                          color: Color(0xFF4B7447),
                          fontFamily: "Poppins",
                          fontSize: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Product Description ';
                        }
                        return null;
                      },
                      //controller: firstnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product Description',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      //keyboardType:,
                      style: TextStyle(
                          color: Color(0xFF4B7447),
                          fontFamily: "Poppins",
                          fontSize: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Price';
                        }
                        return null;
                      },
                      //controller: firstnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Product Price',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color(0xFF4B7447),
                          fontFamily: "Poppins",
                          fontSize: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Delivery Method';
                        }
                        return null;
                      },
                      //controller: firstnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Delivery Method',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Color(0xFF4B7447),
                          fontFamily: "Poppins",
                          fontSize: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Payment Method';
                        }
                        return null;
                      },
                      //controller: firstnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Payment Method',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {});
                                },
                              ),
                              Text("Sold even to International Clients",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontFamily: "Poppins"))
                            ]),
                      ],
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
                        child: Text("Save",
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 10)),
                      ), //Color Of Icon),,
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        )));
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
}
