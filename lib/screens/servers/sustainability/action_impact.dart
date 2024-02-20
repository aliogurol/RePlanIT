import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/screens/servers/sustainability/tables/action_impact_table.dart';

class ActionImpact extends StatefulWidget {
  final List<Map> actionList;

  ActionImpact({required this.actionList});

  @override
  _ActionImpactState createState() => _ActionImpactState();
}

class _ActionImpactState extends State<ActionImpact> {
  late ActionImpactTable _actionImpactTable;
  List<String> _selectedScenarios = [];

  @override
  void initState() {
    super.initState();
    _actionImpactTable = ActionImpactTable(
      actionList: widget.actionList,
      onSelectionChanged: _onSelectionChanged,
    );
  }

  void _onSelectionChanged(List<String> selectedScenarios) {
    setState(() {
      _selectedScenarios = selectedScenarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _actionImpactTable,
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                List<String> selectedData = _selectedScenarios;
                print(selectedData);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(48, 182, 1, 0.57),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text('Impact Report', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}