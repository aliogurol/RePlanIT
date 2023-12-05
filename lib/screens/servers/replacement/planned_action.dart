import 'package:flutter/material.dart';

class PlannedAction extends StatefulWidget {
  final Function(List<Map<String, dynamic>> selectedData) onSelect;

  PlannedAction({required this.onSelect});

  @override
  _PlannedActionState createState() => _PlannedActionState();
}

class _PlannedActionState extends State<PlannedAction> {
  bool selectAll = false;
  String dropdownValue = 'support expiring';
  String replaceDropdownValue = 'same';
  double capacityPercentage = 10.0;
  List<String> selectedServers = [];
  Map<String, bool> serverSelection = {};

  @override
  void initState() {
    super.initState();
    updateSelectedServers();
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
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('I plan to'),
              ),
              Text('Replace servers', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Text('Select servers that are'),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) => setState(() {
                      dropdownValue = newValue!;
                      updateSelectedServers();
                    }),
                    items: ['support expiring', 'unhealthy', 'broken', 'ineffective', 'all']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text('Selections', style: TextStyle(fontWeight: FontWeight.bold)),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('Select All'),
          value: selectAll,
          onChanged: (bool? value) => setState(() {
            selectAll = value!;
            updateServerSelection();
          }),
        ),
        for (String server in selectedServers)
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: BorderSide(width: 1, color: Colors.black),
                  ),
                  onPressed: () {},
                  child: Text('Server $server', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 10),
                Text(dropdownValue),
              ],
            ),
            value: serverSelection[server] ?? false,
            onChanged: (bool? value) => setState(() {
              serverSelection[server] = value!;
              updateSelectAll();
              widget.onSelect(getSelectedServerData());
            }),
          ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Text('Replace selection of servers by'),
            SizedBox(width: 10),
            DropdownButton<String>(
              value: replaceDropdownValue,
              onChanged: (String? newValue) => setState(() {
                replaceDropdownValue = newValue!;
              }),
              items: ['same', 'lower', 'higher']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text('capacity of'),
            SizedBox(width: 20),
            Container(
              width: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  capacityPercentage = double.parse(value);
                }),
              ),
            ),
            Text('%'),
          ],
        )
      ],
    );
  }

  void updateSelectedServers() {
    setState(() {
      selectedServers = selectAll
          ? []
          : ['123', '124', '125', '126', '127'];
      serverSelection = Map.fromEntries(
        selectedServers.map((server) => MapEntry(server, selectAll)),
      );
      widget.onSelect(getSelectedServerData());
    });
  }

  void updateServerSelection() {
    setState(() {
      serverSelection = Map.fromEntries(
        selectedServers.map((server) => MapEntry(server, selectAll)),
      );
    });
  }

  void updateSelectAll() {
    setState(() {
      selectAll = serverSelection.values.every((value) => value);
    });
  }

  List<Map<String, dynamic>> getSelectedServerData() {
    return selectedServers
        .where((server) => serverSelection[server] == true)
        .map((server) => {
              'server': server,
              'action': 'Replace servers with by 10 new',
              'totalGHGEmission': server == '123' ? '110' : '22',
              'energy': '-100',
              'eWaste': server == '123' ? '250' : '100',
            })
        .toList();
  }
}