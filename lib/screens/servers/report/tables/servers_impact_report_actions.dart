import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:flutter/material.dart';

class ServersImpactReportActionsTable extends StatefulWidget {
  final List<Map<String, dynamic>> selectedScenarios;

  ServersImpactReportActionsTable({required this.selectedScenarios});

  @override
  State<ServersImpactReportActionsTable> createState() =>
      _ServersImpactReportActionsTableState();
}

class _ServersImpactReportActionsTableState extends State<ServersImpactReportActionsTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          SizedBox(height: 15),
          Text(
            'Time Frame',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _buildYearSelectorBar(),
          Text(
            'Selected Actions',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.selectedScenarios.map((scenario) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Text(scenario['action'], style: TextStyle(color: Colors.green)),
              );
            }).toList()
          ),
          SizedBox(height: 20),
          Text('TOTAL', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
          SizedBox(height: 25),
        ],
    );
  }

  FlutterSlider _buildYearSelectorBar() {
  List<String> labels = ['Quarter', 'Semester', 'Semester', 'Year'];

  return FlutterSlider(
    values: [0, 1, 2, 3],
    min: 0,
    max: 3,
    trackBar: FlutterSliderTrackBar(
      inactiveTrackBar: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: Colors.blue),
      ),
      activeTrackBar: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      activeTrackBarHeight: 30, // Adjust the thickness as needed
      inactiveTrackBarHeight: 30, // Adjust the thickness as needed
    ),
    handler: FlutterSliderHandler(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    tooltip: FlutterSliderTooltip(
      alwaysShowTooltip: true,
      textStyle: TextStyle(fontSize: 18),
      positionOffset: FlutterSliderTooltipPositionOffset(top: -40),
      format: (value) {
        int index = int.parse(value);
        return labels[index];
      },
    ),
  );
}
}
