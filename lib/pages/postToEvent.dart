// import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

enum EventTypeGroup { online, inPerson } //enum for selecting the type of event

class PostToEvent extends StatefulWidget {
  const PostToEvent({Key? key}) : super(key: key);

  @override
  State<PostToEvent> createState() => _PostToEventState();
}

class _PostToEventState extends State<PostToEvent> {
  EventTypeGroup? _value = EventTypeGroup.online;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        elevation: 0.0,
        title: const Text('Plan Event'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 250,
              width: 400,
              decoration: const BoxDecoration(color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Plan New Event',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 20),
                    const Text('Event Type',
                        style: TextStyle(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: EventTypeGroup.online,
                            activeColor: Colors.white,

                            // title:  const Text('Online',
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            groupValue: _value,
                            onChanged: (EventTypeGroup? val) {
                              setState(() {
                                _value = val;
                              });
                            }),
                        const Text(
                          'Online',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 100),
                        Radio(
                            value: EventTypeGroup.inPerson,
                            activeColor: Colors.white,
                            groupValue: _value,
                            onChanged: (EventTypeGroup? val) {
                              setState(() {
                                _value = val;
                              });
                            }),
                        const Text(
                          'In Person',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                      width: 400,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            label: Text('Event Name',
                                style: TextStyle(color: Colors.white)),
                            contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 400,
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                )),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            label: const Text('Date',
                                style: TextStyle(color: Colors.white)),
                            contentPadding: const EdgeInsets.all(5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Event Time',
                        style: TextStyle(color: Colors.green)),
                    // const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 80,
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'From'
                              // style: TextStyle(
                              //   // fontWeight: FontWeight.bold,
                              //   color: Colors.green,
                              // ),
                              // )
                              ,
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.all(7),
                              // fillColor: Colors.red,
                              // filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                contentPadding: EdgeInsets.all(7),
                                hintText: 'To'),
                            // fillColor: Colors.red,
                            // filled: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'External Link',
                      style: TextStyle(color: Colors.green),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 40,
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 60,
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            label: Text(
                              'Event Venue',
                              style: TextStyle(color: Colors.green),
                            ),
                            contentPadding: EdgeInsets.all(5)
                            // labelText: 'Event Name',
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Event Description',
                      style: TextStyle(color: Colors.green),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 100,
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            contentPadding: EdgeInsets.all(5)
                            // labelText: 'Event Name',
                            ),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        height: 32,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Plan Event',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
