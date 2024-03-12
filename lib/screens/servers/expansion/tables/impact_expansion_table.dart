import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ImpactExpansionTable extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServers;

  ImpactExpansionTable({required this.selectedServers});

  List<Map<String, dynamic>> getSelectedServers() {
    List<Map<String, dynamic>> selectedData = [];

    for (Map<String, dynamic> serverData in selectedServers) {
      bool isSelected = serverData['isSelected'] ?? false;

      if (isSelected) {
        selectedData.add({
          'server': serverData['server'],
          'action': serverData['action'],
          'totalGHGEmission': serverData['totalGHGEmission'],
          'energy': serverData['energy'],
          'eWaste': serverData['eWaste'],
        });
      }
    }

    return selectedData;
  }
  
  @override
  _ImpactExpansionTableState createState() => _ImpactExpansionTableState();
}

class _ImpactExpansionTableState extends State<ImpactExpansionTable> {
  List<TableRow> _buildTableRows() {
    return widget.selectedServers.map((serverData) {
      return TableRow(
        children: [
          TableCell(
            child: Center(
              child: Container(
                width: 250,
                child: Text(
                  serverData['scenario'],
                  style: serverData['style'],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(child: Text(serverData['totalGHGEmission'], style: serverData['style'])),
          ),
          TableCell(
            child: Center(child: Text(serverData['energy'], style: serverData['style'])),
          ),
          TableCell(
            child: Center(child: Text(serverData['eWaste'], style: serverData['style'])),
          ),
        ],
      );
    }).toList();
  }

  List<LineChartBarData> _buildLineChartData() {
    List<LineChartBarData> lineBarsData = [];

    widget.selectedServers.asMap().forEach((index, serverData) {
      List<FlSpot> spots = [];
      double cumulativeGHG = 900; // Set the desired starting value

      for (int year = 0; year <= 10; year++) {
        if (year == 1 && index == 0) {
          cumulativeGHG += 3100; // Increase more rapidly in the first year for the first scenario
        }
        
        if (year > 1 && index == 0) {
          cumulativeGHG += 50; // Increase more rapidly in the first year for the first scenario
        }

        if (year == 1 && index == 1) {
          cumulativeGHG += 2300; // Increase more rapidly in the first year for the second scenario
        }

        if (year > 1 && index == 1) {
          cumulativeGHG += 130; // Increase more rapidly in the first year for the second scenario
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
        isCurved: false, // Set to false for straight lines
        colors: [serverData['style'].color!],
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
      );

      lineBarsData.add(lineChartBarData);
    });

    return lineBarsData;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Selected Expansion Scenarios', style: boldStyle),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('GHG emissions (kg CO2)', style: boldStyle),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Energy (kWh)', style: boldStyle),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('E-waste (kg)', style: boldStyle),
                    ),
                  ),
                ],
              ),
              ...widget.selectedServers.isEmpty ? [] : _buildTableRows(),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width/2, // Set a specific width here
            padding: const EdgeInsets.all(8.0),
            child:LineChart(
            LineChartData(
              gridData: FlGridData(show: true, horizontalInterval: 1000),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  // getTextStyles: (value) => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                  getTitles: (value) {
                    if (value == -3000 || value == -2000 || value == -1000 || value == 0 || value == 1000 || value == 2000 || value == 3000) {
                      return value.toString();
                    }
                    return '';
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  // getTextStyles: (value) => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
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
              lineBarsData: _buildLineChartData(),
              backgroundColor: const Color(0xFF5197A7).withOpacity(0.26), // Background color hex code
            ),
          )
        ),
        ],
      ),
    );
  }
}
