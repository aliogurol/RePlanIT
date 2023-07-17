import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/positive_impact_report_copy.dart';

class ImpactOfChoiceButton extends StatelessWidget {
  final LaptopData laptop;
  final int quantitiy;
  final List? previousPage;
  ImpactOfChoiceButton({required this.laptop, required this.quantitiy, this.previousPage});
  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      height: 50,
      color: Colors.green,
      onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PositiveImpactReport(laptop: laptop, quantitiy: quantitiy, previousPage: previousPage),
              ),
            );
      },
      child: Container(
          width: 70,
          child: Text('Impact Report',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ))),
    );
  }
}
