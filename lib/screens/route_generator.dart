import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/main.dart';
import 'package:responsive_admin_dashboard/screens/dash_board_screen.dart';
import 'package:responsive_admin_dashboard/screens/market_place_screen.dart';
import 'package:responsive_admin_dashboard/screens/login_screen.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';


class MyRoutes {
  static Route<dynamic> generateRotes(RouteSettings setting){
    switch (setting.name) {
      // case Responsive.homeScreen:
      //   return MaterialPageRoute(builder: ((context) => HomePage()));
      case Responsive.marketPlaceScreen:
        print('Navigated to MarketPlaceScreen');
        return MaterialPageRoute(builder: ((context) => MarketPlaceScreen()));
      case Responsive.loginScreen:
        print('Navigated to LoginScreen');
        return MaterialPageRoute(builder: ((context) => LoginScreen()));
      case Responsive.dashBoardScreen:
        print('Navigated to DashboardScreen');
        return MaterialPageRoute(builder: ((context) => DashBoardScreen()));
      default:
    }
    return MaterialPageRoute(builder:(context) => Scaffold(
      body: Text("Np route defined"),
    ),);
  }
}