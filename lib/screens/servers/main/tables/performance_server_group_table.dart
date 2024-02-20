import 'package:flutter/material.dart';

class PerformanceServerGroupTable extends StatefulWidget {

  @override
  State<PerformanceServerGroupTable> createState() => _PerformanceServerGroupTableState();
}

class _PerformanceServerGroupTableState extends State<PerformanceServerGroupTable> {
  String? selectedDropdownValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          _buildTableRow('Memory usage', '45 %', textColor: Colors.orange),
          _buildTableRow(
            'Max CPU usage',
            '36 %',
            additionalText: '(Monday 9-10-2023, 14:23 hours)',
            textColor: Colors.orange,
          ),
          _buildTableRow(
            'Min CPU usage',
            '20 %',
            additionalText: '(Sunday 8-10-2023, 02:54 hours)',
            textColor: Colors.orange,
          ),
          _buildTableRow('Power draw', '40 kWatt'),
          _buildTableRow('', '',),
          _buildTableRow('', '',),
          _buildTableRow('ADVISED ACTIONS', '3 actions',
          additionalText: 'Improve the effectiveness and efficiency of this server group by these actions.',
          textColor: Colors.green),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, {String? additionalText, Color? textColor, Widget? additionalWidget}) {
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
                if (additionalText != null)
                  Text(
                    additionalText,
                    style: TextStyle(fontSize: 10),
                  ),
              ],
            ),
          ),
        ),
        TableCell(
          child: Container(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  value,
                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 30,),
                additionalWidget ?? SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
