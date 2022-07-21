import 'dart:convert';
import 'package:farmers_network/pages/widgets/ImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class EditFarmersProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditFarmersProfileState();
  }
}

class _EditFarmersProfileState extends State<EditFarmersProfile> {
  @override
  void initState() {
    super.initState();

  }
  final _formKey = GlobalKey<FormState>();
//tabs


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF588248),
          title: Text("Partners Registration",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center),
        ),
        body: Center(

          child: Column(children: <Widget>[
            Expanded(
                flex: 2,
                child:     Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: PickImageScreen(),
                )),
            //Expanded
            SizedBox(
              height:1,
            ),

            Expanded(
                flex: 5,
                child:Form(
                    key: _formKey,
                    child: Column(children: <Widget>[

                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          //controller: firstnameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Farm Name',
                          ),
                        ),
                      ),
                      PickImageScreen(),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(1920, 3, 5),
                                  maxTime: DateTime(2008, 6, 7), onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                  }, currentTime: DateTime.now(), locale: LocaleType.zh);
                            },
                            child: Text(
                              'Date of Birth',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          //controller: lastnameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 5,  // allow user to enter 5 line in textfield
                          keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                          //controller: _Textcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Crops/ Livestock',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(28.0, 10.0, 32.0, 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow,
                              onPrimary:
                              Colors.black, // This is what you need!
                            ),
                            onPressed: () {
                            },
                            child: Text("Submit"),
                          ), //Color Of Icon),,
                        ),
                      ),
                      //partners dropdown
                    ]
                    ) //Row
                )), //Expanded
//Expanded
          ]), //Column
        ) //Padding
      //Container

    );
  }
}
