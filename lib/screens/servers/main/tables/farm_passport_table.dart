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
          Text('Datacenter Passport'),
          SizedBox(height: 20),
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              _buildTableRow('Datacenter name', name),
              _buildTableRow('Datacenter Location', location),
              _buildTableRow('Datacenter Size', '127 servers'),
              _buildTableRow('CPU Capacity', '12,801 GHz'),
              _buildTableRow('Memory Capacity', '96 TB'),
              _buildTableRow('Energy Consumption per year', '350 MWh'),
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