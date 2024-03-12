import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/servers/expansion/tables/impact_expansion_table.dart';

class ImpactExpansion extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServers;

  ImpactExpansion({required this.selectedServers});

  @override
  _ImpactExpansionState createState() =>
      _ImpactExpansionState();
}

class _ImpactExpansionState extends State<ImpactExpansion> {
  late ImpactExpansionTable _selectedScenarios;

  @override
  void initState() {
    super.initState();
    _selectedScenarios = ImpactExpansionTable(selectedServers: widget.selectedServers);
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
                child: Text(
                  'View the impact of your selected expansion scenarios, within the first year',
                ),
              ),
              ImpactExpansionTable(selectedServers: widget.selectedServers),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('Buy Servers',style: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedScenarios = ImpactExpansionTable(selectedServers: widget.selectedServers);
                    });
                    List<Map<String, dynamic>> selectedData = _selectedScenarios.getSelectedServers();
                    Navigator.pushNamed(context, Responsive.impactServerReport, arguments: selectedData);
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(48, 182, 1, 0.57),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                  child: Text('Impact Report',style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}