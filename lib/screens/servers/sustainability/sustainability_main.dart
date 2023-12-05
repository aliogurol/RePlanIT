import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/data/server.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/common_server_page.dart';
import 'package:responsive_admin_dashboard/screens/servers/sustainability/action_impact.dart';
import 'package:responsive_admin_dashboard/screens/servers/sustainability/advised_action.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/tables/data_center_table.dart';

class SustainabilityMain extends StatefulWidget {
  @override
  State<SustainabilityMain> createState() => _SustainabilityMainState();
}

class _SustainabilityMainState extends State<SustainabilityMain> {
  late ServerData serverData;

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      serverData = ModalRoute.of(context)!.settings.arguments as ServerData;
    }else{
      serverData = servers.first;
    }
    return CommonServerPage(
      mainHeader: 'SUSTAINABILITY ADVISE',
      contents: [
        FlexWidget(widget: DataCenterTable(server: serverData,), header: 'DATACENTER ' + serverData.farmName),
        FlexWidget(widget: AdvisedAction(selectedServer: serverData), flex: 2, header: 'ADVISED ACTION'),
        FlexWidget(widget: ActionImpact(actionList: tempScenarios), header: 'ACTION IMPACT'),
      ],
      updateScenario: (data) {},
    );
  }
}
