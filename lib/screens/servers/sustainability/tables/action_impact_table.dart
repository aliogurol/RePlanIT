import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/helpers/text_helper.dart';

class ActionImpactTable extends StatefulWidget {
  final List<Map> actionList;
  final Function( List<Map<String, dynamic>> selectedCheckboxes) onSelectionChanged;

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('POTENTIAL SAVINGS 2024',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                          Text(splitTextIntoLines('Impact of your selected actions, within the first year* For an assumed lifetime of 6 years', 55),
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
                  Text('CO₂ Emissions*', style: boldStyle),
                  Text('(${widget.actionList.first['unit']})'),
                ],
              )),
              DataColumn(label: Column(
                children: [
                  Text('Energy consumption', style: boldStyle),
                  Text('(${widget.actionList.firstWhere((element) => element['scenario'].toString().contains('A2'))['unit']})'),
                ],
              )),
              DataColumn(label: Column(
                children: [
                  Text('E-waste created', style: boldStyle),
                  Text('(${widget.actionList.last['unit']})'),
                ],
              )),
            ],
            rows: _buildDataRows(),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('*The production impact is spread over a total lifetime of 6 years.', style: TextStyle(fontSize: 10)),
                Text('** The numbers for consecutive actions, assume that previous actions are executed too.',style: TextStyle(fontSize: 10))
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> _buildDataRows() {
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
          DataCell(Text('')),
          DataCell(Text('TOTAL IMPACT', style: greenBoldStyle)),
          DataCell(Text('-46,8 CO₂ eq.', style: greenBoldStyle)),
          DataCell(Text('-159 MWh', style: greenBoldStyle)), 
          DataCell(Text('220 kg', style: greenBoldStyle)),
        ],
      ),
    );
    return dataRows;
  }

  List<Map<String, dynamic>>_getImpactReplacementTable() {
   List<Map<String, dynamic>> selectedScenarios = [];
    for (int i = 0; i < widget.actionList.length; i++) {
      if (selectedCheckboxes[i]) {
        selectedScenarios.add({
          'action': widget.actionList[i]['scenario']
        });
      }
    }
    return selectedScenarios;
  }
}
