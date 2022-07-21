import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title, String pass) async {
  final response = await http.post(
    Uri.parse('http://fb1a-41-60-237-72.ngrok.io/api/auth/signIn'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': title,
      'password': pass,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String firstName;
  final String username;
  final String middleName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;
  final String userType;
  final String physicalAddress;
  final String residentialAddress;

  Album({
    required this.firstName,
    required this.username,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.userType,
    required this.physicalAddress,
    required this.residentialAddress,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      firstName: json['firstName'],
      username: json['phone'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      userType: json['userType'],
      physicalAddress: json['physicalAddress'],
      residentialAddress: json['residentialAddress'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _ucontroller = TextEditingController();
  final TextEditingController _pscontroller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _ucontroller,
          decoration: const InputDecoration(hintText: 'Username'),
        ),
        TextField(
          controller: _pscontroller,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_ucontroller.text, _pscontroller.text);
              // _futureAlbu  = createAlbum(_pscontroller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              //Text(snapshot.data!.phone),
              Text(snapshot.data!.firstName),
              Text(snapshot.data!.middleName),
              Text(snapshot.data!.lastName),

              //Text(snapshot.data!.userType),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
