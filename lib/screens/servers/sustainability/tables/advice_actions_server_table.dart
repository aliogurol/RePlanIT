import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/server.dart';

class AdviceActionsServer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 8, 60, 8),
                  child:  Text('Server ID'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Status'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Action Advice'),
                ),
              ),
            ],
          ),
          _buildTableRow('123', 'Ineffective', 'A4 Change to eco mode', context),
          _buildTableRow('234', 'Slow', 'A5 Change power settings', context),
          _buildTableRow('988', 'Slow', 'A6 Replace server by ref', context),
          _buildTableRow('223', 'Healthy', 'A7 Prolong support contract', context),
          _buildTableRow('356', 'Healthy', '---', context),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String column1, String column2, String column3, BuildContext context) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 60, 8),
            child:  _buildTableCellChild(context,column1),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(column2),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(column3),
          ),
        ),
      ],
    );
  }

  Widget _buildTableCellChild(BuildContext context, String server) {
    return Container(
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.zero,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Responsive.individualServerInfo, arguments: servers.first );
              },
              child: Text('Server ' + server, style: TextStyle(color: Colors.black)),
            ),
          );
  }
}
