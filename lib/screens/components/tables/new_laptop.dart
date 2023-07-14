import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/buttons/order_button.dart';
import 'package:responsive_admin_dashboard/screens/components/formula.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

class DataTableNewLaptop {
  static Widget createTable(BuildContext context,List<LaptopData> selectedLaptops, arguments) {
    final LaptopData laptop =
    laptopInfoData.where((laptop) => laptop.status == 'New').first;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          DataTable(
              headingRowHeight: 140,
              columnSpacing: 80,
              columns: [
                DataColumn(
                  label: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 75,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/laptopSampleImgae.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Text(getQuantitiyFor(arguments).toString() + ' x ' + getBrandAndModel(arguments)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'replaced by',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Icon(Icons.arrow_forward, color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      )
                ])),
                DataColumn(
                    label: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(laptop.status),
                    Container(
                      height: 22,
                      width: 100,
                      child: Text(
                        getSuggestion(laptop),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    SizedBox(width: 100, child: Image.asset('assets/images/laptopSampleImgae.png'),),
                    Text(
                      laptop.brand + ' ' + laptop.model + ' ' + laptop.processor,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      laptop.screenSize,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('')),
                  DataCell(Text('')),
              ]
            )
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataTable(
                
                dataRowHeight: 30,
                columns: [
                  DataColumn(label: 
                    Row(
                      children: [
                        Text('Totals for ', style: TextStyle(fontWeight: FontWeight.bold),),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                          child:Text(
                            getQuantitiyFor(arguments).toString() + 'pieces',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataColumn(label: Text('')),
                ],
                rows:
                  evaluateRows(laptop,arguments)
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  static getQuantitiyFor(laptops) {
    print(laptops);
    if(laptops[0] == 5){
        return laptops[1].length;
    }
    // else if(laptops[0] == 4){
    //   return 1;
    // }   
    return 1;
  }

  static String getBrandAndModel(arguments) {
    if(arguments.first is LaptopData){
      print('really works?');
      return arguments.first.brand + ' ' + arguments.first.model;
    }
    print('as expected');
    return arguments[1].first.brand + ' ' + arguments[1].first.model;
  }

  static String extractTextFromWidget(String input) {
    RegExp regExp = RegExp(r'"([^"]*)"');
    String extractedText = regExp.firstMatch(input)?.group(1) ?? "";
    return extractedText;
  }
  
  static List<DataRow> getRowsForSavings(LaptopData laptop, arguments) {
    const greenTextStyle = TextStyle(color: Colors.green);
    const greyTextStyle = TextStyle(color: Colors.grey);
    const fontTextStyle = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);
    const titleTextStyle =TextStyle(color: Color.fromARGB(255, 117, 111, 111), letterSpacing: 2,fontWeight: FontWeight.bold);
    return  [               
      DataRow(cells: [
        DataCell(Text('Sustainability',style: titleTextStyle,)),
        DataCell(Text('Impact first year')),
      ]), 
      DataRow(cells: [
        DataCell(Text('Carbon footprint first year', style: greenTextStyle,)),
        DataCell(Text(Formula.getCO2FootprintTotalImpact(laptop, getQuantitiyFor(arguments)).toString() + ' kg')),
      ]),                   
      DataRow(cells: [
        DataCell(Text('Carbon footprint production', style: greenTextStyle,)),
        DataCell(Text(Formula.getCO2FootprintProduction(laptop, getQuantitiyFor(arguments)).toString() + ' kg', style: greyTextStyle,)),
      ]), 
      DataRow(cells: [
        DataCell(Text('Carbon footprint use first year', style: greenTextStyle,)),
        DataCell(Text(Formula.getCO2FootprintUsePerYear(laptop, getQuantitiyFor(arguments)).toString() + ' kg', style: greyTextStyle,)),
      ]),                   
      DataRow(cells: [
        DataCell(Text('Circularity', style: greenTextStyle,)),
        DataCell(Text(laptop.circularity)),
      ]),               
      DataRow(cells: [
        DataCell(Text('Virgen resource', style: greenTextStyle,)),
        DataCell(Text(Formula.getVirgenResource(laptop, getQuantitiyFor(arguments)).toStringAsFixed(1) + ' kg')),
      ]), 
      DataRow(cells: [
        DataCell(Text('E-waste', style: greenTextStyle,)),
        DataCell(Text(Formula.getEwaste(laptop, getQuantitiyFor(arguments)).toString() + ' kg')),
      ]),             
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(Text('Business indicatiors',style: titleTextStyle)),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(Text('True purchase costs', style: fontTextStyle)),
        DataCell(Text('€ ' + Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)).toString())),
      ]),                  
      DataRow(cells: [
        DataCell(Text('Sales Price',style: greyTextStyle,)),
        DataCell(Text('€ '+(laptop.purchaseCost * getQuantitiyFor(arguments) ).toString(),style: greyTextStyle,)),
      ]),                    
      DataRow(cells: [
        DataCell(Text('Carbon footprint costs production',style: greyTextStyle,)),
        DataCell(Text('€ '+ Formula.getCO2FootprintCostProduction(laptop, getQuantitiyFor(arguments)).toString(),style: greyTextStyle,)),
      ]), 
      DataRow(cells: [
        DataCell(Text('Carbon footprint costs use per year', style: fontTextStyle)),
        DataCell(Text('€ '+ Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)).toString())),
      ]),                      
      DataRow(cells: [
        DataCell(Text('Contains critical materials', style: fontTextStyle)),
        DataCell(Text('Yes',)),
      ]),  
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
      ]),                      
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(OrderButton()),
      ]),
    ];  
  }
  
  static List<DataRow> getRowsForValues(LaptopData laptop, arguments) {
    const greenTextStyle = TextStyle(color: Colors.green);
    const greyTextStyle = TextStyle(color: Colors.grey);
    const fontTextStyle = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);
    const titleTextStyle =TextStyle(color: Color.fromARGB(255, 117, 111, 111), letterSpacing: 2,fontWeight: FontWeight.bold);
    return  [               
      DataRow(cells: [
        DataCell(Text('Sustainability',style: titleTextStyle,)),
        DataCell(Text('')),
      ]), 
      DataRow(cells: [
        DataCell(Text('Carbon footprint production', style: greenTextStyle,)),
        DataCell(Text(Formula.getCO2FootprintProduction(laptop, getQuantitiyFor(arguments)).toString() + ' kg')),
      ]),                   
      DataRow(cells: [
        DataCell(Text('Carbon footprint use per year', style: greenTextStyle,)),
        DataCell(Text(Formula.getCO2FootprintUsePerYear(laptop, getQuantitiyFor(arguments)).toString() + ' kg')),
      ]),                   
      DataRow(cells: [
        DataCell(Text('Circularity', style: greenTextStyle,)),
        DataCell(Text(laptop.circularity)),
      ]),               
      DataRow(cells: [
        DataCell(Text('Virgen resource', style: greenTextStyle,)),
        DataCell(Text(Formula.getVirgenResource(laptop, getQuantitiyFor(arguments)).toStringAsFixed(1) + ' kg')),
      ]), 
      DataRow(cells: [
        DataCell(Text('E-waste', style: greenTextStyle,)),
        DataCell(Text(Formula.getEwaste(laptop, getQuantitiyFor(arguments)).toString() + ' kg')),
      ]),             
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(Text('Business indicatiors',style: titleTextStyle)),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(Text('True purchase costs', style: fontTextStyle)),
        DataCell(Text('€ ' + Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)).toString())),
      ]),                  
      DataRow(cells: [
        DataCell(Text('Sales Price',style: greyTextStyle,)),
        DataCell(Text('€ '+(laptop.purchaseCost * getQuantitiyFor(arguments) ).toString(),style: greyTextStyle,)),
      ]),                    
      DataRow(cells: [
        DataCell(Text('Carbon footprint costs production',style: greyTextStyle,)),
        DataCell(Text('€ '+ Formula.getCO2FootprintCostProduction(laptop, getQuantitiyFor(arguments)).toString(),style: greyTextStyle,)),
      ]), 
      DataRow(cells: [
        DataCell(Text('Carbon footprint costs use per year', style: fontTextStyle)),
        DataCell(Text('€ '+ Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)).toString())),
      ]),                      
      DataRow(cells: [
        DataCell(Text('Contains critical materials', style: fontTextStyle)),
        DataCell(Text('Yes',)),
      ]),  
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
      ]),                      
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(OrderButton()),
      ]),
    ];  
  }
  
  static evaluateRows(laptop,arguments) {
    if(arguments.first is LaptopData){
     return getRowsForValues(laptop,arguments);
    }else{
      if(arguments.length == 2){
        if(arguments[0] == 2 || arguments[0] == 1)
          return getRowsForValues(laptop, arguments);
        else{
          return getRowsForSavings(laptop, arguments);
        }
      }
      else if(arguments.length == 3){
        if(arguments[2] == 'laptop_comparing')
          return getRowsForValues(laptop, arguments);
        else{
          return getRowsForSavings(laptop, arguments);
        }
      }
    }

  }
}