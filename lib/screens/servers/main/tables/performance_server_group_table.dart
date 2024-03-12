import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/helpers/text_helper.dart';

class PerformanceServerGroupTable extends StatefulWidget {

  @override
  State<PerformanceServerGroupTable> createState() => _PerformanceServerGroupTableState();
}

class _PerformanceServerGroupTableState extends State<PerformanceServerGroupTable> {
  String? selectedDropdownValue;
  @override
  Widget build(BuildContext context) {
    TextStyle boldTextStyle =  TextStyle(fontWeight: FontWeight.bold);
    TextStyle boldOrangeTextStyle =  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold);
    TextStyle greenTextStyle =  TextStyle(color: Colors.green);
    TextStyle boldGreenTextStyle =  TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              _buildTableRow(
                Text('Memory usage', style: boldTextStyle), 
                Text('45 %', style: boldOrangeTextStyle),
              ),
              _buildTableRow(
                Text('Max CPU usage', style: boldTextStyle),
                Text('36 %', style: boldOrangeTextStyle),
                additionalText: Text('(Monday 9-10-2023, 14:23 hours)'),
              ),
              _buildTableRow(
                Text('Min CPU usage', style: boldTextStyle),
                Text('20 %', style: boldOrangeTextStyle),
                additionalText: Text('(Sunday 8-10-2023, 02:54 hours)'),
              ),
              _buildTableRow(
                Text('Power draw', style: TextStyle(fontWeight: FontWeight.bold) ), 
                Text('40 kWatt', style: boldTextStyle,),
              ),
              _buildTableRow(Text(''), Text('')),
              _buildTableRow(Text(''), Text('')),
              _buildTableRow(Text('ADVISED ACTIONS', style:boldGreenTextStyle), Text('3 actions', style: boldGreenTextStyle,),
              additionalText: Text('Improve the effectiveness and efficiency of this datacenter by these actions.', style: greenTextStyle)),
              _buildTableRow(Text('POTENTIAL SAVINGS', style:boldGreenTextStyle), Text(''),
              additionalText: Text('Potential direct savings in case all advised actions are executed.', style: greenTextStyle)),
            ],
          ),
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            children: [
              TableRow(
                children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: 
                      Container(
                        padding: EdgeInsets.all(40),
                          child: Column(
                            children: [
                              Container(
                              constraints: BoxConstraints(
                                maxHeight: 60,
                                maxWidth: 60,
                              ),
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/electricity.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('-159', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                                Text('MWh', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                              ],
                            ),
                            ],
                          ),
                      ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 60,
                              maxWidth: 60,
                            ),
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/CO2Footprint.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('-46,8', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                            Text('kton CO2eq.', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Icon(Icons.euro_symbol, color: Colors.green, size: 50)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                            Text('-67.263,-', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                            Text('Euro', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ]
              )
            ],
          )
        ],
      ),
    );
  }

  TableRow _buildTableRow(Text label, Text value, {Text? additionalText, Widget? additionalWidget}) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label,
                if (additionalText != null)
                  Text(
                    splitTextIntoLines(additionalText.data ?? '', 42),
                    style: TextStyle(fontSize: 10,),
                  ),
              ],
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
            child: Row(
              children: [
                value,
                SizedBox(width: 30,),
                additionalWidget ?? SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
