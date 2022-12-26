import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class BarChartCO2 extends StatelessWidget {
  const BarChartCO2({Key? key}) : super(key: key);

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
                    return 'CO2';
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
              y: 5,
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
