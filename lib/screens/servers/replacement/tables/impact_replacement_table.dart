import 'package:flutter/material.dart';

class ImpactReplacementTable extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServers;

  ImpactReplacementTable({required this.selectedServers});

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
  _ImpactReplacementTableState createState() => _ImpactReplacementTableState();
}

class _ImpactReplacementTableState extends State<ImpactReplacementTable> {
  List<TableRow> _buildTableRows() {
    TextStyle greenStyle = TextStyle(color: Colors.green);
    return widget.selectedServers.map((serverData) {
      String server = serverData['server'];
      return TableRow(
        children: [
          TableCell(
            child: Checkbox(
              value: serverData['isSelected'] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  serverData['isSelected'] = value;
                });
              },
            ),
          ),
          TableCell(
            child: Center(
              child: Container(
                width: 200, // Adjust the width as needed
                child: Text(
                  'S$server ${serverData['action']}',
                  style: greenStyle,
                  textAlign: TextAlign.center, // Center the text horizontally
                  maxLines: 2, // Adjust as needed or remove for unlimited lines
                  softWrap: true,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(child: Text(serverData['totalGHGEmission'], style: greenStyle)),
          ),
          TableCell(
            child: Center(child: Text(serverData['energy'], style: greenStyle)),
          ),
          TableCell(
            child: Center(child: Text(serverData['eWaste'], style: greenStyle)),
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          TableRow(
            children: [
              TableCell(
                child: SizedBox(), // Empty cell for spacing
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Selected Scenarios', style: boldStyle),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total GHG emissions (kg CO2 eq.)', style: boldStyle),
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
    );
  }
}
