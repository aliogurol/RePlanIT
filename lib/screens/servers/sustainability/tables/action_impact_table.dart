import 'package:flutter/material.dart';

class ActionImpactTable extends StatefulWidget {
  final List<Map> actionList;
  final Function(List<String> selectedCheckboxes) onSelectionChanged;

  ActionImpactTable({required this.actionList, required this.onSelectionChanged});

  @override
  _ActionImpactTableState createState() => _ActionImpactTableState();
}

class _ActionImpactTableState extends State<ActionImpactTable> {
  late List<bool> selectedCheckboxes;

  @override
  void initState() {
    super.initState();
    selectedCheckboxes = List.generate(widget.actionList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Checkbox(
                        value: selectedCheckboxes.every((element) => element),
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxes = List.generate(widget.actionList.length, (index) => value ?? false);
                            widget.onSelectionChanged(_getImpactReplacementTable());
                          });
                        },
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('select all actions'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(150, 8, 8, 8),
                      child: Column(
                        children: [
                          Text('POSSIBLE SAVINGS 2024',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                          Text('Impact of your selected actions, within the first year',
                            style: TextStyle(color: Colors.green, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('')),
              DataColumn(label: Column(
                children: [
                  Text('Actions', style: boldStyle),
                ],
              )),
              DataColumn(label: Column(
                children: [
                  Text('CO2', style: boldStyle),
                  Text('(${widget.actionList.first['unit']})'),
                ],
              )),
              DataColumn(label: Column(
                children: [
                  Text('Energy', style: boldStyle),
                  Text('(${widget.actionList.firstWhere((element) => element['scenario'].toString().contains('A2'))['unit']})'),
                ],
              )),
              DataColumn(label: Column(
                children: [
                  Text('E-waste', style: boldStyle),
                  Text('(${widget.actionList.last['unit']})'),
                ],
              )),
            ],
            rows: _buildDataRows(),
          ),
          // Add a total row
        ],
      ),
    );
  }

  List<DataRow> _buildDataRows() {
    TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);
    TextStyle greenStyle = TextStyle(color: Colors.green);
    TextStyle greenBoldStyle = TextStyle(color: Colors.green,fontWeight: FontWeight.bold);
    List<DataRow> dataRows = [];
    for (int i = 0; i < widget.actionList.length; i++) {
      dataRows.add(DataRow(
        cells: [
          DataCell(
            Checkbox(
              value: selectedCheckboxes[i],
              onChanged: (bool? value) {
                setState(() {
                  selectedCheckboxes[i] = value ?? false;
                  widget.onSelectionChanged(_getImpactReplacementTable());
                });
              },
            ),
          ),
          DataCell(Container(width: 180, child: Text(widget.actionList[i]['scenario'], style: greenStyle))),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.actionList[i]['CO2Emissions'], style: greenStyle),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.actionList[i]['EnergyConsuption'], style: greenStyle),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.actionList[i]['EWasteCreated'], style: greenStyle),
          )),
        ],
      ));
    }

    dataRows.add(
      DataRow(
        cells: [
          DataCell(Text('')), // This cell is for the checkbox column, leave empty
          DataCell(Text('Total', style: greenBoldStyle)),
          DataCell(Text('-46,8 CO2 eq.', style: greenBoldStyle)), // You can calculate and display the total CO2 here
          DataCell(Text('-159 MWh', style: greenBoldStyle)), // You can calculate and display the total Energy here
          DataCell(Text('220 kg', style: greenBoldStyle)), // You can calculate and display the total E-waste here
        ],
      ),
    );
    return dataRows;
  }

  List<String> _getImpactReplacementTable() {
    List<String> selectedScenarios = [];
    for (int i = 0; i < widget.actionList.length; i++) {
      if (selectedCheckboxes[i]) {
        selectedScenarios.add(widget.actionList[i]['scenario']);
      }
    }
    return selectedScenarios;
  }
}
