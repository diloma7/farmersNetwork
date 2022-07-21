import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/ServicesProviders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FarmSupportProviders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FarmSupportProvidersState();
  }
}

class _FarmSupportProvidersState extends State<FarmSupportProviders> {
  late String token;
  late List partnerCategories = [];
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
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.green),
          ),
          backgroundColor: Color(0xFFFFFFFF),
          title: Text(
            "Farmers Support Providers",
            style: TextStyle(
                color: Colors.green, fontSize: 14, fontFamily: "Poppins"),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => InkWell(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Image.memory(base64.decode(defaultImage)).image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: ListTile(
                                  //snapshot.data![index]['_links']['self']['href']
                                  contentPadding: const EdgeInsets.all(10.0),
                                  title: Center(
                                      child: Text(snapshot.data![index]['name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontFamily: "Poppins"))),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ServiceProviders()));
                              },
                            )
                )
                    : Center(
                        child: Center(
                          child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.black,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orange))),
                        ),
                      )));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = SERVICE_PROVIDER_CATEGORIES;

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      posts = jsonResponse;
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
