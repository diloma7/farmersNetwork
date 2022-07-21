import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/models/CategoryModel.dart';
import 'package:farmers_network/pages/widgets/ImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProvidersRegistration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceProvidersRegistrationState();
  }
}

class _ServiceProvidersRegistrationState
    extends State<ServiceProvidersRegistration> {
  @override
  void initState() {
    super.initState();
    _loadSharedData();
    getData1(SERVICE_PROVIDER_CATEGORIES).whenComplete(() {
      setState(() {
        _loadData1();
      });
    });
    //fetch partner categories
  }

  final _formKey = GlobalKey<FormState>();
  late String token;
  String serviceProviderCategories = '';
  List<CategoryModel> categoryModelList1 = [];
  String selectedServiceProviderCategory = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
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
        backgroundColor: Color(0xFFf5f5f5),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF588248),
          title: Text("Service Provider Registration",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: PickImageScreen(),
                )),
            //Expanded
            SizedBox(
              height: 1,
            ),

            Expanded(
                flex: 3,
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                        child: Text("REGISTER SERVICE PROVIDER CATEGORY"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: getServiceProviderCategories(),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Category Name',
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          controller: descController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(28.0, 10.0, 32.0, 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  onPrimary:
                                      Colors.black, // This is what you need!
                                ),
                                onPressed: () {},
                                child: Text("Cancel"),
                              ), //Color Of Icon),,
                            ),
                            SizedBox(width: 50),
                            Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow,
                                  onPrimary:
                                      Colors.black, // This is what you need!
                                ),
                                onPressed: () {
                                  registerServiceProviderCategory(
                                      nameController.text, descController.text);
                                },
                                child: Text("Submit"),
                              ), //Color Of Icon),,
                            )
                          ],
                        ),
                      ),
                      //partners dropdown
                    ]) //Row
                    )), //Expanded
//Expanded
          ]), //Column
        ) //Padding
        //Container

        );
  }

  registerServiceProviderCategory(String title, String desc) async {
    String endPoint = SERVICE_PROVIDERS_REGISTRATION +
        "/$selectedServiceProviderCategory/serviceProviders";
    List<int> imageBytes = imgFile!.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);
    final response = await http.post(Uri.parse(endPoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'name': title,
          'description': desc,
          'image': baseimage,
        }));
    if (response.statusCode == 200) {
      clearFields();
      print(response.statusCode);
    } else {
      descController.text = response.statusCode as String;
    }
  }

  clearFields() {
    nameController.text = "";
    descController.text = "";
  }

  getData1(String endPoint) async {
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      setState(() {
        serviceProviderCategories = response.body;
      });
    } else {
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

  var jsonServiceProviders;
  _loadData1() async {
    setState(() {
      jsonServiceProviders = JsonDecoder().convert(serviceProviderCategories);
      categoryModelList1 = (jsonServiceProviders)
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();
      selectedServiceProviderCategory = categoryModelList1[0].id;
    });
  }

  Widget getServiceProviderCategories() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
        hint: new Text("Select service provider category"),
        // value: selectedServiceProviderCategory,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        onChanged: (String? newValue) {
          setState(() {
            selectedServiceProviderCategory = newValue!;
          });
        },
        items: categoryModelList1.map((CategoryModel map) {
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
}
