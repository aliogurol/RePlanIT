import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/server.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/servers/common/common_server_page.dart';
import 'package:responsive_admin_dashboard/screens/servers/individual_server/tables/individual_server_info_table.dart';

class IndividualServerInfo extends StatefulWidget {
  @override
  State<IndividualServerInfo> createState() => _IndividualServerInfoState();
}

class _IndividualServerInfoState extends State<IndividualServerInfo> {
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
      mainHeader: 'SERVER PASSPORT',
      contents: [
        FlexWidget(widget: IndividualServerInfoTable(server: serverData, contentType: TableContentType.staticContent), header: 'STATIC DATA'),
        FlexWidget(widget: IndividualServerInfoTable(server: serverData, contentType: TableContentType.dynamicContent), header: 'DYNAMIC DATA'),
        FlexWidget(widget: IndividualServerInfoTable(server: serverData, contentType: TableContentType.impactContent), header: 'ACTION IMPACT'),
      ],
      updateScenario: (data) {},
    );
  }
}
