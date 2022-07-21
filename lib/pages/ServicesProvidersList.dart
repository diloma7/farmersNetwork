import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/ServiceProviderProfilePage.dart';
import 'package:farmers_network/pages/messages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Providerlists extends StatefulWidget {
  late final String text;
  Providerlists(this.text);
  @override
  State<StatefulWidget> createState() {
    return _ProviderlistsState();
  }
}

class _ProviderlistsState extends State<Providerlists> {
  late String token;

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

  _loadLinks(String link) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('link', link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          title: Text(widget.text,
              style: TextStyle(
                  fontSize: 14, fontFamily: "Poppins", color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          backgroundColor: Color(0xFF4b7344),
          elevation: 0,
        ),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        padding: const EdgeInsets.all(6),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceProviderProfilePage(),
                                ),
                              );
                            },
                            child: Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            child: Image.network('https://picsum.photos/seed/901/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                             )
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets.fromLTRB(5,0,100,0),
                                                    child: Text(
                                                        snapshot.data![index]['title'],
                                                        // textAlign:TextAlign.left,
                                                        style: TextStyle(fontFamily:'Poppins',
                                                        fontSize: 10,
                                                        color: Color(0xFF2A4E05)
                                                        )
                                                    ),
                                                  ),


                                           Padding(
                                                    padding: const EdgeInsets.fromLTRB(5,0,100,0),
                                                     child: Text(
                                                     snapshot.data![index]['description'],
                                                     // textAlign:TextAlign.left,
                                                     style: TextStyle(
                                                     fontFamily:'Poppins', fontSize: 10,
                                                     color: Color(0xFF2A4E05),
                                            )
                                                     ),
                                         ),

                                               Padding(
                                                 padding: const EdgeInsets.only(left: 23.0),
                                                 child: Row(
                                                  children: [
                                                  /*RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                              setState(() => ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        direction: Axis.horizontal,
                        initialRating: ratingBarValue ??= 3,
                        unratedColor: Color(0xFF9E9E9E),
                        itemCount: 5,
                        itemSize: 28,

                      ), */
                                                    Text('Hel', style: TextStyle(fontSize: 12,fontFamily: "Poppins", color: Colors.green)),
                                                    SizedBox(width: 10),
                                                    Text('Num', style: TextStyle(fontSize: 10,fontFamily:"Poppins", color: Colors.green)),
                                                          ],
                                                        ),

                                             ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                        alignment: Alignment.bottomRight,
                                                        child:ElevatedButton.icon(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Colors.orange,
                                                                  shape:new RoundedRectangleBorder(borderRadius:new BorderRadius.circular(0.0),), ),
                                                                onPressed: () {Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(builder:(context) =>Chat()),
                                                                  );
                                                                },
                                                                icon: Icon(Icons.message_rounded, color: Colors.white,size: 12.0,),
                                                                label: Text('Chat with Seller',style: TextStyle( fontSize:10,fontFamily: "Poppins", color: Colors.white)
                                                                )
                                                      )
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                               ],
                        ),
                            )
                    )
                )
                    : Center(
                        child: CircularProgressIndicator(),
                      )));
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint = FORUMS + "$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['forums'];
      posts = map;
      // print(posts);
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
