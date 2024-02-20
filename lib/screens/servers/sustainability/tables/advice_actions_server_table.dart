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
                  child: Text('Action Advice'),
                ),
              ),
            ],
          ),
          _buildTableRow('123', 'A4 Change to balance mode', context),
          _buildTableRow('234', 'A5 Switch off', context),
          _buildTableRow('988', 'A6 Replace', context),
          _buildTableRow('223', 'A7 Replace', context),
          _buildTableRow('356', 'A5 Swithc off', context),
          _buildTableRow('Server x', 'x', context),
          _buildTableRow('x', 'x', context),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String column1, String column2, BuildContext context) {
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
