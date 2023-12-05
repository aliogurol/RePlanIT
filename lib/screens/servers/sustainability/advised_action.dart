import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/models/server_info_model.dart';
import 'package:responsive_admin_dashboard/screens/servers/sustainability/tables/advice_actions_group_server_table.dart';
import 'package:responsive_admin_dashboard/screens/servers/sustainability/tables/advice_actions_server_table.dart';

class AdvisedAction extends StatefulWidget {
  final ServerData selectedServer;

  AdvisedAction({required this.selectedServer});

  @override
  _AdvisedActionState createState() => _AdvisedActionState();
}

class _AdvisedActionState extends State<AdvisedAction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Advised actions listed in order of impact'),
              ),
              AdviceActionsServerGroup(serverGroup: widget.selectedServer.farmName),
              SizedBox(height: 20,),
              AdviceActionsServer()
            ],
          ),
        ),
      ],
    );
  }
}