import 'package:farmers_network/pages/BusinessDataEntry.dart';
import 'package:farmers_network/pages/MoreFeatures.dart';
import 'package:flutter/material.dart';
import 'Addproduct.dart';
import 'AdjustedPages/ProfilePage.dart';
import 'Dashboard.dart';
// import 'FarmProfilePage.dart';
import 'Market.dart';
import 'messages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    DashboardPage(),
    BusinessDataEntry(),
    Chat(),
    // Addproduct(),
    Market(),
    /*MoreFeatures()*/
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.grey),
                label: ('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_sharp, color: Colors.grey),
                label: ('Reports')),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_outlined,
                    color: Colors.grey),
                label: ('Chat')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                label: ('Market')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
                label: ('Account')),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) async {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
