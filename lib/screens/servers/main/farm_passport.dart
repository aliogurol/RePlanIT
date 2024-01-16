import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/server.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/tables/farm_passport_table.dart';

class FarmPassport extends StatelessWidget {
  final Set<String> selectedServerGroups;
  final Set<String> selectedLocations;

  FarmPassport({
    required this.selectedServerGroups,
    required this.selectedLocations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FarmPassportTable(
          name: selectedServerGroups.join(', '),
          location: selectedLocations.join(', '),
          size: selectedLocations.length.toString(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    ServerData server = servers.firstWhere((element) => element.farmName == selectedServerGroups.first);
                    Navigator.pushNamed(context, Responsive.expansionImpact, arguments: server);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF407885),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('expand capacity',style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    ServerData server = servers.firstWhere((element) => element.farmName == selectedServerGroups.first);
                    Navigator.pushNamed(context, Responsive.replacementImpact, arguments: server);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF407885),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('replace servers',style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
