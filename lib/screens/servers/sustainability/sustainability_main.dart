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
  List<String> dataCenterName = List.empty();
  late ServerData server;

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      dataCenterName = ModalRoute.of(context)!.settings.arguments as List<String>;
      server = servers.firstWhere((element) => element.farmName == dataCenterName.first);
    }else{
      server = servers.first;
    }
    return CommonServerPage(
      mainHeader: 'SUSTAINABILITY ADVISE',
      contents: [
        FlexWidget(widget: DataCenterTable(server: server,), header: 'DATACENTER ' + server.farmName),
        FlexWidget(widget: AdvisedAction(selectedServer: server), header: 'ADVISED ACTION'),
        FlexWidget(widget: ActionImpact(actionList: tempSustainabilityScenarios), flex: 2, header: 'ACTION IMPACT'),
      ],
      updateScenario: (data) {},
    );
  }
}
