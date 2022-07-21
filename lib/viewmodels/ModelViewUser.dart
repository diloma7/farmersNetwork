import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ModelViewUser {
  String uname = "";
  late String points;
  late String userType;
  List personalData = [];

  late SharedPreferences prefs;
  loadSharedData() async {
    prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('userData');
    personalData = jsonDecode(data!);
    return personalData;
  }

  getUserName() async {
    prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('userData');
    final jsonResponse = jsonDecode(data!);
    return jsonResponse[1];
  }
}
