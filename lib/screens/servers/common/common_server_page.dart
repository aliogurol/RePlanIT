import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'package:responsive_admin_dashboard/screens/servers/helpers/custom_container.dart';
import 'package:responsive_admin_dashboard/screens/servers/main/servers_main.dart';

class FlexWidget {
  final Widget widget;
  final int? flex;
  final String header;

  FlexWidget({required this.widget, this.flex, required this.header});
}

class CommonServerPage extends StatefulWidget {
  final String mainHeader;
  final List<FlexWidget> contents;
  final Function(dynamic) updateScenario;

  CommonServerPage({
    required this.mainHeader,
    required this.contents,
    required this.updateScenario,
  });

  @override
  _CommonServerPageState createState() => _CommonServerPageState();
}

class _CommonServerPageState extends State<CommonServerPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments == null) {
      // Return an empty Container if no arguments are provided.
      return ServersMain();
    }

    ServerData server = arguments as ServerData;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageContent(server),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      title: Toolbar.build(
        displayButtons: false,
        rightText: Text(
          widget.mainHeader,
          style: TextStyle(color: Colors.black),
        ),
        hoverOn: 0,
        routes: [
          {'text': Responsive.landingScreen, 'route': Responsive.landingScreen},
          {'text': Responsive.serversMain, 'route': Responsive.serversMain},
          {'text': Responsive.sustainability, 'route': Responsive.sustainability},
        ],
        currentRoute: Responsive.sustainability,
        logo: LogoType.kpn
      ),
    );
  }

  Widget _buildPageContent(ServerData server) {
    List<Widget> customContainers = [];

    for (FlexWidget flexWidget in widget.contents) {
      customContainers.add(
        Expanded(
          flex: flexWidget.flex ?? 1,
          child: CustomContainer(
            header: flexWidget.header,
            content: flexWidget.widget,
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: customContainers,
    );
  }
}
