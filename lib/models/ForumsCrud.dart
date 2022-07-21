import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../apis/api.dart';
class ForumsCrud {
  late String title;
  late String description;
  late String id;
  late String endPoint;

  ForumsCrud(this.title, this.description, this.id);
  factory ForumsCrud.fromJson(Map json) {
    return ForumsCrud(json['title'], json['description'], json['id']);
  }

  postForums(
      String localTitle,
      String localDescription,endPoint) async {
    final response = await http.post(
      Uri.parse(endPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': localTitle,
        'middleName': localDescription,
       }),
    );

    if (response.statusCode == 200) {
      final jsonObj = response;
      print(jsonObj);
    } else {
      print(Future.error("error"));
    }
  }
  replyForums(
      String localTitle,
      String localDescription,endPoint) async {
    final response = await http.post(
      Uri.parse(endPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': localTitle,
        'middleName': localDescription,
      }),
    );

    if (response.statusCode == 200) {
      final jsonObj = response;
      print(jsonObj);
    } else {
      print(Future.error("error"));
    }
  }

  Future<List> retrieveForums(endPoint) async {
    List Forumss = [];
    try {
      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map= jsonResponse['_embedded']['forums'];
      Forumss=map;

    } catch (err) {
      //print(err);
    }
    return Forumss;
  }

  Future<http.Response>deleteForums(String id,endPoint) async{
 final http.Response response= await http.delete(Uri.parse(endPoint),
   headers: <String,String>{
       'Content_type':'application/json;charset=UTF-8',
   },
 );
 return response;
  }


  Future<http.Response>updateForums(endPoint) async{
     final http.Response response= await http.put(Uri.parse(endPoint),
      headers: <String,String>{
        'Content_type':'application/json;charset=UTF-8',
      },
    );
    return response;
  }
}