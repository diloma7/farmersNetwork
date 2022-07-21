import 'dart:convert';

import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ServiceProviderProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceProviderProfilePageState();
  }
}

class _ServiceProviderProfilePageState extends State<ServiceProviderProfilePage> {
  @override
  String _uname = '';

  void initState() {
    super.initState();
    _loadSharedData();
  }

//tabs

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data=prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _uname = jsonResponse['firstName'];
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ])),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Stack(
                children: <Widget>[
                  Icon(Icons.menu),
                ],
              ),
            )
          ],
        ),
        body:Container(decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Color(0xFF6D9845), Color(0xFF4B7447)],
    begin: const FractionalOffset(0.5, 0.0),
    end: const FractionalOffset(0.6, 0.6),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp)),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              child: AdWidget(),
                   ),
              Container(
                child: Stack(
                  children: <Widget>[

                    Card(
                    child: Container(
                      width: double.infinity,
                      padding:EdgeInsets.fromLTRB(0,20,0,0),
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),

                        border: Border.all(
                            color: Color(0XFFFFFFFF), width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    child:Column(children:[
                      RatingBarIndicator(
                      rating: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                       Text('PASSION FRUIT FARMERS KENYA'),
                      ListTile(
                        dense: true,
                        leading:
                        Image.asset('assets/images/whatsapp.png'),
                        title: Text('PASSION FRUIT FARMERS KENYA'),
                        subtitle: Text('What kind of COVID-19 tests are available?tests'),

                      ),
                      Text('')
                  ],
                ),
              )),    Positioned(
                        left:80,
                        bottom:0,
                        child: Center(
                          child:Container(
                            padding:EdgeInsets.fromLTRB(0,20,0,0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  
                                  primary: Colors.yellow,
                                  onPrimary: Colors.black, //\nThis is what you need!
                                ),
                                onPressed: () {
                                },
                                child: Text("GET IN TOUCH"),
                              )),
                        )),])),

              Container(
                  padding:EdgeInsets.fromLTRB(14, 8, 14, 8),
                  child: Column(children:[
                    Text("About",style:TextStyle(color:Colors.white,fontSize:10)),
                    Divider(height:10,color:Colors.white),
                    Text("We are a Pan-African business consultancy firm established in 2015. We provide Business Consultancy Services to MSMEs to enable them to leverage their business potentials through the use of digital transition infrastructure for Business Development, Sales, Marketing, Operations, Finance and Administration.",style:TextStyle(color:Colors.white,fontSize:10)),
                    Divider(height:10,color:Colors.white),
                  ])

              ),
              Container(
                  child: Column(children:[
                    Text("Clients",style:TextStyle(color:Colors.white,fontSize:10)),
                             ])

              ),

                    //BottomNav()
          ]),
        )));

  }


}
