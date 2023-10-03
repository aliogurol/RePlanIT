import 'dart:collection';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/buttons/impact_button.dart';
import 'package:responsive_admin_dashboard/screens/components/buttons/order_button.dart';
import 'package:responsive_admin_dashboard/screens/components/formula.dart';
import 'package:responsive_admin_dashboard/screens/components/leafProvider.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

class DataTableGraph {
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
                  getRowsForSavings(laptop,arguments)
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  static getQuantitiyFor(laptops) {
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
      return arguments.first.brand + ' ' + arguments.first.model;
    }
    return arguments[1].first.brand + ' ' + arguments[1].first.model;
  }

  static String extractTextFromWidget(String input) {
    RegExp regExp = RegExp(r'"([^"]*)"');
    String extractedText = regExp.firstMatch(input)?.group(1) ?? "";
    return extractedText;
  }
  
  static List<DataRow> getRowsForSavings(LaptopData laptop, arguments) {
    int amount = 1;
    if(arguments.first is int && arguments.first == 5){
      amount = arguments[1].length;
    }
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
        DataCell(Text('Total carbon footprint first year', style: greenTextStyle,)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Formula.getCO2FootprintTotalImpact(laptop, getQuantitiyFor(arguments)).toString() + ' kg'),
                  ],
                )),
            GraphBar(value: 50, color: Color.fromARGB(255, 145, 31, 35),),
          ],
        )),
      ]),                                     
      DataRow(cells: [
        DataCell(Text('Circularity production & recycling', style: greenTextStyle,)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(laptop.circularity),
                  ],
                )),
                buildBorder(30),
            SizedBox(width: 50,),
            GraphBar(value: 5, color: Colors.green, isBaseLine: true,),
          ],
        )),
      ]),               
      DataRow(cells: [
        DataCell(Text('Virgen resource', style: greenTextStyle,)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Formula.getVirgenResource(laptop, getQuantitiyFor(arguments)).toStringAsFixed(1) + ' kg'),
                  ],
                )),
            GraphBar(value: 50, color: Color.fromARGB(255, 145, 31, 35),),
          ],
        )),
      ]), 
      DataRow(cells: [
        DataCell(Text('E-waste', style: greenTextStyle,)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Formula.getEwaste(laptop, getQuantitiyFor(arguments)).toString() + ' kg'),
                  ],
                )),
            GraphBar(value: 50, color: Color.fromARGB(255, 145, 31, 35),),
          ],
        )),
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
        DataCell(Text('True costs first year', style: fontTextStyle)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ ' + (Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)) + Formula.getCO2FootprintCostUsePerYear(laptop, amount)).toString(),style: TextStyle(color: Colors.red),),
                  ],
                )),
            GraphBar(value: 50, color: Color.fromARGB(255, 145, 31, 35),),
          ],
        )),
      ]),                  
      DataRow(cells: [
        DataCell(Text('Sales Price',style: greyTextStyle,)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ '+(laptop.purchaseCost * getQuantitiyFor(arguments) ).toString(),style: greyTextStyle,),
                  ],
                )),
            GraphBar(value: 50, color: Color.fromARGB(255, 236, 137, 130),),
          ],
        )),
      ]),                    
      DataRow(cells: [
        DataCell(Text('Carbon footprint costs production',style: greyTextStyle,)),
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ '+ Formula.getCO2FootprintCostProduction(laptop, getQuantitiyFor(arguments)).toString(),style: greyTextStyle,),
                  ],
                )),
            GraphBar(value: 50, color: const Color.fromARGB(255, 236, 137, 130),),
          ],
        )),
      ]), 
      DataRow(cells: [
        DataCell(Text('Carbon footprint costs use per year', style: greyTextStyle)),
        DataCell(Row(
          children: [
            Container(
              width:45,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('€ '+ Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)).toString(),style: greyTextStyle,),
              ],
            )),
          GraphBar(value: 50, color: const Color.fromARGB(255, 236, 137, 130),),
          ],
        )),
      ]),                      
      DataRow(cells: [
        DataCell(Text('Contains critical materials', style: fontTextStyle)),
        DataCell(Row(
          children: [
            Container(
              width:45,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Yes'),
              ],
            )),
          GraphBar(value: 50, color: Colors.transparent),
          ],
        )),
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
}

class GraphBar extends StatelessWidget {
  final double value;
  final Color color;
  final bool? isBaseLine;

  const GraphBar({required this.value, this.color = Colors.green , this.isBaseLine});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildBorder(30),
        Container(
          width: isBaseLine != null ? value : 50 ,
          child: Row(
            children: [
              Container(
                height: 20,
                width: (value != 50 ? value : 50) ,
                color: color,
              ),
            ],
          ),
        ),
        isBaseLine != null ? Container() : buildBorder(30),
      ],
    );
  }
}

  Widget buildBorder(height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }

class DataTableAlternativeLaptopsForGraph {
static Widget createTable(BuildContext context,List<LaptopData> selectedLaptops, arguments, previousPage) {
  ScrollController _scrollController = ScrollController();
    return Scrollbar(   
        radius: Radius.circular(5),
        thickness: 15,
        thumbVisibility: true,
        controller: _scrollController,
        child: Column(
          children: [
            BuildHeader.buildHeader('SELECTION OF ALTERNATIVES'),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(top: 40),
                scrollDirection: Axis.horizontal,
                itemCount: selectedLaptops.length,
                physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                LaptopData laptop = selectedLaptops[index];
                if(laptop.status == 'New' && laptop.brand == 'HP'){
                  return Container();
                }
                return DataTable(
                headingRowHeight: 215,
                dataRowHeight: 30,
                columns: [
                  DataColumn(
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(laptop.status),
                        Container(
                          height: 40,
                          width: 200,
                          child: Text(
                            getSuggestion(laptop),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Image.asset('assets/images/laptopSampleImgae.png'),
                        ),
                        Text(laptop.brand + ' ' + laptop.model,style: TextStyle(fontSize: 10,),),
                        Text(laptop.screenSize,style: TextStyle(fontSize: 10,),),
                        LeafIconProvider.getLeafIcons(laptop.status)
                      ],
                    ),
                  ),
                ],
                rows: getRowsFor(arguments,laptop, previousPage)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  static getRowsFor(arguments,laptop, previousPage) {
    int quantitiy = 1;
    if(arguments.first is int && arguments.first == 5){
      quantitiy = arguments[1].length;
    }
    final LaptopData newLaptop = laptopInfoData.where((laptopInstance) => laptopInstance.status == 'New' && laptopInstance.brand == laptop.brand).first;
    const greyTextStyle = TextStyle(color: Colors.grey);
        return [
          DataRow(cells: [
            DataCell(Text(''))
          ]),               
          DataRow(cells: [
            DataCell(Row(
              children: [
                Expanded(child: Text('Impact first year', style: TextStyle(fontSize: 10),)),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('savings', style: TextStyle(fontSize: 10)),
                )),
              ],
            ))
          ]),                           
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Formula.getCO2FootprintTotalImpact(laptop, getQuantitiyFor(arguments)).toString() + ' kg', style:greyTextStyle),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'co2',arguments)),
                SizedBox(width: 3,),
                Text('-' + Formula.getCO2FootprintTotalImpactSavings(laptop, quantitiy,newLaptop).toString() +' kg',),
              ],
            )),
          ]),            
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(laptop.circularity),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'circularity',arguments)),
                SizedBox(width: 3,),
                Text('.'),
              ],
            )),
          ]),            
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(Formula.getVirgenResource(laptop, getQuantitiyFor(arguments)).toStringAsFixed(1) + ' kg'),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'virgen',arguments)),
                SizedBox(width: 3,),
                Text('-' + Formula.getVirgenResourceSavings(laptop, quantitiy,newLaptop).toStringAsFixed(1) +' kg'),
              ],
            )),
          ]),          
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(laptop.eWaste.toStringAsFixed(1) + ' kg'),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'e-waste',arguments)),
                SizedBox(width: 3,),
                Text('-' + Formula.getEwasteSavings(laptop, quantitiy,newLaptop).toStringAsFixed(1) +' kg'),
              ],
            )),
          ]), 
          DataRow(cells: [
            DataCell(Text('')),
          ]),             
          DataRow(cells: [
            DataCell(Text('')),
          ]), 
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ '+ ((Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)) + (laptop.co2ProductionPerLifeTime~/4*0.418)).round() + 1).toString(),style: greyTextStyle),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'trueCost',arguments)),
                SizedBox(width: 3,),
                Text('-€ ' + Formula.getTruePurchaseCostForSavings(laptop, quantitiy,newLaptop).toString()),
              ],
            )),
          ]),
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ '+ laptop.purchaseCost.toString(),style:greyTextStyle),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'purchaseCost',arguments),color: Color.fromARGB(255, 155, 247, 161),),
                SizedBox(width: 3,),
                Text('-€ ' + (Formula.getPurchaseCostForSavings(laptop, quantitiy, newLaptop) ).toString()),               
              ],
            )),
          ]),
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ '+ Formula.getCO2FootprintCostProduction(laptop, getQuantitiyFor(arguments)).toString(),style: greyTextStyle),
                    buildBorder(30),
                  ],
                )),
                // laptop.status == 'New' ? SizedBox(): SizedBox(width: 15,),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'costProduction',arguments),color: Color.fromARGB(255, 155, 247, 161),),
                SizedBox(width: 3,),
                Text('-€ ' + (Formula.getCO2FootprintCostProductionForSavings(laptop, quantitiy, newLaptop) ).toString()),                 
              ],
            )),
          ]), 
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('€ '+ Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)).toString()),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: getBarLenght(laptop,'costYear',arguments),color: Color.fromARGB(255, 155, 247, 161),),
                SizedBox(width: 3,),
                Text('-€ ' + (Formula.getCO2FootprintCostUsePerYear(newLaptop, quantitiy,) - Formula.getCO2FootprintCostUsePerYear(laptop, quantitiy,) ).toString()),  
              ],
            )),
          ]),  
          DataRow(cells: [
            DataCell(Row(
              children: [
                Container(
                  width:45,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Yes'),
                    buildBorder(30),
                  ],
                )),
                SizedBox(width: 50,),
                GraphBar(value: 50,color: Colors.transparent,),
              ],
            )),
          ]),  
          DataRow(cells: [
            DataCell(Text('')),
          ]),                  
          DataRow(cells: [
            DataCell(Row(
              children: [
                ImpactOfChoiceButton(laptop:laptop, quantitiy:getQuantitiyFor(arguments),previousPage: previousPage,),
                SizedBox(width: 5,),
                buildOrderButton(),
              ],
            )),
          ]),
        ];
      }

  static getQuantitiyFor(laptops) {
    if(laptops[0] == 5){
        return laptops[1].length;
    }
    // else if(laptops[0] == 4){
    //   return 1;
    // }   
    return 1;
  }

  static String extractTextFromWidget(String input) {
    RegExp regExp = RegExp(r'"([^"]*)"');
    String extractedText = regExp.firstMatch(input)?.group(1) ?? "";
    return extractedText;
  }
  
  static getBarLenght(LaptopData laptop, field, arguments) {
    int amount = 1;
    if(arguments.first is int && arguments.first == 5){
      amount = arguments[1].length;
    }
    final LaptopData newLaptop = laptopInfoData.where((laptopInstance) => laptopInstance.status == 'New' && laptopInstance.brand == laptop.brand).first;
    double firstValue = 0;
    double secondValue = 0;
    int maxValue = 50;
    switch (field) {
      case 'co2':
        firstValue = Formula.getCO2FootprintTotalImpactSavings(laptop, amount, newLaptop).toDouble(); 
        secondValue = Formula.getCO2FootprintTotalImpact(laptop, amount).toDouble(); 
        break;
      case 'circularity':
        firstValue = 9; 
        secondValue = 100;
        break;
      case 'virgen':
        firstValue = Formula.getVirgenResourceSavings(laptop, amount, newLaptop); 
        secondValue = Formula.getVirgenResource(laptop, amount);
        break;
      case 'e-waste':
        firstValue = Formula.getEwasteSavings(laptop, amount, newLaptop); 
        secondValue = Formula.getEwaste(laptop, amount);
        break;
      case 'trueCost':
        firstValue = Formula.getTruePurchaseCostForSavings(laptop, amount,newLaptop).toDouble(); 
        secondValue = Formula.getCO2FootprintCostUsePerYear(laptop, amount).toDouble();
        break;
      case 'purchaseCost':
        firstValue = Formula.getPurchaseCostForSavings(laptop, amount,newLaptop) == 0 ? 1 : Formula.getPurchaseCostForSavings(laptop, amount,newLaptop).toDouble(); 
        secondValue = Formula.getCO2FootprintCostProductionForSavings(laptop, amount,newLaptop)==0 ? 1 :Formula.getCO2FootprintCostProductionForSavings(laptop, amount,newLaptop).toDouble(); 
        break;
      case 'costProduction':
        firstValue = Formula.getCO2FootprintCostProductionForSavings(laptop, amount,newLaptop) == 0 ? 1 : Formula.getCO2FootprintCostProductionForSavings(laptop, amount,newLaptop).toDouble(); 
        secondValue = Formula.getPurchaseCostForSavings(laptop, amount,newLaptop) == 0 ? 1 : Formula.getPurchaseCostForSavings(laptop, amount,newLaptop).toDouble(); 
        break;
      case 'costYear':
        firstValue = Formula.getCO2FootprintCostUsePerYear(laptop, amount).toDouble(); 
        secondValue = Formula.getPurchaseCostForSavings(laptop, amount,newLaptop).toDouble(); 
        break;
      default:
      return 1;
    }

    double sum = firstValue + secondValue;
    double b = maxValue*(firstValue/sum);
    return b;
  }
    
}
