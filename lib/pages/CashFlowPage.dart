import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/pdfs/app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class CashFlowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CashFlowPageState();
  }
}

class _CashFlowPageState extends State<CashFlowPage> {
  late String token;
  late String id;
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
      id = jsonResponse['id'];
      print(token);
      print(id);
    });
  }

  //var getCashFlows = CashFlows();
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
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          backgroundColor: Color(0xFF4b7344),
          title: Text(
            "Cash Flow",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getCashflow(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        padding: const EdgeInsets.all(6),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                  //snapshot.data![index]['_links']['self']['href']
                                  contentPadding: const EdgeInsets.all(8),
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.black,
                                                offset: Offset(0.5, 1))
                                          ]),
                                      child: Text(snapshot.data![index]['cashFlows']
                                          ['financeItem']['name'])),
                                  title: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.black,
                                                offset: Offset(0.5, 1))
                                          ]),
                                      child: Text(snapshot.data![index]
                                              ['cashFlows']['amount']
                                          .toString())),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => pdfA()));
                                  }),
                            ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }

  Future<List> getCashflow() async {
    List cashFlows = [];
    try {
      String endPoint;
      endPoint = bulkFetch + id + '?token=$token';

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      cashFlows = jsonResponse;
      print(jsonResponse["cashFlows"]["financeItem"]["name"]);
    } catch (err) {
      //print(err);
    }
    return cashFlows;
  }
}
