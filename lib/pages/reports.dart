import 'dart:convert';
import 'package:farmers_network/apis/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'entreprises.dart';

class Reports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReportsState();
  }
}

class _ReportsState extends State<Reports> {
  @override
  void initState() {
    super.initState();
    _loadSharedData();
  }

  @override
  void dispose() {
    //focusNode.dispose();
    super.dispose();
  }

  List dataToSend = [];
  late String endPoint;
  double amount = 0.0;
  String reportData = '';
  String token = '';
  double farmInputsAmount = 0.0;
  String farmInputsId = '';
  double labourAmount = 0.0;
  String labourId = '';
  double advertisementAmount = 0.0;
  String advertisementId = '';
  double transportStorageAmount = 0.0;
  String transportStorageId = '';
  double royaltiesServicesAmount = 0.0;
  String royaltiesServicesId = '';
  double inventoryInputsamount = 0.0;
  String inventoryInputsId = '';
  double farmOutputsAmount = 0.0;
  String farmOutputsId = '';
  double expenses = 0.0;
  String expensesId = '';
  double production = 0.0;
  String productionId = '';
  double productSalesAmount = 0.0; //working
  String productSalesId = '';
  double salesRevenue = 0.0;
  String salesRevenueId = '';

  bool neg = true;
  final myController = TextEditingController();
  final ctrlExpenses = TextEditingController();
  final labourController = TextEditingController();
  final ctrlproduction = TextEditingController();
  final ctrlfarmOutputsAmount = TextEditingController();
  final ctrlinventoryInputsamount = TextEditingController();
  final ctrlSalesRevenue = TextEditingController();
  final farmOutputmyController = TextEditingController();
  final ctrlroyaltiesServices = TextEditingController();
  final ctrladvertisement = TextEditingController();
  final ctrlproductSales = TextEditingController();
  final ctrltransportStorage = TextEditingController();

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    Widget expensesWidget() {
      return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Farm Inputs',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: myController,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$farmInputsAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Labour',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: labourController,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$labourAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Transport & Storage',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrltransportStorage,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$transportStorageAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () {
                    if (myController.text == "") {
                      farmInputsAmount = farmInputsAmount;
                    } else {
                      farmInputsAmount =
                          farmInputsAmount + double.parse(myController.text);
                    }
                    if (labourController.text == "") {
                      labourAmount = labourAmount;
                    } else {
                      labourAmount =
                          labourAmount + double.parse(labourController.text);
                    }
                    if (ctrltransportStorage.text == "") {
                      transportStorageAmount = transportStorageAmount;
                    } else {
                      transportStorageAmount = transportStorageAmount +
                          double.parse(ctrltransportStorage.text);
                    }
                    dataToSend
                        .add({"id": farmInputsId, "amount": farmInputsAmount});
                    dataToSend.add({"id": labourId, "amount": labourAmount});
                    dataToSend.add({
                      "id": transportStorageId,
                      "amount": transportStorageAmount
                    });
                    print(json.encode(dataToSend));
                    updateReports(dataToSend);
                  },
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  color: Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text(
                    "SAVE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Segoe",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ));
    }

    Widget incomeWidget() {
      return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Product Sales',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlproductSales,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$productSalesAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText:
                                      'Advertisement & Service  e.g Farm Tour',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrladvertisement,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$advertisementAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Royalties & Services',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlroyaltiesServices,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$royaltiesServicesAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () {
                    if (ctrlroyaltiesServices.text == "") {
                      royaltiesServicesAmount = royaltiesServicesAmount;
                    } else {
                      royaltiesServicesAmount = royaltiesServicesAmount +
                          double.parse(ctrlroyaltiesServices.text);
                    }
                    if (ctrladvertisement.text == "") {
                      advertisementAmount = advertisementAmount;
                    } else {
                      advertisementAmount = advertisementAmount +
                          double.parse(ctrladvertisement.text);
                    }
                    if (ctrlproductSales.text == "") {
                      productSalesAmount = productSalesAmount;
                    } else {
                      productSalesAmount = productSalesAmount +
                          double.parse(ctrlproductSales.text);
                    }
                    dataToSend.add({
                      "id": royaltiesServicesId,
                      "amount": royaltiesServicesAmount
                    });
                    dataToSend.add(
                        {"id": advertisementId, "amount": advertisementAmount});
                    dataToSend.add(
                        {"id": productSalesId, "amount": productSalesAmount});
                    print(json.encode(dataToSend));
                    updateReports(dataToSend);
                    //ctrlroyaltiesServices.text=royaltiesServicesAmount.toString();
                    //ctrladvertisement.text=advertisementAmount.toString();
                    //ctrlproductSales.text=productSalesAmount.toString();
                  },
                  textColor: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  color: Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text(
                    "SAVE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Segoe",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ));
    }

    Widget inventoryWidget() {
      return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Farm inputs E.g Seed pestcides',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlinventoryInputsamount,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$inventoryInputsamount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Farms Outputs - Products',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlfarmOutputsAmount,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$farmOutputsAmount',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () {
                    if (ctrlfarmOutputsAmount.text == "") {
                      farmOutputsAmount = farmOutputsAmount;
                    } else {
                      farmOutputsAmount = farmOutputsAmount +
                          double.parse(ctrlfarmOutputsAmount.text);
                    }
                    if (ctrlinventoryInputsamount.text == "") {
                      inventoryInputsamount = inventoryInputsamount;
                    } else {
                      inventoryInputsamount = inventoryInputsamount +
                          double.parse(ctrlinventoryInputsamount.text);
                    }

                    dataToSend.add(
                        {"id": farmOutputsId, "amount": farmOutputsAmount});
                    dataToSend.add({
                      "id": inventoryInputsId,
                      "amount": inventoryInputsamount
                    });
                    print(json.encode(dataToSend));
                    updateReports(dataToSend);
                  },
                  textColor: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  color: Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text(
                    "SAVE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Segoe",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ));
    }

    Widget budgetWidget() {
      return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Sales Revenue',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlSalesRevenue,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$salesRevenue',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Production',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlproduction,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$production',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    // padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              onSubmitted: (value) {
                                // onSendMessage(textEditingController.text, 0);
                              },
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: 'Expenses',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: TextField(
                              controller: ctrlExpenses,
                              style: TextStyle(fontSize: 15.0),
                              decoration: InputDecoration(
                                  hintText: '$expenses',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  border: InputBorder.none
                                  // hintStyle: TextStyle(color: greyColor),
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF8EBA43),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Color(0xFF8EBA43),
                          ),
                        )
                      ],
                    ),
                    // width: double.infinity,
                    height: 50.0,
                  )),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () {
                    if (ctrlSalesRevenue.text == "") {
                      salesRevenue = salesRevenue;
                    } else {
                      salesRevenue =
                          salesRevenue + double.parse(ctrlSalesRevenue.text);
                    }
                    if (ctrlproduction.text == "") {
                      production = production;
                    } else {
                      production =
                          production + double.parse(ctrlproduction.text);
                    }
                    if (ctrlExpenses.text == "") {
                      expenses = expenses;
                    } else {
                      expenses = expenses + double.parse(ctrlExpenses.text);
                    }

                    dataToSend
                        .add({"id": salesRevenueId, "amount": salesRevenue});
                    dataToSend.add({"id": productionId, "amount": production});
                    dataToSend.add({"id": expensesId, "amount": expenses});
                    print(json.encode(dataToSend));
                    updateReports(dataToSend);
                  },
                  textColor: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  color: Theme.of(context).primaryColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text(
                    "SAVE ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Segoe",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ));
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Reports",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Text(
              "Expenses",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 6),
            Divider(
              height: 4,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 6),
            expensesWidget(),
            Text(
              "Income",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 6),
            Divider(
              height: 4,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 6),
            incomeWidget(),
            Text(
              "Inventory",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 6),
            Divider(
              height: 4,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 6),
            inventoryWidget(),
            Text(
              "Budget",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 6),
            Divider(
              height: 4,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 6),
            budgetWidget(),
          ])),
        ]),
      ),
    );
  }

  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data = prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      token = jsonResponse['token'];
      getData();
    });
  }

  getData() async {
    endPoint = GET_REPORTS + "$token";

    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      setState(() {
        reportData = response.body;
      });
      final json = jsonDecode(reportData);
      // print(reportData);
      salesRevenue = json[0]["reports"][0]["amount"];
      salesRevenueId = json[0]["reports"][0]["id"];
      production = json[0]["reports"][2]["amount"];
      productionId = json[0]["reports"][2]["id"];
      expenses = json[0]["reports"][1]["amount"];
      expensesId = json[0]["reports"][1]["id"];

      ///income
      productSalesAmount = json[1]["reports"][2]["amount"];
      productSalesId = json[1]["reports"][2]["id"];
      advertisementAmount = json[1]["reports"][0]["amount"];
      advertisementId = json[1]["reports"][0]["id"];
      royaltiesServicesAmount = json[1]["reports"][1]["amount"];
      royaltiesServicesId = json[1]["reports"][1]["id"];

      /// expense
      farmInputsAmount = json[3]["reports"][1]["amount"];
      farmInputsId = json[3]["reports"][1]["id"];
      labourAmount = json[3]["reports"][2]["amount"];
      labourId = json[3]["reports"][2]["id"];
      transportStorageAmount = json[3]["reports"][0]["amount"];
      transportStorageId = json[3]["reports"][0]["id"];

      ///Inventory
      inventoryInputsamount = json[2]["reports"][0]["amount"];
      inventoryInputsId = json[2]["reports"][0]["id"];
      farmOutputsAmount = json[2]["reports"][1]["amount"];
      farmOutputsId = json[2]["reports"][1]["id"];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to load Report Data!'),
          action: SnackBarAction(
            label: 'Retry Again',
            onPressed: () {
              // Code to print(partnerCategories);(partnerCategories);ute.
            },
          ),
        ),
      );
    }
  }

  updateReports(var bodyData) async {
    endPoint = UPDATE_REPORTS + "$token";
    final response = await http.post(
      Uri.parse(endPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(bodyData),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Enterprises()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Data not saved!'),
          action: SnackBarAction(
            label: 'Enter Again',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }
}
