import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class PlannedExpansion extends StatefulWidget {
  final Function(List<Map<String, dynamic>> selectedData) onSelect;

  PlannedExpansion({required this.onSelect});

  @override
  _PlannedExpansionState createState() => _PlannedExpansionState();
}

class _PlannedExpansionState extends State<PlannedExpansion> {
  Map<String, bool> scenarioSelection = {};
  List<String> selectedScenarios = [];
  bool selectAll = false;
  
  @override
  void initState() {
    super.initState();
    updateselectedScenarios();
  }
      
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text('I plan to'),
            ),
            Text('Expand capacity', style: bold),
            buildRow('CPU capacity', 'Enter CPU', 'cores'),
            buildRow('', 'Enter TDF', 'TDF'),
            buildRow('Memory capacity', 'Enter TB', 'TB'),
            SizedBox(height: 60,),
            Text('Possible scenarios', style: TextStyle(fontWeight: FontWeight.bold),),
            CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Select All'),
              value: selectAll,
              onChanged: (bool? value) => setState(() {
                selectAll = value!;
                updateScenarioSelection();
                widget.onSelect(getSelectedScenario());
              }),
            ),
            for (String server in tempExpansionScenarios)
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(server),
                value: scenarioSelection[server] ?? false,
                onChanged: (bool? value) => setState(() {
                  scenarioSelection[server] = value!;
                  updateSelectAll();
                  widget.onSelect(getSelectedScenario());
                }),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String label, String hintText, String unit) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Container(
          width: 150.0,
          child: Text(label),
        ),
        SizedBox(width: 60.0),
        Container(
          height: 30,
          width: 120.0,
          child: TextField(
            style: TextStyle(fontSize: 12.0),
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 40.0,
          child: Text(unit),
        ),
      ],
    ),
  );

    void updateselectedScenarios() {
    setState(() {
      selectedScenarios = selectAll
          ? []
          : tempExpansionScenarios;
      scenarioSelection = Map.fromEntries(
        selectedScenarios.map((scenario) => MapEntry(scenario, selectAll)),
      );
      widget.onSelect(getSelectedScenario());
    });
  }

  void updateScenarioSelection() {
    setState(() {
      scenarioSelection = Map.fromEntries(
        selectedScenarios.map((scenario) => MapEntry(scenario, selectAll)),
      );
    });
  }

  void updateSelectAll() {
    setState(() {
      selectAll = scenarioSelection.values.every((value) => value);
    });
  }

  List<Map<String, dynamic>> getSelectedScenario() {
        TextStyle blueStyle = TextStyle(color: Color(0xFF1400FF));
    TextStyle greenStyle = TextStyle(color: Color(0xFF018F31));
    TextStyle pinkStyle = TextStyle(color: Color(0xFFFF00C7));
    return selectedScenarios
        .where((scenario) => scenarioSelection[scenario] == true)
        .map((scenario) => {
              'scenario': scenario.contains('S1') ? 'S1 Expand farm with 2 new servers' :
                (scenario.contains('S2') ? 'S2 Expand farm with 3 refurbished servers' : 
                'Baseline: Upgrade 10 current servers (baseline scenario)'),
              'totalGHGEmission': scenario.contains('S1') ? '44' : (scenario.contains('S2') ? '22' : '10'),
              'energy': scenario.contains('S1') ? '50' : (scenario.contains('S2') ? '100' : '-30'),
              'eWaste': scenario.contains('S1') ? '250' : (scenario.contains('S2') ? '100' : '20'),
              'style': scenario.contains('S1') ? blueStyle : (scenario.contains('S2') ? greenStyle : pinkStyle),
            })
        .toList();
  }
}
