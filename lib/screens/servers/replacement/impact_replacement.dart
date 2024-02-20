import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/servers/replacement/tables/impact_replacement_table.dart';
import 'package:responsive_admin_dashboard/screens/servers/report/impact_report_main.dart';

class ImpactReplacement extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServers;

  ImpactReplacement({required this.selectedServers});

  @override
  _ImpactReplacementState createState() =>
      _ImpactReplacementState();
}

class _ImpactReplacementState extends State<ImpactReplacement> {
  late ImpactReplacementTable _selectedScenarios;

  @override
  void initState() {
    super.initState();
    _selectedScenarios = ImpactReplacementTable(selectedServers: widget.selectedServers);
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
                  'View the impact of your selected replacement scenarios, compared to no replacements (extend support), within the first year',
                ),
              ),
              ImpactReplacementTable(selectedServers: widget.selectedServers),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedScenarios = ImpactReplacementTable(selectedServers: widget.selectedServers);
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
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedScenarios = ImpactReplacementTable(selectedServers: widget.selectedServers);
                    });
                    List<Map<String, dynamic>> selectedData = _selectedScenarios.getSelectedServers();
                    Navigator.pushNamed(context, Responsive.impactReplecamentReport, arguments: selectedData);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(48, 182, 1, 0.57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('Impact Over Time',style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}