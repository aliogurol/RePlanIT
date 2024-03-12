import 'package:flutter/material.dart';

class AdviceActionsServerGroup extends StatelessWidget {
  final String serverGroup;

  const AdviceActionsServerGroup({Key? key, required this.serverGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle greenStyle = TextStyle(color: Colors.green);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          _buildTableRow('Server Group', Text('Datacenter Actions', style: TextStyle(fontWeight: FontWeight.bold),), extraWidget: Text('Server Group', style:TextStyle(fontWeight: FontWeight.bold))),
          _buildTableRow(serverGroup, Text('A1  Change power settings to balance mode', style: greenStyle), extraWidget: _buildTableCellChild(serverGroup)),
          _buildTableRow(serverGroup, Text('A2 Decrease capacity by 25%',style: greenStyle)),
          _buildTableRow(serverGroup, Text('A3 Replace 93 servers by 31 next generation model',style: greenStyle)),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String column1, Text column2, {Widget ?extraWidget}) {
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
            child: column2
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
