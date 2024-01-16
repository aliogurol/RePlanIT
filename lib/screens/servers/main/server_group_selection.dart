import 'package:flutter/material.dart';

class ServerGroupSelection extends StatefulWidget {
  final Function(bool) onShowPerformanceServerGroup;
  final Function(bool) onShowFarmPassport;
  late final Set<String> selectedLocations;
  late final Set<String> selectedServerGroups;

  ServerGroupSelection({
    required this.onShowPerformanceServerGroup,
    required this.onShowFarmPassport,
    required this.selectedLocations,
    required this.selectedServerGroups,
  });

  @override
  _ServerGroupSelectionState createState() => _ServerGroupSelectionState();
}

class _ServerGroupSelectionState extends State<ServerGroupSelection> {
  bool selectAll = false;

  void toggleSelectAll() {
    setState(() {
      if (selectAll) {
        widget.selectedLocations = Set<String>();
        widget.selectedServerGroups = Set<String>();
      } else {
        widget.selectedLocations = ['Amsterdam', 'Haarlem', 'Apeldoorn', 'Rotterdam', 'Groningen', 'Delft'].toSet();
        widget.selectedServerGroups = ['KPN 1', 'KPN 2', 'KPN 3', 'Group 3', 'Group 4', 'Group 5'].toSet();
      }
      selectAll = !selectAll;
    });
  }

  void toggleLocationSelection(String location) {
    setState(() {
      if (widget.selectedLocations.contains(location)) {
        widget.selectedLocations.remove(location);
      } else {
        widget.selectedLocations.add(location);
      }
    });
  }

  void toggleServerGroupSelection(String serverGroup) {
    setState(() {
       widget.onShowFarmPassport(true);
      if (widget.selectedServerGroups.contains(serverGroup)) {
        widget.selectedServerGroups.remove(serverGroup);
      } else {
        widget.selectedServerGroups.add(serverGroup);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Select Server Group to Scan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        buildSelectAllOption(),
        SizedBox(height: 16.0),
        Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        buildLocationSelection(),
        SizedBox(height: 16.0),
        Text(
          'Server Group/Environment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        buildServerGroupOptions(),
        SizedBox(height: 16.0),
        buildScanServerFarmButton(),
      ],
    );
  }

  Widget buildSelectAllOption() {
    return Row(
      children: [
        Checkbox(
          value: selectAll,
          onChanged: (value) {
            toggleSelectAll();
          },
        ),
        Text('Select All'),
      ],
    );
  }

  Widget buildLocationSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String location in ['Amsterdam', 'Haarlem', 'Apeldoorn', 'Rotterdam', 'Groningen', 'Delft'])
          Row(
            children: [
              Checkbox(
                value: widget.selectedLocations.contains(location),
                onChanged: (value) {
                  toggleLocationSelection(location);
                },
              ),
              Text(location),
            ],
          ),
      ],
    );
  }

  Widget buildServerGroupOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String serverGroup in ['KPN 1', 'KPN 2', 'KPN 3', 'Group 3', 'Group 4', 'Group 5'])
          Row(
            children: [
              Checkbox(
                value: widget.selectedServerGroups.contains(serverGroup),
                onChanged: (value) {
                  toggleServerGroupSelection(serverGroup);
                },
              ),
              Text(serverGroup),
            ],
          ),
      ],
    );
  }

  Widget buildScanServerFarmButton() {
    return ElevatedButton(
      onPressed: () {
        widget.onShowPerformanceServerGroup(true);
      },
      style: ElevatedButton.styleFrom(
            backgroundColor:Color(0xFF407885),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
      child: Text(
        'Show Current Performance',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
