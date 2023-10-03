import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/definitions.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/helpers/Text_field.dart';
import 'package:responsive_admin_dashboard/helpers/text_helper.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/buttons/order_button.dart';
import 'package:responsive_admin_dashboard/screens/components/formula.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

class DataTableNewLaptop extends StatefulWidget {
  final dynamic arguments;

  const DataTableNewLaptop({Key? key, this.arguments}) : super(key: key);

  @override
  _DataTableNewLaptopState createState() => _DataTableNewLaptopState();
}

class _DataTableNewLaptopState extends State<DataTableNewLaptop> {
  int? quantity;
  int truePurchaseCost = 0; 
 
  @override
  Widget build(BuildContext context) {
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
                          Text(
                            getQuantitiyFor(widget.arguments).toString() +
                                ' x ' +
                                getBrandAndModel(widget.arguments),
                          ),
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
                  ],
                ),
              ),
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
                    SizedBox(
                      width: 100,
                      child: Image.asset('assets/images/laptopSampleImgae.png'),
                    ),
                    Text(
                      laptop.brand + ' ' + laptop.model + ' ' + laptop.processor,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      laptop.screenSize,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('')),
                DataCell(Text('')),
              ])
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataTable(
                dataRowHeight: 30,
                columns: [
                  DataColumn(
                    label: Row(
                      children: [
                        Text(
                          'Totals for ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            getQuantitiyFor(widget.arguments).toString() + ' pieces',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataColumn(label: Text('')),
                ],
                rows: evaluateRows(laptop, widget.arguments),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getQuantitiyFor(laptops) {
    if (laptops[0] == 5) {
      return laptops[1].length;
    }
    return 1;
  }

  String getBrandAndModel(arguments) {
    if (arguments.first is LaptopData) {
      return arguments.first.brand + ' ' + arguments.first.model;
    }
    return arguments[1].first.brand + ' ' + arguments[1].first.model;
  }

  String extractTextFromWidget(String input) {
    RegExp regExp = RegExp(r'"([^"]*)"');
    String extractedText = regExp.firstMatch(input)?.group(1) ?? "";
    return extractedText;
  }

  List<DataRow> getRowsForSavings(LaptopData laptop, arguments) {
    const greenTextStyle = TextStyle(color: Colors.green);
    const greyTextStyle = TextStyle(color: Colors.grey);
    const fontTextStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    const titleTextStyle = TextStyle(
        color: Color.fromARGB(255, 117, 111, 111),
        letterSpacing: 2,
        fontWeight: FontWeight.bold);
    return [
      DataRow(cells: [
        DataCell(Text('Sustainability', style: titleTextStyle)),
        DataCell(Text('Impact first year')),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Carbon footprint first year', style: greenTextStyle),
        ),
        DataCell(
            Text(Formula.getCO2FootprintTotalImpact(
                    laptop, getQuantitiyFor(arguments))
                .toString() +
                ' kg')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintProduction,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Carbon footprint production',
              style: greenTextStyle,
            )),
          ),
        ),
        DataCell(
            Text(Formula.getCO2FootprintProduction(
                    laptop, getQuantitiyFor(arguments))
                .toString() +
                ' kg',
                style: greyTextStyle)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintCostUserPerYear,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Carbon footprint costs use first year',
              style: greenTextStyle,
            )),
          ),
        ),
        DataCell(
            Text(Formula.getCO2FootprintUsePerYear(
                    laptop, getQuantitiyFor(arguments))
                .toString() +
                ' kg',
                style: greyTextStyle)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              circularity,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Circularity production & recycling',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(Text(laptop.circularity)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              virginMaterials,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Virgin materials',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(
            Text(Formula.getVirgenResource(
                    laptop, getQuantitiyFor(arguments))
                .toStringAsFixed(1) +
                ' kg')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              eWaste,
              50,
            ),
            preferBelow: false,
            child: Text(
              'E-Waste',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(
            Text(Formula.getEwaste(
                    laptop, getQuantitiyFor(arguments))
                .toString() +
                ' kg')),
      ]),
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(Text('Business indicatiors', style: titleTextStyle)),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              trueCostsAtPurchase,
              50,
            ),
            preferBelow: false,
            child: Text(
              'True purchase costs(at purchase)',
              style: fontTextStyle,
            ),
          ),
        ),
        DataCell( Text('€ ' + (truePurchaseCost != 0 
          ? truePurchaseCost.toString() 
          : (Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)) + Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)))).toString())),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              salesPrice,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Sales Price',
              style: greyTextStyle,
            )),
          ),
        ),
        DataCell(Text('€ '+(laptop.purchaseCost * getQuantitiyFor(arguments) ).toString(),style: greyTextStyle,)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintCostsProduction,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Carbon footprint costs production',
              style: greyTextStyle,
            )),
          ),
        ),
        DataCell(
            Text('€ ' +
                Formula.getCO2FootprintCostProduction(
                        laptop, getQuantitiyFor(arguments))
                    .toString(),
                style: greyTextStyle)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              containsCriticalMaterials,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Contains critical materials',
              style: fontTextStyle,
            ),
          ),
        ),
        DataCell(Text('Yes')),
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

  List<DataRow> getRowsForValues(LaptopData laptop, arguments) {
    const greenTextStyle = TextStyle(color: Colors.green);
    const greyTextStyle = TextStyle(color: Colors.grey);
    const fontTextStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    const titleTextStyle = TextStyle(
        color: Color.fromARGB(255, 117, 111, 111),
        letterSpacing: 2,
        fontWeight: FontWeight.bold);
    return [
      DataRow(cells: [
        DataCell(Text('Sustainability', style: titleTextStyle)),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintProduction,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Carbon footprint production',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(Text(laptop.co2Production.toString() + ' kg')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintUsePerYear,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Carbon footprint use per year',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(
            Text(Formula.getCO2FootprintUsePerYear(
                    laptop, getQuantitiyFor(arguments))
                .toString() +
                ' kg')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              circularity,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Circularity',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(Text(laptop.circularity)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              virginMaterials,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Virgin materials',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(
            Text(Formula.getVirgenResource(
                    laptop, getQuantitiyFor(arguments))
                .toStringAsFixed(1) +
                ' kg')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              eWaste,
              50,
            ),
            preferBelow: false,
            child: Text(
              'E-Waste',
              style: greenTextStyle,
            ),
          ),
        ),
        DataCell(
            Text(Formula.getEwaste(
                    laptop, getQuantitiyFor(arguments))
                .toString() +
                ' kg')),
      ]),
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(Text('Business indicatiors', style: titleTextStyle)),
        DataCell(Text('')),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              trueCostsAtOwnership,
              50,
            ),
            preferBelow: false,
            child: Text(
              'True purchase costs (of ownership)',
              style: fontTextStyle,
            ),
          ),
        ),
        DataCell( Text('€ ' + (truePurchaseCost != 0 
          ? truePurchaseCost.toString() 
          : (Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)) + Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)))).toString())),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              salesPrice,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Sales Price',
              style: greyTextStyle,
            )),
          ),
        ),
        DataCell(
          UserInput(
            initialValue: (laptop.purchaseCost * getQuantitiyFor(arguments)).toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                int salesPrice = int.tryParse(value) ?? 0;
                truePurchaseCost = calculateTruePurchaseCost(
                  laptop,
                  getQuantitiyFor(arguments),
                  salesPrice,
                  quantity ?? 0,
                );
              });
            },
          ),
        )
      ]),
       DataRow(cells: [
          DataCell(
            Tooltip(
              message: splitTextIntoLines(
                salesPrice,
                50,
              ),
              preferBelow: false,
              child: BulletText(Text(
                'Support costs lifetime',
                style: greyTextStyle,
              )),
            ),
          ),
          DataCell(
            UserInput(
              initialValue: '0',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  truePurchaseCost = calculateTruePurchaseCost(
                      laptop, 
                      getQuantitiyFor(arguments), 
                      laptop.purchaseCost * getQuantitiyFor(arguments), 
                       value.isEmpty ? 0 : int.parse(value));
                });
              },
            ),
          ),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintCostsProduction,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Carbon footprint costs production',
              style: greyTextStyle,
            )),
          ),
        ),
        DataCell(
            Text('€ ' +
                Formula.getCO2FootprintCostProduction(
                        laptop, getQuantitiyFor(arguments))
                    .toString(),
                style: greyTextStyle)),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              carbonFootprintCostUserPerYear,
              50,
            ),
            preferBelow: false,
            child: BulletText(Text(
              'Carbon footprint costs use lifetime',
              style: greyTextStyle,
            )),
          ),
        ),
        DataCell(
            Text('€ ' +
                Formula.getCO2FootprintCostUsePerYear(
                        laptop, getQuantitiyFor(arguments))
                    .toString())),
      ]),
      DataRow(cells: [
        DataCell(
          Tooltip(
            message: splitTextIntoLines(
              containsCriticalMaterials,
              50,
            ),
            preferBelow: false,
            child: Text(
              'Contains critical materials',
              style: fontTextStyle,
            ),
          ),
        ),
        DataCell(Text('Yes')),
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

  List<DataRow> evaluateRows(laptop, arguments) {
    if (arguments.first is LaptopData) {
      return getRowsForValues(laptop, arguments);
    } else {
      if (arguments.length == 2) {
        if (arguments[0] == 2 || arguments[0] == 1)
          return getRowsForValues(laptop, arguments);
        else {
          return getRowsForSavings(laptop, arguments);
        }
      } else if (arguments.length == 3) {
        if (arguments[2] == 'laptop_comparing')
          return getRowsForValues(laptop, arguments);
        else {
          return getRowsForSavings(laptop, arguments);
        }
      }
    }
    return <DataRow>[];
  }

  int calculateTruePurchaseCost(
    LaptopData laptop,
    int quantity,
    int salesPrice,
    int supportCosts,
  ) {
    int co2FootprintCost = Formula.getCO2FootprintCostProduction(laptop, quantity);
    int co2FootprintCostLifeTime = Formula.getCO2FootprintCostUsePerYear(laptop, quantity);
    int trueCosts = co2FootprintCost + supportCosts + salesPrice + co2FootprintCostLifeTime;
    return trueCosts;
  }

}