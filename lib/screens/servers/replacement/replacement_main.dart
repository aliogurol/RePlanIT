import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/server.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/common_server_page.dart';
import 'package:responsive_admin_dashboard/screens/servers/replacement/impact_replacement.dart';
import 'package:responsive_admin_dashboard/screens/servers/replacement/planned_action.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/tables/data_center_table.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/tables/farm_passport_table.dart';

class ReplecamentMain extends StatefulWidget {
  @override
  State<ReplecamentMain> createState() => _ReplecamentMainState();
}

class _ReplecamentMainState extends State<ReplecamentMain> {
  List<Map<String, dynamic>> showImpactScenario = [];
  late ServerData serverData;

  // Callback function to update showPerformanceServerGroup
  void updateImpactReplacementList(data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showImpactScenario = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      serverData = ModalRoute.of(context)!.settings.arguments as ServerData;
    }else{
      serverData = servers.first;
    }

    return CommonServerPage(
      mainHeader: 'IMPACT REPLACEMENT',
      contents: [
        FlexWidget(widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataCenterTable(server: serverData,),
            SizedBox(height: 30),
            FarmPassportTable(name: serverData.farmName, location: serverData.farmLocation, size: serverData.farmSize)
          ],
        ), header: 'DATACENTER'),
        FlexWidget(widget: PlannedAction(onSelect: updateImpactReplacementList), flex: 2, header: 'PLANNED ACTION'),
        FlexWidget(widget: ImpactReplacement(selectedServers: showImpactScenario), header: 'IMPACT REPLACEMENT'),
      ],
      updateScenario: (data) {},
    );
  }
}
