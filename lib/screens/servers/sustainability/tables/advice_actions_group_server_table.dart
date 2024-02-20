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
          _buildTableRow('Server Group', 'Group Actions', extraWidget: Text('Server Group', style:TextStyle(fontWeight: FontWeight.bold))),
          _buildTableRow(serverGroup, 'A1 Decrease capacity by 25%', extraWidget: _buildTableCellChild(serverGroup)),
          _buildTableRow(serverGroup, 'A2 Change power settings to balance mode'),
          _buildTableRow(serverGroup, 'A3 Replace 127 servers by 43 next generation model'),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String column1, String column2, {Widget ?extraWidget}) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 60, 8),
            child: extraWidget
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(column2),
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
