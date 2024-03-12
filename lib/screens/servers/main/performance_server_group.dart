import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/server.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/tables/performance_server_group_table.dart';

class PerformanceServerGroup extends StatelessWidget {
    final List<String> selectedDataCenters;

  PerformanceServerGroup({required this.selectedDataCenters});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current performance of selected server group, measured every 15 minutes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  PerformanceServerGroupTable(),
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
                    Navigator.pushNamed(context, Responsive.sustainability, arguments: selectedDataCenters);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(48, 182, 1, 0.57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('Go to Actions', style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
