import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class BarChartLifeTime extends StatelessWidget {
  const BarChartLifeTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(border: Border.all(width: 0)),
        groupsSpace: 15,
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                showTitles: true,
                // getTextStyles: (value) => const TextStyle(
                //       color: lightTextColor,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 12,
                //     ),
                margin: appPadding,
                getTitles: (double value) {
                    return 'LifeTime';
                }),
          leftTitles: SideTitles(
              showTitles: true,
              // getTextStyles: (value) => const TextStyle(
              //   color: lightTextColor,
              //   fontWeight: FontWeight.bold,
              //   fontSize: 12,
              // ),
              margin: appPadding,
              getTitles: (double value) {
                if (value == 2) {
                  return '10';
                } if (value == 6) {
                  return '20';
                } if (value == 10) {
                  return '30';
                }if (value == 14) {
                  return '40';
                }else {
                  return '';
                }
              })
        ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: 8,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5)
            ),
            BarChartRodData(
              y: 4,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5)
            )
          ]),
        ]));
  }
}
