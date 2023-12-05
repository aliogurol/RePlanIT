import 'package:flutter/material.dart';

class AdviceActionsServerGroup extends StatelessWidget {
  final String serverGroup;

  const AdviceActionsServerGroup({Key? key, required this.serverGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          _buildTableRow('Server Groups', 'Status', 'Group Action', isHeader: true),
          _buildTableRow(serverGroup, 'Ineffective', 'A1 Replace 3 servers by 1 next-generation model'),
          _buildTableRow(serverGroup, 'Slow', 'A2 Upgrade all RAM to xxxx'),
          _buildTableRow(serverGroup, 'Ineffective', 'A3 Decrease capacity by 10%'),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String column1, String column2, String column3, {bool isHeader = false}) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 60, 8),
            child:isHeader 
              ? Text(column1, style:TextStyle(fontWeight: FontWeight.bold)) 
              : _buildTableCellChild(column1),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(column2, style: isHeader? TextStyle(fontWeight: FontWeight.bold) : null),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(column3, style: isHeader? TextStyle(fontWeight: FontWeight.bold) : null),
          ),
        ),
      ],
    );
  }

  Widget _buildTableCellChild(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.zero,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
