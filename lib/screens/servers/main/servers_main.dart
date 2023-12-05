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
  bool showPerformanceServerGroup = false;
  Set<String> selectedLocations = Set();
  Set<String> selectedServerGroups = Set();

  // Callback function to update showPerformanceServerGroup
  void updateShowPerformanceServerGroup(bool showInfo) {
    setState(() {
      showPerformanceServerGroup = showInfo;
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
        logo: LogoType.kpn
      ),
    );
  }

  Widget _buildPageContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomContainer(
            header: 'KPN DATACENTER',
            content: ServerGroupSelection(
              onShowPerformanceServerGroup: updateShowPerformanceServerGroup,
              selectedLocations: selectedLocations,
              selectedServerGroups: selectedServerGroups,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            header: 'PERFORMANCE SERVER GROUP',
            content: showPerformanceServerGroup ? PerformanceServerGroup() : Container(),
          ),
        ),
        Expanded(
          child: CustomContainer(
            header: 'FARM PASSPORT',
            content: showPerformanceServerGroup
                ? FarmPassport(
                    selectedLocations: selectedLocations,
                    selectedServerGroups: selectedServerGroups,
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}