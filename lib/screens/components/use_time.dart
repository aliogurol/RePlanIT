import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/radial_painter.dart';

class UseTime extends StatelessWidget {
  const UseTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use Time',
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.all(appPadding),
              padding: EdgeInsets.all(appPadding),
              height: 230,
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: textColor.withOpacity(0.1),
                  lineColor: primaryColor,
                  percent: 0.3,
                  width: 18.0,
                ),
                child: Center(
                  child: Text(
                    '30%',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: 10,
                      ),
                      SizedBox(width: appPadding /2,),
                      Text('Used',style: TextStyle(
                        color: textColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: textColor.withOpacity(0.2),
                        size: 10,
                      ),
                      SizedBox(width: appPadding /2,),
                      Text('Left',style: TextStyle(
                        color: textColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
