import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:http/http.dart' as http;

class CashFlows {
  //http://infoagesolutionslimited.com:9301/api/users/36e102eb-ba37-43a1-8b50-8247aa99163a/cashFlows
  //baseUrl+
  Future<List> getCashflow(String id, String token) async {
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

  //Post Data
  Future<List> postCashflow(String id, String token) async {
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

  //update reports
  Future<List> updateCashflow(String id, String token) async {
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
