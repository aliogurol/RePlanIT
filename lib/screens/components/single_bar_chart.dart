import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VerticalBarChart extends StatelessWidget {
  final List<double> data;
  final FlTitlesData titlesData;

  VerticalBarChart({
    required this.data,
    required this.titlesData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Expanded(
        child: BarChart(
          BarChartData(
            titlesData: titlesData,
            alignment: BarChartAlignment.center,
            maxY: 100,
            minY: 0,
            barGroups: _buildBarGroups(),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      BarChartGroupData(
        x: 1,
        barsSpace: 8,
        barRods: List.generate(data.length, (index) {
          return BarChartRodData(
            y: data[index],
            colors: [Colors.blue], // You can customize the color here
            borderRadius: BorderRadius.circular(5),
            width: 15,
          );
        }),
      ),
    ];
  }
}

