import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'package:responsive_admin_dashboard/screens/servers/helpers/custom_container.dart';
import 'package:responsive_admin_dashboard/screens/servers/impact_replacement_report/comparision_ghg_impact_of_scenarios.dart';
import 'package:responsive_admin_dashboard/screens/servers/impact_replacement_report/settings.dart';

class ImpactReplacementReportMain extends StatefulWidget {
  @override
  State<ImpactReplacementReportMain> createState() => _ImpactReplacementReportMainState();
}

class _ImpactReplacementReportMainState extends State<ImpactReplacementReportMain> {
  List<Map<String, dynamic>> showImpactScenario = [];
  List<Widget> customContainers = [];
  late List<Map<String, dynamic>> selectedData;

  // Callback function to update updateImpactReplacementReportList
  void updateImpactReplacementReportList(data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showImpactScenario = data;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      selectedData = ModalRoute.of(context)!.settings.arguments as  List<Map<String, dynamic>>;
    }else{
      selectedData = List.empty();
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageContent(selectedData),
    );
  }
  
  _buildPageContent(List<Map<String, dynamic>> selectedData) {
        return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomContainer(
            header: 'SETTINGS',
            content: ImpactReplacementReportSettings(),
          ),
        ), 
        Expanded(
          flex: 2,
          child: CustomContainer(
            header: 'COMPARISION GHG IMPACT OF SCENARIOS',
            content: COMPARISIONGHGIMPACTOFSCENARIOS(selectedServers: selectedData),
          ),
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
        currentRoute: Responsive.impactReplecamentReport,
        // logo: LogoType.kpn
      ),
    );
  }
}
