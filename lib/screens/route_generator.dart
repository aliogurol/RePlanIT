import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/screens/dash_board_screen.dart';
import 'package:responsive_admin_dashboard/screens/landing_screen.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_graph_screen.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_savings_screen.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_screen.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_values_screen.dart';
import 'package:responsive_admin_dashboard/screens/market_place_screen.dart';
import 'package:responsive_admin_dashboard/screens/login_screen.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/positive_impact_report_copy.dart';

import 'laptop_screen.dart';


class MyRoutes {
  static Route<dynamic> generateRotes(RouteSettings setting){
  print(setting.name);
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
      case Responsive.landingScreen:
        print('Navigated to LandingScreen');
        return MaterialPageRoute(builder: ((context) => LandingScreen()));
      case Responsive.laptopScreen:
        print('Navigated to LaptopScreen');
        return MaterialPageRoute(builder: ((context) => LaptopScreen()));
      case Responsive.laptopComparingScreen:
        print('Navigated to laptopComparingScreen');
        return MaterialPageRoute(builder: ((context) => LaptopComparingScreen()));      
      case Responsive.laptopComparingScreenValues:
        print('Navigated to laptopComparingScreenValues');
        return MaterialPageRoute(builder: ((context) => LaptopComparingValuesScreen()));        
      case Responsive.laptopComparingSavingsScreen:
        print('Navigated to laptopComparingSavingsScreen');
        return MaterialPageRoute(builder: ((context) => LaptopComparingSavingsScreen()));
      case Responsive.laptopComparingGraphScreen:
        print('Navigated to laptopComparingGraphScreen');
        return MaterialPageRoute(builder: ((context) => LaptopComparingGraphScreen()));
      case Responsive.positiveImpactReport:
        print('Navigated to reportScreen');
        return MaterialPageRoute(builder: ((context) => PositiveImpactReport()));
      default:
    }
    return MaterialPageRoute(builder:(context) => Scaffold(
      body: Text("Np route defined"),
    ),);
  }
}