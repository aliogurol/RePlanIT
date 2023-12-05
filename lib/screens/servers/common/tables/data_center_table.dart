import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';

class DataCenterTable extends StatefulWidget {
  final ServerData server;

  const DataCenterTable({required this.server});
  @override
  State<DataCenterTable> createState() => _DataCenterTableState();
}

class _DataCenterTableState extends State<DataCenterTable> {
  String? selectedDropdownValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current Performance of ' + widget.server.farmName),
          SizedBox(height: 20,),
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              _buildTableRow('Current workload', '8000 Tb/s', null),
              _buildTableRow('Memory usage', '30 %', Colors.orange),
              _buildTableRow('CPU usage','30 %', Colors.orange),
              _buildTableRow('Power draw', '10' ,null),
              _buildTableRow('STATUS', 'ineffective', Colors.orange),
              _buildTableRow('ADVISED ACTIONS', '7', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, Color? textColor) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 50, 8),
            child: Text(label, style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
