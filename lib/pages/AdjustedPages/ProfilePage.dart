import 'dart:convert';
import 'package:farmers_network/pages/AdjustedPages/AdjustedLogin.dart';
import 'package:farmers_network/pages/ProductsByCategoryMarket.dart';
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/viewmodels/ServiceProfileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:farmers_network/pages/events.dart';
import '../LoyaltyProgram.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  late String _uname;
  late String token;
  String phone = '';
  String email = '';
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
      token = jsonResponse['token'];
      _uname = jsonResponse['firstName'];
      email = jsonResponse['email'];
      phone = jsonResponse['phone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f8fa),
        appBar: AppBar(
          centerTitle: true,
              title: Text(_uname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4b7344))
              ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined,
                color: Color(0xFF4b7344)),
          ),
          actions: [
            IconButton(onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('More Features', style: TextStyle(fontSize:14, fontWeight: FontWeight.w700, color:  Color(0xFF1C6016)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,30,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.account_circle_outlined, size: 55, color:  Color(0xFF1C6016)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.payment, size: 55, color:  Color(0xFF1C6016)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoyaltyProgram()),
                                    );
                                  },
                                  icon: Icon(Icons.loyalty_outlined, size: 55, color:  Color(0xFF1C6016)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,30,0,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Edit Account', style: TextStyle(color:  Color(0xFF1C6016))),
                              Text('Payment', style: TextStyle(color:  Color(0xFF1C6016))),
                              Text('Loyalty Program', style: TextStyle(color:  Color(0xFF1C6016)))
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,30,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.star, size: 55,color:  Color(0xFF1C6016)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Events()),
                                    );
                                  },
                                  icon: Icon(Icons.calendar_today, size: 55,color:  Color(0xFF1C6016)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.settings,size: 55,color:  Color(0xFF1C6016)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,30,0,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('My Reviews', style: TextStyle(color:  Color(0xFF1C6016))),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,30,0),
                                child: Text('My Planner', style: TextStyle(color:  Color(0xFF1C6016))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text('Settings', style: TextStyle(color:  Color(0xFF1C6016))),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height:15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0,2, 15, 3),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdjustedLogin()),
                              ); // logiApi(usernameController.text, passwordController.text);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0XFFEB8A44),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children:  [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(120,0,50,0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.power_settings_new, color: Colors.white),
                                            SizedBox(width: 5),
                                            Text(
                                              'Log Out',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                  ],
                                ),
                              ),
                              //let's create a common header widget
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
                icon: Icon(Icons.menu)
            )
          ],
          backgroundColor: Color(0xFFf7f8fa),
          elevation: 0,
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
              children: [
            Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                  Container(
                      child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                              backgroundImage:Image.memory(base64.decode(defaultImage)).image))),
                  Align(
                      alignment: Alignment.center,
                      child: Text(_uname,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              color: Color(0xFF4b7344)))),
                  Align(
                      alignment: Alignment.center,
                      child: Text(providerDetails.website,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              color: Color(0xFF4b7344)))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(
                      Icons.location_pin,
                      size: 11,
                      color: Colors.white,
                    ),
                    Text(providerDetails.geoLocation,
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            color: Color(0xFF4b7344)))
                  ]),
                  //rate
                  Container(
                      margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < 4; i++)
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.orange,
                              ),
                            for (var i = 0; i < 1; i++)
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.grey,
                              ),
                          ])),
                  Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 40, 0),
                      child: Row(
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.facebook, size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon:
                                  FaIcon(FontAwesomeIcons.googlePlus, size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.linkedin, size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.phone, size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.whatsapp, size: 14),
                              onPressed: () {
                                print("Pressed");
                              }),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      )),
                  Container(
                      height: 80,
                      width: 327,
                      decoration: BoxDecoration(
                        color: Color(0XFFEC8C44),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    icon: (

                                          Icon(Icons.shopping_cart,
                                              size: 20, color: Colors.white)
                                          // Text('Orders', style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontSize: 8,
                                          //     fontFamily: 'Poppins'),
                                          // ),


                                      ),

                                    onPressed: () {
                                      print("Pressed");
                                    }
                                    ),
                             Text('Orders', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Poppins'),
                                  ),

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    icon: (
                                       FaIcon(
                                            FontAwesomeIcons.facebookMessenger,
                                            color: Colors.white,
                                            size: 15)
                                    ),
                                    onPressed: () {
                                      print("Pressed");
                                    }),
                                Text(
                                  'Chats',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    icon: (

                                        Icon(Icons.groups,
                                            size: 20, color: Colors.white)
                                       ),
                                    onPressed: () {
                                      print("Pressed");
                                    }),
                                Text(
                                  'Groups',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Poppins'),
                                ),

                              ],
                            ),
                            InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: (
                                           FaIcon(FontAwesomeIcons.barcode, size: 20)),
                                        color: Colors.white,
                                        onPressed: () {
                                          _displayDialog(context);
                                          print("Pressed");
                                        }),
                                    Text('Business Card',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Poppins'))
                                  ],
                                ),
                                onTap: () => _displayDialog(context)
                            ),
                          ])),
                  Container(
                      padding: EdgeInsets.fromLTRB(15,0,15,0),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('About',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4b7344)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Farmers  Network is dedicated to helping Family Farmers maximize their farm’s profit potential with a data and technology enabled direct-to-farm commerce, community ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF4b7344)))),
                        ],
                      )),
                ])),
            Column(
                children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 12, 15, 0),
                    child: SizedBox(
                      height: 22,
                      child: Text(
                        'Dallan Enterprise',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF2A4E05),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 12, 15, 0),
                    child: SizedBox(
                        height: 22,
                        child: InkWell(
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Color(0xFF2A4E05),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductsByCategoryMarket()));
                          },
                        )),
                  ),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: FutureBuilder(
                      future: _loadData(),
                      builder: (BuildContext ctx,
                              AsyncSnapshot<List> snapshot) =>
                          snapshot.hasData
                              ? GridView.builder(
                                  itemCount: snapshot.data!.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 205,),
                                  itemBuilder: (BuildContext context, index) =>
                                      Container(
                                          margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                                          child: Column(
                                            children: [
                                              Container(
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
                                                child: Column(
                                                  children: [
                                                  Image.memory(
                                                      base64.decode(defaultImage),
                                                    fit: BoxFit.contain,
                                                    ),
                                                  Text(
                                                      snapshot.data![index]['title'],
                                                          // .toLowerCase(),
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.green,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.bold)),
                                                  Text('500 grams'.toLowerCase(),
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.green,
                                                          fontFamily: 'Poppins')),
                                                   Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: <Widget>[
                                                          Text('USD',
                                                              style: TextStyle(fontSize: 10,
                                                                  color: Colors.green,
                                                                  fontFamily:'Poppins')),
                                                          IconButton(
                                                            icon: Icon( Icons.edit,),
                                                            splashColor: Colors.grey,
                                                            onPressed: () {},
                                                          ),
                                                        ]),

                                                ],),
                                              ),

                                            ],
                                          )))
                              : Center(
                                  child: CircularProgressIndicator(),
                                )))
            ])
            //BottomNav()
          ]),
        )));
  }

  _displayDialog(BuildContext context) async {
    // print(jsonObj);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.750,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.zero,
                              child: Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                    Text(
                                      "Business Card ",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Icon(
                                        Icons.close,
                                        size: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: CircleAvatar(
                                                  backgroundImage: Image.memory(
                                                          base64.decode(
                                                              defaultImage))
                                                      .image),
                                              heightFactor: 2)
                                        ])),
                                Container(
                                    padding: EdgeInsets.fromLTRB(60, 5, 40, 0),
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(_uname,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF4b7344))))),
                                Container(
                                    padding: EdgeInsets.fromLTRB(60, 5, 40, 0),
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text('Farm Manager',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF4b7344))))),
                                Container(
                                    padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                                    child: Row(children: [
                                      Icon(
                                        Icons.call_outlined,
                                        size: 20,
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(phone,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF4b7344)))
                                    ])),
                                Container(
                                    padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                                    child: Row(children: [
                                      Icon(
                                        Icons.mail,
                                        size: 20,
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(email,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF4b7344)))
                                    ])),
                                Container(
                                    padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                                    child: Row(children: [
                                      Icon(Icons.location_pin,
                                          size: 20, color: Colors.lightGreen),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('phone',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Poppins',
                                            color: Colors.lightGreen,
                                          ))
                                    ])),
                              ]))),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: BoxDecoration(color: Colors.lightGreen),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/dlogo.png',
                                        height: 60, width: 60),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Farm Name',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 13,
                                          color: Colors.white),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(providerDetails.website,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            color: Colors.white)),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.facebook,
                                            size: 14, color: Colors.blue),
                                        onPressed: () {
                                          print("Pressed");
                                        }),
                                    IconButton(
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(
                                            FontAwesomeIcons.googlePlus,
                                            size: 14,
                                            color: Colors.red),
                                        onPressed: () {
                                          print("Pressed");
                                        }),
                                    IconButton(
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.twitter,
                                            size: 14, color: Colors.blue),
                                        onPressed: () {
                                          print("Pressed");
                                        }),
                                  ]),
                            ]),
                      )
                    ]),
              ));
        });
  }

  Future<List> _loadData() async {
    List posts = [];
    try {
      String endPoint;
      endPoint = FORUMS + token;

      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['forums'];
      posts = map;
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
