import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  static const String homeScreen = '/';
  static const String loginScreen = '/login';
  static const String marketPlaceScreen = '/market_place';
  static const String dashBoardScreen = '/dash_board';
  static const String landingScreen = 'landing';
  static const String laptopScreen = 'laptop';
  static const String laptopComparingScreen = 'laptop_comparing';
  static const String laptopComparingScreenValues = '/laptop_comparing_values';
  static const String laptopComparingSavingsScreen = '/laptop_comparing_savings';
  static const String laptopComparingGraphScreen = '/laptop_comparing_graph';
  static const String positiveImpactReport = '/positive_impact_report';
  static const String serversMain = 'data_center';
  static const String replacementImpact = 'replecament_impact';
  static const String expansionImpact = 'expansion_impact';
  static const String sustainability= 'sustainability';
  static const String individualServerInfo= 'individual_server';

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);


  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) {
      return desktop;
    }
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    else {
      return mobile;
    }
  }
}
