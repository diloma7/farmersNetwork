import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpDialog extends StatelessWidget {
@override
Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('AlertDialog Title'),
        content: OTPTextField(
            length: 5,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 55,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 15,
            style: TextStyle(fontSize: 17),
            onChanged: (pin) {
                print("Changed: " + pin);
            },
            onCompleted: (pin) {
                print("Completed: " + pin);
            },
        ),
    );
}
}
