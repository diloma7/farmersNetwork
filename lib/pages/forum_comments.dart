import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForumsComments extends StatefulWidget {
  String link;
  ForumsComments({Key? key, required this.link}) : super(key: key);
  @override
  _ForumsCommentsState createState() => _ForumsCommentsState();
}

class _ForumsCommentsState extends State<ForumsComments> {
  late String token;
  late Map forumData = {};
  late String title;
  late String Description;
  late String iD;
  late String postingLink;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController nameController = TextEditingController(text: "");
  //late String token;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
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

  Widget buildBody(BuildContext context) {
    return FutureBuilder(
        future: _loadData(widget.link),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            nameController.text = snapshot.data!["title"];
            iD = snapshot.data!["id"];
            Description = snapshot.data!["description"];
            print(snapshot.data);
          }
          return Form(
              child: Card(
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: nameController,
                    readOnly: true,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                RichText(
                    overflow: TextOverflow.clip,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: Description),
                        TextSpan(
                            text:
                                'Widgets form the basis of views and screens in a Flutter app, and appropriately combining the diverse widgets available will give you a beautifully designed screen.'),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("Like"),
                      onPressed: () {
                        postingLink = "likes";
                        print(postingLink);
                        _postComments(iD, postingLink);
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      child: Text("unlike"),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Comments Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
            child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBody(context),
              ]),
        )));
  }

  Future<Map> _loadData(String link) async {
    Map posts = {};
    try {
      String endPoint;
      endPoint = link + "?token=$token";

      final http.Response response = await http.get(Uri.parse(endPoint));
      // print(response.body);
      final jsonResponse = json.decode(response.body);
      posts = jsonResponse;
    } catch (err) {
      //print(err);
    }
    return posts;
  }

  Future<List> _postComments(String id, postingLink) async {
    List likes = [];
    late String endPoint;
    print(id);
    if (postingLink == "likes") {
      endPoint = FORUM_COMMENTS + "/$id/forumCommentLikes?token=$token";
    } else {
      endPoint = FORUM_COMMENTS + "/$id/forumComments?token=$token";
    }
    print(endPoint);
    try {
      print(endPoint);
      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      likes = jsonResponse;
      print(response.body);
    } catch (err) {}

    return likes;
  }
}
