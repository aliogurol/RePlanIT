import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/tables/positive_impact_report.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';

class PositiveImpactReport extends StatelessWidget {
  final LaptopData? laptop;
  final int? quantitiy;
  PositiveImpactReport({this.laptop, this.quantitiy});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: IconButtonTheme(
          data: IconButtonThemeData(),
          child: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        toolbarHeight: 100,
        title: Toolbar.build(
          displayButtons: false, 
          rightText: Text('POSITIVE IMPACT REPORT',
          style: TextStyle(color:Colors.green),), 
          hoverOn: 0,
          routes:[
            {'text':Responsive.landingScreen, 'route':Responsive.landingScreen},
            {'text':Responsive.laptopScreen, 'route':Responsive.laptopScreen},
            {'text':'laptop comparing ', 'route':Responsive.laptopComparingScreen},
            {'text':'impact report', 'route':Responsive.positiveImpactReport},
          ],
          currentRoute: Responsive.positiveImpactReport
        ),
      ),
      body: PositiveImpactReportTable.buildTable(context,laptop!,quantitiy!),
    );
  }
}