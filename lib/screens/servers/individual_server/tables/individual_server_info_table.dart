import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';

enum TableContentType {
  dynamicContent,
  staticContent,
  impactContent,
}

class IndividualServerInfoTable extends StatefulWidget {
  final ServerData server;
  final TableContentType contentType;

  const IndividualServerInfoTable({
    required this.server,
    required this.contentType,
  });

  @override
  State<IndividualServerInfoTable> createState() =>
      _IndividualServerInfoTableState();
}

class _IndividualServerInfoTableState extends State<IndividualServerInfoTable> {
  String? selectedDropdownValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
            child: _buildHeader(),
          ),
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: _buildTableData(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    switch (widget.contentType) {
      case TableContentType.dynamicContent:
        return Text('');
      case TableContentType.staticContent:
        return Text('Static data of server ' + widget.server.name, style: bold,);
      case TableContentType.impactContent:
        return Text(
          'POSSIBLE SAVINGS Q1 2023',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
    }
  }

  List<TableRow> _buildTableData() {
    switch (widget.contentType) {
      case TableContentType.dynamicContent:
        return _buildDynamicData();
      case TableContentType.staticContent:
        return _buildStaticData();
      case TableContentType.impactContent:
        return _getImpact();
    }
  }

  List<TableRow> _buildDynamicData() => [
        _buildTableRow(Text('Current workload', style: bold), Text('8000 Tb/s')),
        _buildTableRow(Text('Memory usage', style: bold), Text('30 %')),
        _buildTableRow(Text('CPU usage', style: bold), Text('30 %')),
        _buildTableRow(Text('Power draw', style: bold), Text('10'),),
        _buildTableRow(Text('Energy Consumption per year', style: bold), Text('100 kWh')),
        _buildTableRow(Text('Current status', style: bold), Text( 'slow',style: boldOrange)),
        _buildTableRow(Text('Advised actions', style: bold), Text('Change to Eco Mode', style: boldGreen)),
      ];

  List<TableRow> _buildStaticData() => [
        _buildTableRow(Text('CPU capacity', style: bold), Text('800 cores xxx TDF')),
        _buildTableRow(Text('Memory usage', style: bold), Text('30.000 GB')),
        _buildTableRow(Text('Power management setting', style: bold), Text('off')),
        _buildTableRow(Text('End of Contract', style: bold), Text('24-09-13')),
      ];

  List<TableRow> _getImpact() => [
    TableRow(
      children: ['Actions', 'Co2', 'Energy', 'E-waste']
          .map((header) => _buildTableCell(Text(header, style: bold)))
          .toList(),
    ),
    TableRow(
      children: ['Change to Eco mode', '-11', '100', '2']
          .map((value) => _buildTableCell(Text(value)))
          .toList(),
    ),
    TableRow(
      children: ['TOTAL', '22', '100', '23']
          .map((value) => _buildTableCell(Text(value)))
          .toList(),
    )
  ];

  TableRow _buildTableRow(Text text1, Text text2) 
    =>  TableRow(
          children: [
            _buildTableCell(text1),
            _buildTableCell(text2),
          ],
        );

  Widget _buildTableCell(Text text) 
    =>  TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: text
          ),
        );
}
