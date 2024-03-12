import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'package:responsive_admin_dashboard/screens/servers/helpers/custom_container.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/farm_passport.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/performance_server_group.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/server_group_selection.dart';

class ServersMain extends StatefulWidget {
  @override
  _ServersMainState createState() => _ServersMainState();
}

class _ServersMainState extends State<ServersMain> {
  List<String> showPerformanceServerGroup = [];
  bool showFarmPassport = false;
  Set<String> selectedLocations = Set();
  List<String> selectedServerGroups = [];

  // Callback function to update showPerformanceServerGroup
  void updateShowPerformanceServerGroup(List<String> showInfo) {
    setState(() {
      showPerformanceServerGroup = showInfo;
    });
  }
  
  // Callback function to update showFarmPassport
  void updateShowFarmPassport(bool showInfo) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageContent(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      title: Toolbar.build(
        displayButtons: false,
        rightText: Text(
          'SCAN SERVER GROUP',
          style: TextStyle(color: Colors.black),
        ),
        hoverOn: 0,
        routes: [
          {'text': Responsive.landingScreen, 'route': Responsive.landingScreen},
          {'text': Responsive.serversMain, 'route': Responsive.serversMain},
        ],
        currentRoute: Responsive.serversMain,
        // logo: LogoType.kpn
      ),
    );
  }

  Widget _buildPageContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomContainer(
            header: 'DATACENTERS',
            content: ServerGroupSelection(
              onShowPerformanceServerGroup: updateShowPerformanceServerGroup,
              onShowFarmPassport: updateShowFarmPassport,
              selectedLocations: selectedLocations,
              selectedServerGroups: selectedServerGroups,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            header: 'PERFORMANCE DATACENTERS',
            content: showPerformanceServerGroup.isNotEmpty ? PerformanceServerGroup(selectedDataCenters: showPerformanceServerGroup) : Container(),
          ),
        ),
        Expanded(
          child: CustomContainer(
            header: 'DATACENTER PASSPORT',
            content: selectedServerGroups.isEmpty
                ? Container()
                : FarmPassport(
                    selectedLocations: selectedLocations,
                    selectedServerGroups: selectedServerGroups,
                  )
          ),
        ),
      ],
    );
  }
}