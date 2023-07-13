// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_admin_dashboard/screens/components/build_header.dart';

// class BaseLineWidget extends StatelessWidget {

//   final List selectedLaptops;

//   BaseLineWidget({required this.selectedLaptops});

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: buildThemeData(),
//       child: SingleChildScrollView(
//         child: Row(
//           children: [
//             buildNewLaptopsTable(),
//             buildSelectedLaptopsTable(),
//           ],
//         ),
//       ),
//     );
//   }

//   ThemeData buildThemeData() {
//     return ThemeData(
//       dividerColor: Colors.transparent,
//       canvasColor: Colors.black,
//       primarySwatch: Colors.blue,
//       scaffoldBackgroundColor: Colors.white,
//       inputDecorationTheme: InputDecorationTheme(
//         border: InputBorder.none,
//       ),
//     );
//   }

//   Expanded buildNewLaptopsTable() {
//     return Expanded(
//       flex: 4,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(
//             right: BorderSide(color: Colors.grey),
//           ),
//         ),
//         child: Column(
//           children: [
//             BuildHeader.buildHeader('NEW'),
//             createDataTableForBaseLine(),
//           ],
//         ),
//       ),
//     );
//   }

//   Expanded buildSelectedLaptopsTable() {
//     return Expanded(
//       flex: 5,
//       child: Column(
//         children: [
//           BuildHeader.buildHeader('SELECTION OF ALTERNATIVES'),
//           createDataTableForSelectedLaptops(),
//         ],
//       ),
//     );
//   }

//   Widget createDataTableForBaseLine() {
//     const greenTextStyle = TextStyle(color: Colors.green);
//     const blackTextStyle = TextStyle(color: Colors.black);
//     final LaptopData laptop =
//         laptopInfoData.where((laptop) => laptop.status == 'New').first;
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 40,
//           ),
//           DataTable(
//               headingRowHeight: 140,
//               columnSpacing: 140,
//               columns: [
//                 DataColumn(
//                     label: Stack(children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.grey[200],
//                         radius: 75,
//                         child: ClipOval(
//                           child: Image(
//                             image: NetworkImage("assets/images/laptopSampleImgae.png"),
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 4,
//                         left: 0,
//                         right: 0,
//                         child: Column(
//                           children: [
//                             Text('20x HP 2.1'),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'replaced by',
//                                   style: TextStyle(fontSize: 10),
//                                 ),
//                                 Icon(Icons.arrow_forward, color: Colors.grey),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                 ])),
//                 DataColumn(
//                     label: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(laptop.status),
//                     Container(
//                       height: 22,
//                       width: 100,
//                       child: Text(
//                         getSuggestion(laptop),
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 10),
//                       ),
//                     ),
//                     SizedBox(width: 100, child: Image.network(laptop.image)),
//                     Text(
//                       laptop.brand,
//                       style: TextStyle(fontSize: 10),
//                     ),
//                     Text(
//                       'Next Generation',
//                       style: TextStyle(fontSize: 10),
//                     ),
//                   ],
//                 )),
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text('')),
//                   DataCell(Text('')),
//               ]
//             )
//           ]),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   SizedBox(height: 40),
//                   RotatedBox(
//                     quarterTurns: -1,
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'Sustainability',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.0,
//                               color: Colors.black,
//                               letterSpacing: 2,
//                             ),
//                           ),
//                         ]
//                       )
//                     ),
//                   ),     
//                   SizedBox(height: 80,),           
//                   RotatedBox(
//                     quarterTurns: -1,
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'Business Indicatiors',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.0,
//                               color: Colors.black,
//                               letterSpacing: 2,
//                             ),
//                           ),
//                         ]
//                       )
//                     ),
//                   ),
//                 ]
//               ),
//               DataTable(
//                 columns: [
//                   DataColumn(label: Text('Totals for 1 piece',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0))),
//                   DataColumn(label: Text('')),
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Circularity', style: greenTextStyle),
//                         Text('  primary material use', style: TextStyle(color: Colors.green, fontSize: 12))
//                       ],
//                     )),
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(laptop.circularity,style: greenTextStyle),
//                         Text(laptop.eWaste, style: greenTextStyle)
//                       ],
//                     )),
//                   ]),                 
//                   DataRow(cells: [
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Total GHG emission per year', style: greenTextStyle,),
//                         Text('  emission production divided over lifetime', style: TextStyle(color: Colors.green, fontSize: 12)),
//                         Text('  emission use phase per year (incl. elec./scope)',style: TextStyle(color: Colors.green,fontSize: 12)),
//                       ],
//                     )),
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(laptop.co2Production, style: greenTextStyle),
//                         Text(laptop.co2ProductionPerYear, style: greenTextStyle),
//                         Text(laptop.emissionUse, style: greenTextStyle)
//                       ],
//                     )),
//                   ]),          
//                   DataRow(cells: [
//                     DataCell(Text('Energy consumption in use per year',style: TextStyle(color: Colors.orange))),
//                     DataCell(Text(laptop.energyConsumption, style: blackTextStyle)),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Text('Expected LifeTime',style: greenTextStyle)),
//                     DataCell(Text(laptop.expectedLifeTime, style: blackTextStyle)),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Total cost of use'),
//                         Text('  Purchase cost',style: TextStyle(color: Colors.black,fontSize: 12)),
//                         Text('  GHG use',style: TextStyle(color: Colors.black,fontSize: 12)),
//                       ],
//                     )),
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
                      
//                       children: [
//                         Text(laptop.costsProductionGHG.toString(), style: blackTextStyle),
//                         Text(laptop.purchaseCost, style: blackTextStyle),
//                         Text(laptop.useGHG, style: blackTextStyle),
//                       ],
//                     )),
//                   ]),       
//                   DataRow(cells: [
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8,),
//                         Text('Delivery Time'),
//                         SizedBox(height: 8,),
//                         Text('Specific spare part availability'),
//                       ],
//                     )),
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8,),
//                         Text(laptop.deliveryTime, style: blackTextStyle),
//                         SizedBox(height: 8,),
//                         Text(laptop.sparePart, style: blackTextStyle),
//                       ],
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8,),
//                         Text('Support Period'),
//                         SizedBox(height: 8,),
//                         Text('Stock in the market'),
//                       ],
//                     )),
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8,),
//                         Text(laptop.supportPeriod, style: blackTextStyle),
//                         SizedBox(height: 8,),
//                         Text(laptop.stock, style: blackTextStyle),
//                       ],
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8,),
//                         Text('Critical Materials'),
//                         SizedBox(height: 8,),
//                         Text('Repairability'),
//                       ],
//                     )),
//                     DataCell(Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 8,),
//                         Text(laptop.criticalMaterials, style: blackTextStyle),
//                         SizedBox(height: 8,),
//                         Text(laptop.repearibility, style: blackTextStyle),
//                       ],
//                     )),
//                   ]),     
//                   DataRow(cells: [
//                     DataCell(Text('')),
//                     DataCell(Text('')),
//                   ]),                       
//                   DataRow(cells: [
//                     DataCell(Text('')),
//                     DataCell(buildOrderButton()),
//                   ]),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       )
//     );
//   }
  
// }
