import 'dart:convert';
import 'dart:core';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/models/ServiceProviderCategoryModel.dart';
import 'package:farmers_network/pages/widgets/ImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Addservices extends StatefulWidget {
  const Addservices({Key? key}) : super(key: key);

  @override
  _AddservicesState createState() => _AddservicesState();
}

class _AddservicesState extends State<Addservices> {
  //_getAddressFromLatLng();

  void initState() {
    _loadSharedData();
    getData(SERVICE_PROVIDER_CATEGORIES).whenComplete(() {
      setState(() {});
      _loadData(SERVICE_PROVIDER_CATEGORIES);
    });
    super.initState();
  }

  String _uname = '';
  String _points = '';
  String _route = '';
  Key _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String selectedServiceProviderCategory = '';
  String serviceProviderCategories = '';
  List<ServiceProviderCategoryModel> serviceProviderCategoryList = [];
  getData(String endPoint) async {
    print(endPoint);
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      setState(() {
        if (endPoint == SERVICE_PROVIDER_CATEGORIES) {
          serviceProviderCategories = response.body;
        }
      });

      //return response.body;
    } else {
      print('sifiki');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to load Service Providers!'),
          action: SnackBarAction(
            label: 'Retry Again',
            onPressed: () {
              // Code to print(partnerCategories);(partnerCategories);ute.
            },
          ),
        ),
      );
    }
  }

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
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Container(
                    child: Text(
                  'Add Services Image',
                  style: TextStyle(
                      color: Color(0xFF4b7344),
                      fontFamily: 'Poppins',
                      fontSize: 14),
                )),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PickImageScreen(),
                    PickImageScreen(),
                    PickImageScreen()
                  ],
                ),
                Container(
                    child: Text(
                  'Services Details',
                  style: TextStyle(
                      color: Color(0xFF4b7344),
                      fontFamily: 'Poppins',
                      fontSize: 14),
                )),
                getServiceProviderCategories(),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color(0xFF4B7447),
                        fontFamily: "Poppins",
                        fontSize: 10),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Services Name ';
                      }
                      return null;
                    },
                    //controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Services Name ',
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
                        return 'Please enter Services Description ';
                      }
                      return null;
                    },
                    //controller: firstnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Services Description',
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
                      labelText: 'Services Price',
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
                                    fontFamily: "Poppins",
                                    fontSize: 10))
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
          ]),
        )));
  }

  var jsonServiceProviders;
  _loadData(String endPoint) async {
    setState(() {
      if (endPoint == SERVICE_PROVIDER_CATEGORIES) {
        jsonServiceProviders = JsonDecoder().convert(serviceProviderCategories);
        serviceProviderCategoryList = (jsonServiceProviders)
            .map<ServiceProviderCategoryModel>(
                (item) => ServiceProviderCategoryModel.fromJson(item))
            .toList();
        selectedServiceProviderCategory = serviceProviderCategoryList[0].id;
      }
    });
  }

  Widget getServiceProviderCategories() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3A3B3A)),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        //underline:false,
        // Initial Valu
        isExpanded: true,
        isDense: true,
        hint: new Text("Select Service Category"),
        // value: selectedServiceProviderCategory,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        onChanged: (String? newValue) {
          setState(() {
            selectedServiceProviderCategory = newValue!;
          });
        },
        items:
            serviceProviderCategoryList.map((ServiceProviderCategoryModel map) {
          // print(map);

          return DropdownMenuItem<String>(
            value: map.id,
            child: new Text(map.name),
          );
        }).toList(),
        value: selectedServiceProviderCategory,
        // After selecting the desired option,it will
        // change button value to selected value
      )),
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
}
