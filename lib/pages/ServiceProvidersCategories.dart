import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ServiceProvidersCategories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceProvidersCategoriesState();
  }
}

class _ServiceProvidersCategoriesState extends State<ServiceProvidersCategories> {
  @override
  void initState() {
    super.initState();
    _loadSharedData();
  }
  final _formKey = GlobalKey<FormState>();
  late String token;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data=prefs.getString('userData');
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
                flex: 4,
                child:Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Text(
                            "REGISTER SERVICE PROVIDER CATEGORY"
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          controller:nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Category Name',
                          ),
                        ),
                      ),
                      SizedBox(width:20),
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
                        child: Row(mainAxisAlignment:MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex:1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  onPrimary:
                                  Colors.black, // This is what you need!
                                ),
                                onPressed: () {
                                },
                                child: Text("Cancel"),
                              ), //Color Of Icon),,
                            ),
                            SizedBox(width:50),
                            Flexible(
                              flex:1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow,
                                  onPrimary:
                                  Colors.black, // This is what you need!
                                ),
                                onPressed: () {
                                  registerServiceProviderCategory(nameController.text,descController.text);
                                },
                                child: Text("Submit"),
                              ), //Color Of Icon),,
                            )
                          ],
                        ),
                      ),
                      //partners dropdown
                    ]
                    ) //Row
                )), //Expanded
//Expanded
          ]), //Column
        ) //Padding
      //Container

    );
  }
  registerServiceProviderCategory(String title, String desc) async {
    final response = await http.post(
        Uri.parse(SERVICE_PROVIDERS_REGISTRATION),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'name': title,
          'description': desc,
        })
    );
    if (response.statusCode == 201) {
      clearFields();
      print(response.statusCode);
    }
    else{
      print(response.statusCode);
    }
  }
  clearFields()
  {
    nameController.text ="";
    descController.text="";
  }
}
