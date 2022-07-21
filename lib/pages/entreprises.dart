import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:farmers_network/apis/api.dart';
import 'package:farmers_network/models/OrdinalSales.dart';
import 'package:farmers_network/pages/widgets/AdWidget.dart';
import 'package:farmers_network/pages/widgets/BottomNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';

class Enterprises extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EnterprisesState();
  }
}

class _EnterprisesState extends State<Enterprises> {
  @override
  void initState() {
    super.initState();
    _loadSharedData();
  }
  List dataToSend=[];
  late String endPoint;
  double amount=0.0;
  String reportData = '';
  String token='';
  double farmInputsAmount=0.0;
  String farmInputsId='';
  double labourAmount=0.0;
  String labourId='';
  double advertisementAmount=0.0;
  String advertisementId='';
  double transportStorageAmount=0.0;
  String transportStorageId='';
  double royaltiesServicesAmount=0.0;
  String royaltiesServicesId='';
  double inventoryInputsamount=0.0;
  String inventoryInputsId='';
  double farmOutputsAmount=0.0;
  String farmOutputsId='';
  double expenses=0.0;
  String expensesId='';
  double production=0.0;
  String productionId='';
  double productSalesAmount=0.0;//working
  String productSalesId='';
  double salesRevenue=0.0;
  String salesRevenueId='';

  List<charts.Series<dynamic, String>> seriesList = _createRandomData();

  List<dynamic> devPartners = [
    {"name": "Agriculture"},
    {"name": "Agriculture"},
    {"name": "Agriculture"},
    {"name": "Agriculture"},
  ];
  List<dynamic> ngos = [
    {"name": "Agriculture"},
    {"name": "Training"},
    {"name": "Agriculture"},
    {"name": "Training"},
  ];
  List<dynamic> offtake = [
    {"name": "Agri Food Processors"},
    {"name": "Retailers"},
    {"name": "Transport"},
    {"name": "Packaging"},
  ];
  List<dynamic> research = [
    {"name": "Standards"},
    {"name": "Fish"},
    {"name": "Livestock"},
    {"name": "Flowers"},
  ];

  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final desktopSalesData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    return [
      // Blue bars with a lighter center color.
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        // color: charts.ColorUtil.fromDartColor(Colors.white),
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
            Color(0xff4b7447)), //charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xff4b7447)),
      ),
      // Solid red bars. Fill color will default to the series color if no
      // fillColorFn is configured.
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
            Color(0xff92d228)), //charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xff92d228)),
      ),
      // Hollow green bars.
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
            Color(0xffefce1e)), //charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xffefce1e)),
      ),
    ];
  }

  static List<charts.Series<LinearSales, int>> _createSamplePieData() {
    final random = new Random();

    final data = [
      new LinearSales(0, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(1, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xffefce1e))),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, _) => sales.color,
        data: data,
        // colorFn: (_, __) =>  charts.ColorUtil.fromDartColor(Color(0xff92d228)),//charts.MaterialPalette.blue.shadeDefault,
        // fillColorFn: (_, __) =>
        //     charts.ColorUtil.fromDartColor(Color(0xff92d228)),
      )
    ];
  }

  static List<charts.Series<LinearSales, int>> _createSampleLineChartData() {
    final random = new Random();
    final myFakeDesktopData = [
      new LinearSales(0, random.nextInt(1000),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(1, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(2, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(3, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
    ];

    var myFakeTabletData = [
      new LinearSales(0, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(1, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(2, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(3, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
    ];

    var myFakeMobileData = [
      new LinearSales(0, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(1, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(2, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(3, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
    ];
    var myFakeMobileData2 = [
      new LinearSales(0, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(1, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(2, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
      new LinearSales(3, random.nextInt(100),
          charts.ColorUtil.fromDartColor(Color(0xff4b7447))),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',

        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
            Color(0xff4b7447)), //charts.MaterialPalette.blue.shadeDefault,

        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xff4b7447)),
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
            Color(0xff92d228)), //charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xff92d228)),
      ),
      new charts.Series<LinearSales, int>(
        id: 'Mobile',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xffefce1e)),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xffefce1e)),
      ),
      new charts.Series<LinearSales, int>(
        id: 'Farm inputs',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData2,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff0f065e)),
        fillColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color(0xff0f065e)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Widget grouped() {
      return Container(
          // color: Colors.white,
          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 170,
          child: charts.BarChart(
            seriesList,
            animate: true,
            // Configure a stroke width to enable borders on the bars.
            defaultRenderer: new charts.BarRendererConfig(
                groupingType: charts.BarGroupingType.grouped,
                strokeWidthPx: 2.0),
          ));
    }

    Widget chart1() {
      return Container(
          // color: Colors.white,
          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 170,
          child: charts.BarChart(
            seriesList,
            animate: true,

            // Configure a stroke width to enable borders on the bars.
            defaultRenderer: new charts.BarRendererConfig(
                groupingType: charts.BarGroupingType.grouped,
                strokeWidthPx: 2.0),
          ));
    }

    Widget pieChart() {
      List<charts.Series<dynamic, num>> seriesList = _createSamplePieData();

      return Container(
          // color: Colors.white,
          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 170,
          child: charts.PieChart(seriesList, animate: true));
    }

    Widget lineChart() {
      List<charts.Series<dynamic, num>> seriesList =
          _createSampleLineChartData();
      return Container(
          // color: Colors.white,
          // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 170,
          child: charts.LineChart(seriesList,
              defaultRenderer: new charts.LineRendererConfig(
                  includeArea: true, stacked: true),
              animate: true));
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Enterprises",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                Icon(Icons.menu),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Text(
              "Budget",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 6),
            Divider(height: 4, color: Theme.of(context).primaryColor),
            SizedBox(height: 6),
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    color: Color(0xffe3ebca),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xff4b7447),
                                  border: Border.all(
                                    color: Color(0xff4b7447),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                            Text(
                              "Sales Kes $salesRevenue",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xff92d228),
                                  border: Border.all(color: Color(0xff92d228)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                            Text(
                              "Production $production",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xffefce1e),
                                  border: Border.all(
                                    color: Color(0xffefce1e),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                            Text(
                              "Expenses Kes $expenses",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: grouped())
                ],
              ),
            ),
            Text(
              "Production",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 6),
            Divider(height: 4, color: Theme.of(context).primaryColor),
            SizedBox(height: 6),
            Container(

              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: Color(0xffe3ebca),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff4b7447),
                                    border: Border.all(
                                      color: Color(0xff4b7447),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Product Sales Kes $productSalesAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff92d228),
                                    border:
                                        Border.all(color: Color(0xff92d228)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Advertisement Kes $advertisementAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xffefce1e),
                                    border: Border.all(
                                      color: Color(0xffefce1e),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Royalties Services $royaltiesServicesAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(width: 10),
                  Expanded(child: chart1())
                ],
              ),
            ),
            Text(
              "Cash Flow",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 6),
            Divider(height: 4, color: Theme.of(context).primaryColor),
            SizedBox(height: 6),
            Container(
              child: Row(
                children: [
                  Container(
                      color: Color(0xffe3ebca),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff4b7447),
                                    border: Border.all(
                                      color: Color(0xff4b7447),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Farm inputs Kes $farmInputsAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff92d228),
                                    border: Border.all(
                                      color: Color(0xff92d228),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Operations",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xffefce1e),
                                    border: Border.all(
                                      color: Color(0xffefce1e),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Transport Kes $transportStorageAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xff0f065e),
                                    border: Border.all(
                                      color: Color(0xff0f065e),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Labour Kes $labourAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(width: 10),
                  Expanded(child: lineChart())
                ],
              ),
            ),
            Text(
              "Inventory",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 6),
            Divider(height: 4, color: Theme.of(context).primaryColor),
            SizedBox(height: 6),
            Container(
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: Color(0xffe3ebca),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFF8EBA43),
                                    border: Border.all(
                                      color: Color(0xFF8EBA43),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Farm Inputs Kes $inventoryInputsamount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xffefce1e),
                                    border: Border.all(
                                      color: Color(0xffefce1e),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                              Text(
                                "Farm Outputs Kes $farmOutputsAmount",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(width: 10),
                  Expanded(child: pieChart())
                ],
              ),
            ),
          ])),
          SliverList(delegate: SliverChildListDelegate([AdWidget(),BottomNav()])),
        ]),
      ),
    );
   }
  //data extraction
  _loadSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final data=prefs.getString('userData');
      final jsonResponse = jsonDecode(data!);
      token = jsonResponse['token'];

      getData();
    });
  }
  getData() async {
    endPoint=GET_REPORTS+"$token";
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      setState(() {
        reportData = response.body;
      });
      final json=jsonDecode(reportData);
      print(reportData);
      salesRevenue=json[0]["reports"][0]["amount"];
      salesRevenueId=json[0]["reports"][0]["id"];
      production=json[0]["reports"][2]["amount"];
      productionId=json[0]["reports"][2]["id"];
      expenses=json[0]["reports"][1]["amount"];
      expensesId=json[0]["reports"][1]["id"];
      ///income
      productSalesAmount=json[1]["reports"][2]["amount"];
      productSalesId=json[1]["reports"][2]["id"];
      advertisementAmount=json[1]["reports"][0]["amount"];
      advertisementId=json[1]["reports"][0]["id"];
      royaltiesServicesAmount=json[1]["reports"][1]["amount"];
      royaltiesServicesId=json[1]["reports"][1]["id"];
      /// expense
      farmInputsAmount=json[3]["reports"][1]["amount"];
      farmInputsId=json[3]["reports"][1]["id"];
      labourAmount=json[3]["reports"][2]["amount"];
      labourId=json[3]["reports"][2]["id"];
      transportStorageAmount=json[3]["reports"][0]["amount"];
      transportStorageId=json[3]["reports"][0]["id"];
      ///Inventory
      inventoryInputsamount=json[2]["reports"][0]["amount"];
      inventoryInputsId=json[2]["reports"][0]["id"];
      farmOutputsAmount=json[2]["reports"][1]["amount"];
      farmOutputsId=json[2]["reports"][1]["id"];

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
  pieChart(){

  }
}
