import 'package:farmers_network/pages/HomePage.dart';
import 'package:flutter/material.dart';

class TrackTransaction extends StatefulWidget {
  TrackTransaction() : super();

  final String title = "Stepper Demo";

  @override
  TrackTransactionState createState() => TrackTransactionState();
}

class TrackTransactionState extends State<TrackTransaction> {
  //
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text('Order Placed'),
      content: Text(
          'Most applications include some form of user interaction with the system.'),
      isActive: true,
    ),
    Step(
      title: Text('Confirm Payment & Delivery Details'),
      content: Text(
          'The first step in building an interactive application is to detect input gestures!'),
      isActive: true,
    ),
    Step(
      title: Text('Order Processed'),
      content: Text(' . See how that works by creating a simple button:!'),
      state: StepState.complete,
      isActive: true,
    ),
    Step(
      title: Text('Order Sent Out'),
      content: Text(' . See how that works by creating a simple button:!'),
      state: StepState.complete,
      isActive: true,
    ),
    Step(
      title: Text('Order Processed'),
      content: Text(' . See how that works by creating a simple button:!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Appbar
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text('Track Transaction',
              style: TextStyle(fontSize: 12, color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
          ),
          backgroundColor: Color(0xFF4b7344),
          elevation: 0,
        ),
        // Body
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
              child: Stepper(
                currentStep: this.current_step,
                steps: steps,
                type: StepperType.vertical,
                onStepTapped: (step) {
                  setState(() {
                    current_step = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (current_step < steps.length - 1) {
                      current_step = current_step + 1;
                    } else {
                      current_step = 0;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (current_step > 0) {
                      current_step = current_step - 1;
                    } else {
                      current_step = 0;
                    }
                  });
                },
              ),
            ),
            Container(
              child: Card(
                child: ListTile(
                  title: const Text(
                    'Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('14 Peter Rd, Nairobi'),
                  leading: Icon(
                    Icons.house_sharp,
                    color: Colors.blue[500],
                  ),
                ),
              ),
            ),
            Container(
              child: Card(
                child: ListTile(
                  title: const Text(
                    'Dont forget to rate',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('Rate Africana Logistics'),
                  leading: Icon(
                    Icons.star,
                    color: Colors.yellow[500],
                  ),
                ),
              ),
            )
          ])),
        ));
  }
}
