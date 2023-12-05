import 'package:flutter/material.dart';

class FarmPassportTable extends StatelessWidget {
  final String name;
  final String location;
  final String size;

  const FarmPassportTable({Key? key, required this.name, required this.location, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Farm Passport'),
          SizedBox(height: 20),
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              _buildTableRow('Farm name', name),
              _buildTableRow('Farm Location', location),
              _buildTableRow('Farm Size', size),
              _buildTableRow('CPU Capacity', '300 cores, xx TDF'),
              _buildTableRow('Memory Capacity', '4000 GB'),
              _buildTableRow('Energy Consumption per year', '10.000 kWh'),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        TableCell(
          child: Container(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              value,
            ),
          ),
        ),
      ],
    );
  }
}             