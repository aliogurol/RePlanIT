import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

import 'bar_chart_costs.dart';
import 'bar_chart_circularity.dart';
import 'bar_chart_CO2.dart';
import 'bar_chart_performance.dart';
import 'bar_chart_lifetime.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Expanded(
            child: BarChartCosts(),
          ),
          Expanded(
            child: BarChartCO2(),
          ),
          Expanded(
            child: BarChartCircularity(),
          ),
          Expanded(
            child: BarChartPerformance(),
          ),
          Expanded(
            child: BarChartLifeTime(),
          ),
        ],
      ),
    );
  }
}
