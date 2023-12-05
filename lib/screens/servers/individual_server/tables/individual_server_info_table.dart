import 'package:flutter/material.dart';
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

class _IndividualServerInfoTableState
    extends State<IndividualServerInfoTable> {
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
        return Text('Static data of server ' + widget.server.name);
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
        _buildTableRow('Current workload', '8000 Tb/s', null),
        _buildTableRow('Memory usage', '30 %', null),
        _buildTableRow('CPU usage', '30 %', null),
        _buildTableRow('Power draw', '10', null),
        _buildTableRow('Energy Consumption per year', '100 kWh', null),
        _buildTableRow('Current status', 'slow', Colors.orange),
        _buildTableRow('Advised actions', '1 action', Colors.green),
      ];

  List<TableRow> _buildStaticData() => [
        _buildTableRow('CPU capacity', '800 cores xxx TDF'),
        _buildTableRow('Memory usage', '30.000 GB'),
        _buildTableRow('Power management setting', 'off'),
        _buildTableRow('End of Contract', '24-09-13'),
      ];

  List<TableRow> _getImpact() => [
        _buildHeaderRow(['Actions', 'Co2', 'Energy', 'E-waste']),
        _buildDataRow(['Change to Eco mode', '-11', '100', '2']),
        _buildTotalRow(['Total', '22', '100', '23']),
      ];

  TableRow _buildHeaderRow(List<String> headers) => TableRow(
        children: headers
            .map((header) => _buildTableCell(header, FontWeight.bold))
            .toList(),
      );

  TableRow _buildDataRow(List<String> data) => TableRow(
        children: data
            .map((value) => _buildTableCell(value, null))
            .toList(),
      );

  TableRow _buildTotalRow(List<String> data) => TableRow(
        children: data
            .map((value) => _buildTableCell(value, FontWeight.bold))
            .toList(),
      );

  TableRow _buildTableRow(String label, String value, [Color? textColor]) 
    =>  TableRow(
          children: [
            _buildTableCell(label, FontWeight.bold),
            _buildTableCell(value, null, textColor),
          ],
        );

  Widget _buildTableCell(String text, FontWeight? fontWeight,[Color? textColor]) 
    =>  TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ),
        );
}
