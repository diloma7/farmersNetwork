import 'dart:convert';
//https://github.com/surajadkhari/user_profile/blob/master/lib/screens/homepage.dart
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/models/EventsModel.dart';
import 'package:farmers_network/pages/postToEvent.dart';
import 'package:intl/intl.dart';
import 'package:farmers_network/pages/postToEvent.dart';
import 'package:farmers_network/apis/EventsApi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late String token;

  String _uname = '';
  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      _uname = jsonResponse['firstName'];
      token = jsonResponse['token'];
    });
  }

  var eventsApi = EventsApi();
  @override
  void initState() {
    super.initState();
    _loadSharedData();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          automaticallyImplyLeading: false, //set your height
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
              color: Colors.grey[100],
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostToEvent()),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_left_outlined,
                          color: Colors.white),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent),
                          onPressed: () {
                            eventsApi.createEvents(
                                "ASK show Kenya ",
                                "2022-03-12",
                                "2022-03-15",
                                "05:48:37",
                                "ASK show KE",
                                token);
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostToEvent()));*/
                          },
                          child: Text('Add Task',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        )),
                  ],
                ),
              ]), // set your search bar setting
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Today',
                      style: TextStyle(color: Color(0xFF4b7344))))),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Welcome $_uname',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Colors.grey)))),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 1, 0, 1),
                  child: Text('My Calendar',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF4b7344))))),
          Container(
            margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: TableCalendar(
              rowHeight: 40,
              headerStyle: HeaderStyle(
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  )),
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 1),
                  child: Text('Upcoming Events',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF4b7344))))),
          Container(
            child: FutureBuilder<List<EventsModel>>(
              future: EventsApi().getEvents(token),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      ...snapshot.data!.map((e) => Container(
                          height: 180,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    'Date part'
                                    /*DateFormat("yyyy-MM-dd")
                                                      .format(DateTime.parse(
                                                          snapshot.data![index]
                                                              ['startDate']))
                                                      .toString()*/
                                    ,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.all(8),
                                    decoration: new BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(children: [
                                      Text(
                                        'test',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF4b7344)),
                                      ),
                                    ]),
                                  ))
                            ],
                          )))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ]))));
  }

  Future<List> getEvents() async {
    List posts = [];
    String endPoint = EVENTS + "$token";
    try {
      final http.Response response = await http.get(Uri.parse(endPoint));
      final jsonResponse = json.decode(response.body);
      List map = jsonResponse['_embedded']['events'];
      posts = map;
      print(posts);
    } catch (err) {
      //print(err);
    }
    return posts;
  }
}
