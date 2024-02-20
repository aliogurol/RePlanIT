import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'package:responsive_admin_dashboard/screens/servers/helpers/custom_container.dart';
import 'package:responsive_admin_dashboard/screens/servers/report/tables/server_impact_report.dart';
import 'package:responsive_admin_dashboard/screens/servers/report/tables/servers_impact_report_actions.dart';

class ImpactReportMain extends StatefulWidget {
  @override
  State<ImpactReportMain> createState() => _ImpactReportMainState();
}

class _ImpactReportMainState extends State<ImpactReportMain> {
  late List<Map<String, dynamic>>  selectedScenarios = [];

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      selectedScenarios = ModalRoute.of(context)!.settings.arguments as  List<Map<String, dynamic>>;
    }else{
      selectedScenarios = List.empty();
    }

print(selectedScenarios);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageContent(selectedScenarios),
    );
  }
  
  _buildPageContent(List<Map<String, dynamic>> selectedScenarios) {
        return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomContainer(header: 'ACTIONS', content: ServersImpactReportActionsTable(selectedScenarios: selectedScenarios,))
        ), 
        Expanded(
          flex: 2,
          child: CustomContainer(header: 'SUSTAINABILITY IMPACT Q1 2023', content: ServersImpactReportTable(selectedScenarios: selectedScenarios))
        ),
      ],
    );
  }
  
  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      title: Toolbar.build(
        displayButtons: false,
        rightText: Text(
          'GHG IMPACT REPLACEMENT',
          style: TextStyle(color: Colors.black),
        ),
        hoverOn: 0,
        routes: [
          {'text': Responsive.landingScreen, 'route': Responsive.landingScreen},
          {'text': Responsive.serversMain, 'route': Responsive.serversMain},
          {'text': Responsive.replacementImpact, 'route': Responsive.replacementImpact},
        ],
        currentRoute: Responsive.impactServerReport,
        logo: LogoType.kpn
      ),
    );
  }
}
