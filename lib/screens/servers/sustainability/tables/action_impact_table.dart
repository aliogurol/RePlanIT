import 'package:flutter/material.dart';

class ActionImpactTable extends StatefulWidget {
  final List<String> actionList;
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
                      padding: const EdgeInsets.fromLTRB(100, 8, 8, 8),
                      child: Text('POSSIBLE SAVINGS Q1 2023',style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              )
            ],
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('')),
              DataColumn(label: Text('Actions', style: boldStyle)),
              DataColumn(label: Text('CO2', style: boldStyle)),
              DataColumn(label: Text('Energy', style: boldStyle)),
              DataColumn(label: Text('E-waste', style: boldStyle)),
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
    List<DataRow> dataRows = [];
    for (int i = 0; i < widget.actionList.length; i++) {
      String action = widget.actionList[i];
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
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(action, style: greenStyle),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('-11', style: greenStyle),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('-100', style: greenStyle),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('250', style: greenStyle),
          )),
        ],
      ));
    }

    dataRows.add(
      DataRow(
        cells: [
          DataCell(Text('')), // This cell is for the checkbox column, leave empty
          DataCell(Text('Total', style: boldStyle)),
          DataCell(Text('-500 CO2 eq')), // You can calculate and display the total CO2 here
          DataCell(Text('-2000 kWh')), // You can calculate and display the total Energy here
          DataCell(Text('2340 kg')), // You can calculate and display the total E-waste here
        ],
      ),
    );
    return dataRows;
  }

  List<String> _getImpactReplacementTable() {
    List<String> selectedScenarios = [];
    for (int i = 0; i < widget.actionList.length; i++) {
      if (selectedCheckboxes[i]) {
        selectedScenarios.add(widget.actionList[i]);
      }
    }
    return selectedScenarios;
  }
}
