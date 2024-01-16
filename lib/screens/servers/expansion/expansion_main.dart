import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/server.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/common_server_page.dart';
import 'package:responsive_admin_dashboard/screens/servers/expansion/impact_expansion.dart';
import 'package:responsive_admin_dashboard/screens/servers/expansion/planned_expansion.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/tables/data_center_table.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/tables/farm_passport_table.dart';

class ExpansionMain extends StatefulWidget {
  @override
  State<ExpansionMain> createState() => _ExpansionMainState();
}

class _ExpansionMainState extends State<ExpansionMain> {
  List<Map<String, dynamic>> showImpactScenario = [];
  late ServerData serverData;

  // Callback function to update updateImpactExpansionList
  void updateImpactExpansionList(data) {
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
      mainHeader: 'IMPACT EXPANSION',
      contents: [
        FlexWidget(widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataCenterTable(server: serverData,),
            SizedBox(height: 30),
            FarmPassportTable(name: serverData.farmName, location: serverData.farmLocation, size: serverData.farmSize)
          ],
        ), header: 'DATACENTER'),
        FlexWidget(widget: PlannedExpansion(onSelect: updateImpactExpansionList), header: 'PLANNED EXPANSION'),
        FlexWidget(widget: ImpactExpansion(selectedServers: showImpactScenario), flex: 2, header: 'IMPACT EXPANSION FIRST YEAR'),
      ],
      updateScenario: (data) {},
    );
  }
}
