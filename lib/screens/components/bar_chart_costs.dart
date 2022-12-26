import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class BarChartCosts extends StatelessWidget {
  const BarChartCosts({Key? key}) : super(key: key);

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
                  // if (true) {
                    return 'Costs';
                  // } if (value == 4) {
                  //   return 'CO2eq';
                  // }if (value == 6) {
                  //   return 'Costs';
                  // } if (value == 8) {
                  //   return 'Performance';
                  // }if (value == 10) {
                  //   return 'Lifetime';
                  // // }if (value == 12) {
                  // //   return 'jan 16';
                  // // }if (value == 14) {
                  // //   return 'jan 18';
                  // }else {
                  //   return '';
                  // }
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
                  return '1K';
                } if (value == 6) {
                  return '2K';
                } if (value == 10) {
                  return '3K';
                }if (value == 14) {
                  return '4K';
                }else {
                  return '';
                }
              })
        ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: 10,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5)
            ),
            BarChartRodData(
              y: 3,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5)
            )
          ]),
          // BarChartGroupData(x: 2, barRods: [
          //   BarChartRodData(
          //       y: 3,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 3, barRods: [
          //   BarChartRodData(
          //       y: 12,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 4, barRods: [
          //   BarChartRodData(
          //       y: 8,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 5, barRods: [
          //   BarChartRodData(
          //       y: 6,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 6, barRods: [
          //   BarChartRodData(
          //       y: 10,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 7, barRods: [
          //   BarChartRodData(
          //       y: 16,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 8, barRods: [
          //   BarChartRodData(
          //       y: 6,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 9, barRods: [
          //   BarChartRodData(
          //       y: 4,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 10, barRods: [
          //   BarChartRodData(
          //       y: 9,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 11, barRods: [
          //   BarChartRodData(
          //       y: 12,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 12, barRods: [
          //   BarChartRodData(
          //       y: 2,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 13, barRods: [
          //   BarChartRodData(
          //       y: 13,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
          // BarChartGroupData(x: 14, barRods: [
          //   BarChartRodData(
          //       y: 15,
          //       width: 20,
          //       colors: [primaryColor],
          //       borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
        ]));
  }
}
