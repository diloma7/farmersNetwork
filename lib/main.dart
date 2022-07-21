import 'package:farmers_network/pages/Addproduct.dart';
import 'package:farmers_network/pages/AdjustedPages/AdjustedLanding.dart';
import 'package:farmers_network/pages/AdjustedPages/Program.dart';
// import 'package:farmers_network/pages/AdjustedPages/Program.dart';
import 'package:farmers_network/pages/AdjustedPages/ProfilePage.dart';
import 'package:farmers_network/pages/AdminProfile.dart';
import 'package:farmers_network/pages/BusinessDataEntry.dart';
import 'package:farmers_network/pages/Dashboard.dart';
import 'package:farmers_network/pages/FarmProfilePage.dart';
import 'package:farmers_network/pages/FarmSupportProviders.dart';
import 'package:farmers_network/pages/Forums.dart';
import 'package:farmers_network/pages/HomePage.dart';
import 'package:farmers_network/pages/LoyaltyProgram.dart';
import 'package:farmers_network/pages/Market.dart';
import 'package:farmers_network/pages/MarketList.dart';
import 'package:farmers_network/pages/ServiceProviderProfilePage.dart';
import 'package:farmers_network/pages/ServiceProvidersCategories.dart';
import 'package:farmers_network/pages/ServiceProvidersRegistration.dart';
import 'package:farmers_network/pages/ServicesProviders.dart';
import 'package:farmers_network/pages/ServicesProvidersList.dart';
import 'package:farmers_network/pages/forgot_password_page.dart';
import 'package:farmers_network/pages/forgot_password_verification_page.dart';
import 'package:farmers_network/pages/forum_comments.dart';
import 'package:farmers_network/pages/reports.dart';
import 'package:farmers_network/pages/registration_page.dart';
import 'package:farmers_network/pages/resources.dart';
import 'package:farmers_network/pages/widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// import 'models/ReportCrud.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(LoginUiApp());
}

// ignore: must_be_immutable
class LoginUiApp extends StatelessWidget {
  Color _primaryColor = const Color(0xFF4b7344);
  Color _accentColor = const Color(0xff8EBA43);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Farmer Networks',
          theme: ThemeData(
            primaryColor: _primaryColor,
            accentColor: _accentColor,
            scaffoldBackgroundColor: Colors.green,
            primarySwatch: Colors.grey,
          ),
          home: SplashScreen(title: 'Farmer Networks'),
        );
      },
    );
  }
}
