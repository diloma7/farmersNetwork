import 'dart:convert';

import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/models/EventsModel.dart';
import 'package:http/http.dart' as http;

class EventsApi {
  Future<EventsModel> createEvents(
    String subject,
    String startDate,
    String startTime,
    String endTime,
    String comment,
    String token,
  ) async {
    String endPoint = EVENTS + token;
    final response = await http.post(
      Uri.parse(endPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'subject': subject,
        'startDate': startDate,
        'startTime': startTime,
        'endTime': endTime,
        'comment': comment,
      }),
    );
    if (response.statusCode == 200) {
      return EventsModel.fromJson(
          jsonDecode(response.body)['_embedded']['events']);
    } else {
      throw Exception('Failed to create event.');
    }
  }

  Future<List<EventsModel>> getEvents(String token) async {
    String endPoint = EVENTS + token;

    final http.Response response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['_embedded']['events'];
      print(result);
      return result.map(((e) => EventsModel.fromJson(e))).toList();
    } else {
      throw Exception('Failed to create event.');
    }

  }
}
