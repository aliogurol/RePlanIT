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
          _buildTableRow('Max workload', 'xx', additionalWidget: _buildDropdown(['Tb/s', 'Queries/s', 'TDC-C'])),
          _buildTableRow('Min workload', 'xx'),
          _buildTableRow('Average workload', 'xx'),
          _buildTableRow('Memory usage', '30 %', textColor: Colors.orange),
          _buildTableRow(
            'Max CPU usage',
            '30 % 1,100 GHz',
            additionalText: '(Monday 9-10-2023, 14:23 hours)',
            textColor: Colors.orange,
          ),
          _buildTableRow(
            'Min CPU usage',
            '30 % 190 GHz',
            additionalText: '(Sunday 8-10-2023, 02:54 hours)',
            textColor: Colors.orange,
          ),
          _buildTableRow('Power draw', '10', textColor: Colors.orange, additionalWidget: _buildDropdown(['Watt', 'kW', 'MW'])),
          _buildTableRow('Energy consumption per year', '100 kWh', textColor: Colors.orange),
          _buildTableRow('', '',),
          _buildTableRow('', '',),
          _buildTableRow('STATUS', 'ineffective', 
          additionalText: 'The current performance of this server group is ineffective',
          textColor: Colors.orange),
          _buildTableRow('ADVISED ACTIONS', '7 actions',
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

  Widget _buildDropdown(List<String> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // Align to the right
      children: [
        DropdownButton<String>(
          value: items.first,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
              setState(() {
                selectedDropdownValue = newValue;
                print(selectedDropdownValue);
              });
          },
        ),
      ],
    );
  }
}
