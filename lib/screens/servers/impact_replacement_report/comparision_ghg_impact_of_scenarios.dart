import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class COMPARISIONGHGIMPACTOFSCENARIOS extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServers;

  COMPARISIONGHGIMPACTOFSCENARIOS({required this.selectedServers});

  @override
  _COMPARISIONGHGIMPACTOFSCENARIOSState createState() =>
      _COMPARISIONGHGIMPACTOFSCENARIOSState();
}

class _COMPARISIONGHGIMPACTOFSCENARIOSState extends State<COMPARISIONGHGIMPACTOFSCENARIOS> {
  @override
  Widget build(BuildContext context) {
    final selectedScenario = widget.selectedServers.map((scenario) {
      String scenarioName;
      String totalGHGEmission;
      String energy;
      String eWaste;
      Color color;

      if (scenario['server'] == '123') {
        scenarioName = 'S1 Expand farm with 2 new servers';
        totalGHGEmission = '44';
        energy = '50';
        eWaste = '250';
        color = Colors.blue;
      } else if (scenario['server'] == '124') {
        scenarioName = 'S2 Expand farm with 3 refurbished servers';
        totalGHGEmission = '22';
        energy = '100';
        eWaste = '100';
        color = Colors.green;
      } else {
        scenarioName = 'Baseline: Upgrade 10 current servers (baseline scenario)';
        totalGHGEmission = '10';
        energy = '-30';
        eWaste = '20';
        color = Colors.pink;
      }

      return {
        'scenario': scenarioName,
        'totalGHGEmission': totalGHGEmission,
        'energy': energy,
        'eWaste': eWaste,
        'color': color,
      };
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Comparing replacement and extend lifetime scenario, over time'),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.all(8.0),
          child: LineChart(
            LineChartData(
              axisTitleData: FlAxisTitleData(
                show: true,
                leftTitle: AxisTitle(
                  titleText: 'GHG emissions (kgCO2)', 
                  showTitle: true, 
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                bottomTitle: AxisTitle(
                  titleText: 'Years', 
                  showTitle: true, 
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              gridData: FlGridData(show: true, horizontalInterval: 1000),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitles: (value) {
                    if (value == -3000 ||
                        value == -2000 ||
                        value == -1000 ||
                        value == 0 ||
                        value == 1000 ||
                        value == 2000 ||
                        value == 3000) {
                      return value.toString();
                    }
                    return '';
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTitles: (value) {
                    return value.toInt().toString();
                  },
                  
                ),
              ),
              borderData: FlBorderData(show: true, border: Border.all(color: Colors.black)),
              minX: 0,
              maxX: 10,
              minY: -3000,
              maxY: 5000,
              lineBarsData: _buildLineChartData(selectedScenario),
              backgroundColor: const Color(0xFF5197A7).withOpacity(0.26),
            ),
          ),
        ),
        SizedBox(height: 30,),
        Text('Comparing replacement and extend lifetime scenario, over time'),
        // Container(
        //   height: 300,
        //   width: MediaQuery.of(context).size.width / 2,
        //   padding: const EdgeInsets.all(8.0),
        //   child: LineChart(
        //     LineChartData(
        //       axisTitleData: FlAxisTitleData(
        //         show: true,
        //         leftTitle: AxisTitle(
        //           titleText: 'GHG emissions (kgCO2)', 
        //           showTitle: true, 
        //           textStyle: TextStyle(
        //             fontWeight: FontWeight.bold
        //           )
        //         ),
        //         bottomTitle: AxisTitle(
        //           titleText: 'Years', 
        //           showTitle: true, 
        //           textStyle: TextStyle(
        //             fontWeight: FontWeight.bold
        //           )
        //         )
        //       ),
        //       gridData: FlGridData(show: true, horizontalInterval: 1000),
        //       titlesData: FlTitlesData(
        //         leftTitles: SideTitles(
        //           showTitles: true,
        //           reservedSize: 40,
        //           getTitles: (value) {
        //             if (value == -3000 ||
        //                 value == -2000 ||
        //                 value == -1000 ||
        //                 value == 0 ||
        //                 value == 1000 ||
        //                 value == 2000 ||
        //                 value == 3000) {
        //               return value.toString();
        //             }
        //             return '';
        //           },
        //         ),
        //         bottomTitles: SideTitles(
        //           showTitles: true,
        //           reservedSize: 22,
        //           getTitles: (value) {
        //             return value.toInt().toString();
        //           },
        //         ),
        //       ),
        //       borderData: FlBorderData(show: true, border: Border.all(color: Colors.black)),
        //       minX: 0,
        //       maxX: 10,
        //       minY: -3000,
        //       maxY: 5000,
        //       lineBarsData: _buildLineChartData(selectedScenario),
        //       backgroundColor: const Color(0xFF5197A7).withOpacity(0.26),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  List<LineChartBarData> _buildLineChartData(List<Map<String, dynamic>> selectedScenario) {
    List<LineChartBarData> lineBarsData = [];

    selectedScenario.asMap().forEach((index, scenarioData) {
      List<FlSpot> spots = [];
      double cumulativeGHG = 900; // Set the desired starting value

      for (int year = 0; year <= 10; year++) {
        if (year == 1 && index == 0) {
          cumulativeGHG += 3100; // Increase more rapidly in the first year for the first scenario
        }

        if (year > 1 && index == 0) {
          cumulativeGHG += 50; // Increase more rapidly in subsequent years for the first scenario
        }

        if (year == 1 && index == 1) {
          cumulativeGHG += 2300; // Increase more rapidly in the first year for the second scenario
        }

        if (year > 1 && index == 1) {
          cumulativeGHG += 130; // Increase more rapidly in subsequent years for the second scenario
        }

        if (year == 1 && index == 2) {
          cumulativeGHG += 900; // Increase more rapidly in the first year for the third scenario
        }

        if (year > 1 && index == 2) {
          cumulativeGHG += 350; // Increase more after the first year for the third scenario
        }

        spots.add(FlSpot(year.toDouble(), cumulativeGHG));
      }

      final LineChartBarData lineChartBarData = LineChartBarData(
        spots: spots,
        isCurved: false,
        colors: [scenarioData['color']],
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      );

      lineBarsData.add(lineChartBarData);
    });

    return lineBarsData;
  }
}
