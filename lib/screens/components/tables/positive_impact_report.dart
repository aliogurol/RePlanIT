import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/formula.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

import '../../../constants/constants.dart';
import '../radial_painter.dart';

class PositiveImpactReportTable {
  static Widget buildTable(BuildContext context, LaptopData laptop, int quantitiy) {
    final LaptopData newLaptop = laptopInfoData.where((laptopInstance) => laptopInstance.status == 'New' && laptopInstance.brand == laptop.brand).first;
    return SingleChildScrollView(
      child: Table(
        columnWidths: {
          1: FixedColumnWidth(20), // set the width of the first column
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  constraints: BoxConstraints(maxHeight: 150),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildHeader.buildHeader('CLIMAT IMPACT FIRST YEAR NEW LAPTOP'),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 100,
                                maxWidth: 100,
                              ),
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/laptopSampleImgae.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newLaptop.status + ' laptop',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    getSuggestion(newLaptop),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    newLaptop.brand + ' ' + newLaptop.model + ' ' + newLaptop.processor + ' ' + newLaptop.screenSize,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(child: Text(''),decoration: BoxDecoration(color: Colors.white),),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  constraints: BoxConstraints(maxHeight: 150),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildHeader.buildHeader(''),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 100,
                                maxWidth: 100,
                              ),
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/laptopSampleImgae.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    laptop.status,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    getSuggestion(laptop),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    laptop.brand + ' ' + laptop.model + ' ' + laptop.processor + ' ' + laptop.screenSize,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildHeader.buildHeader(''),
                    Flexible(
                      child: Text(
                        'SAVED OVER FIRST YEAR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'IMPACT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Colors.grey[400]),
                            constraints: BoxConstraints(
                              maxHeight: 20,
                              maxWidth: 30,
                            ),
                            height: double.infinity,
                            width: double.infinity,
                            child: Text(
                              quantitiy.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            'PIECES"',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: BuildHeader.buildHeader(''),
              ),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getCO2FootprintTotalImpact(newLaptop, quantitiy).toString() + ' kg CO2 eq.',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getCO2FootprintTotalImpact(laptop, quantitiy).toString() + ' kg CO2 eq.',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  textAlign:TextAlign.center,
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getCO2FootprintTotalImpactSavings(laptop, quantitiy, newLaptop).toString() + ' kg CO2 eq.',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CO2 Footprint', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                      SizedBox(width: 5,),
                      Container(
                        // margin: EdgeInsets.all(appPadding),
                        // padding: EdgeInsets.all(appPadding),
                          child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 80,
                            maxWidth: 80,
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/CO2Footprint.png',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                   '€ ' + Formula.getCO2FootprintCostTotalImpact(newLaptop, quantitiy).toString(),
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  '€ ' + Formula.getCO2FootprintCostTotalImpact(laptop, quantitiy).toString(),
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  '€ ' + Formula.getCO2FootprintCostTotalImpactSavings(laptop,quantitiy,newLaptop).toString() + ', -',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CO2 costs', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                      SizedBox(width: 20,),
                      Icon(Icons.euro_symbol, color: Colors.green, size: 50),
                      Icon(Icons.co2_sharp, color: Colors.green, size: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getVirgenResource(newLaptop, quantitiy).round().toString() + ' kg',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getVirgenResource(laptop, quantitiy).round().toString() + ' kg',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  textAlign:TextAlign.center,
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getVirgenResourceSavings(laptop, quantitiy, newLaptop).round().toString() + ' kg',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Virgen Resource', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                        child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 80,
                          maxWidth: 80,
                        ),
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/virgenResource.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getEwaste(newLaptop, quantitiy).round().toString() + ' kg',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getEwaste(laptop, quantitiy).round().toString() + ' kg',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  Formula.getEwasteSavings(laptop, quantitiy, newLaptop).round().toString() + ' kg',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('E-Waste', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                        child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 60,
                          maxWidth: 60,
                        ),
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/EWaste.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  '9%',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  '9%',
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(''),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Circularity', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      height: 80,
                      width: 80,
                      child: CustomPaint(
                        foregroundPainter: RadialPainter(
                          bgColor: textColor.withOpacity(0.1),
                          lineColor: green,
                          percent: 0.3,
                          width: 10.0,
                        ),
                        child: Center(
                          child: Text(
                          '30%',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}