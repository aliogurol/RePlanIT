import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class PlannedAction extends StatefulWidget {
  final Function(List<Map<String, dynamic>> selectedData) onSelect;

  PlannedAction({required this.onSelect});

  @override
  _PlannedActionState createState() => _PlannedActionState();
}

class _PlannedActionState extends State<PlannedAction> {
  bool selectAll = false;
  String dropdownValue = 'advised by RePlanIT';
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
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
                  Text('Replace servers', style: bold),
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
                        items: ['advised by RePlanIT', 'support expiring', 'unhealthy', 'broken', 'ineffective', 'all']
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
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text('With a total CPU capacity of', style: bold),
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      capacityPercentage = double.parse(value);
                    }),
                  ),
                ),
                Text('% of the current CPU capacity of 12,8 Gz'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text('Resulting selections', style: bold),
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Select All'),
              value: selectAll,
              onChanged: (bool? value) => setState(() {
                selectAll = value!;
                updateServerSelection();
                widget.onSelect(getSelectedServerData());
              }),
            ),
            Column(
              children: _buildCheckboxTiles(dropdownValue),
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
        ),
      ),
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
              'action': server == '123' ? 'Replace 93 servers by 31 new' : 'Replace 93 servers by 31 refurbished',
              'totalGHGEmission': server == '123' ? '-16.6' : '-18.7',
              'energy': '-77',
              'eWaste': server == '123' ? '348' : '0',
              'circularity': server == '123' ? '32' : '37',
              'scenario': server == '123' ? 'S1' : 'S2',
              'electricityUse': '-77',
              'electricityCost': '0',
              'virginMaterials': '0',
              'co2_costs': '0',
              'isSelected': false,
            })
        .toList();
  }
  
 List<CheckboxListTile> _buildCheckboxTiles(String dropdownValue) {
    List<String> serversToRemove = [];

    if (dropdownValue == 'advised by RePlanIT') {
      serversToRemove.add('126');
      serversToRemove.add('127');
    } else if (dropdownValue == 'support expiring') {
        serversToRemove.add('124');
        serversToRemove.add('125');
    }else if (dropdownValue == 'unhealthy') {
        serversToRemove.add('123');
        serversToRemove.add('124');
        serversToRemove.add('125');
    }else if (dropdownValue == 'broken') {
        serversToRemove.add('123');
        serversToRemove.add('124');
        serversToRemove.add('125');
        serversToRemove.add('126');
    }else if (dropdownValue == 'ineffective') {
        serversToRemove.add('123');
        serversToRemove.add('124');
        serversToRemove.add('125');
    }

    List<CheckboxListTile> tiles = [];
    for (String server in selectedServers){
      if (serversToRemove.contains(server)) {
          continue;
      }

      tiles.add(
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
        )
      );
    }
    return tiles;
  }
}