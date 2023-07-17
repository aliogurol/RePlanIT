import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/base_line.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/leafProvider.dart';
import 'package:responsive_admin_dashboard/screens/components/select_to_compare.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';

class LaptopComparingValuesScreen extends StatefulWidget {
  const LaptopComparingValuesScreen({Key? key}) : super(key: key);
  @override
  _LaptopComparingValuesScreenState createState() => _LaptopComparingValuesScreenState();
}

class _LaptopComparingValuesScreenState extends State<LaptopComparingValuesScreen> {
  List<LaptopData> selectedLaptops = [];
  late String hallo;

  void handleSelectionChanged(List<LaptopData> selectedLaptops) {
    setState(() {
      this.selectedLaptops = selectedLaptops;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Toolbar.build(
          displayButtons: true, 
          rightText: Text(''),
          hoverOn: 2,
          routes:[
            {'text':Responsive.landingScreen, 'route':Responsive.landingScreen},
            {'text':Responsive.laptopScreen, 'route':Responsive.laptopScreen},
            {'text':'laptop values ', 'route':''}
          ],
          currentRoute: Responsive.laptopComparingScreenValues,
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: buildSelectToCompareList(context),
          ),
          BuildBorder.buildBorder(context),
          Expanded(
            flex: 6,
            child: buildBaseLine(),
          ),
          BuildBorder.buildBorder(context),
        ],
      ),
    );
  }

  buildBaseLine() {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        canvasColor: Colors.black,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex:4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Column(
                  children: [
                    BuildHeader.buildHeader('NEW'),
                    createDataTableForBaseLine(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  BuildHeader.buildHeader('SELECTION OF ALTERNATIVES'),
                  createDataTableForSelectedLaptops(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget createDataTableForBaseLine() {
    const greenTextStyle = TextStyle(color: Colors.green);
    const fontTextStyle = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);
    const titleTextStyle =TextStyle(color: Color.fromARGB(255, 117, 111, 111), letterSpacing: 2,fontWeight: FontWeight.bold);
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
              columnSpacing: 140,
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
                            Text('13 x HP EliteBook'),
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
                  DataColumn(label: Text('Totals for 1 piece',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0))),
                  DataColumn(label: Column(
                    children: [
                      Text(''),
                      Text(''),
                      Text('impact 4 years'),
                    ],
                  )),
                ],
                rows: [               
                  DataRow(cells: [
                    DataCell(Text('Sustainability',style: titleTextStyle,)),
                    DataCell(Text('')),
                  ]),                     
                  DataRow(cells: [
                    DataCell(Text('Carbon footprint production', style: greenTextStyle,)),
                    DataCell(Text(laptop.co2Production.toString() + ' kg')),
                  ]),                   
                  DataRow(cells: [
                    DataCell(Text('Carbon footprint use per year(elec.)', style: greenTextStyle,)),
                    DataCell(Text((laptop.co2ProductionPerLifeTime~/laptop.expectedLifeTime).toString())),
                  ]),                   
                  DataRow(cells: [
                    DataCell(Text('Circularity', style: greenTextStyle,)),
                    DataCell(Text(laptop.circularity)),
                  ]),               
                  DataRow(cells: [
                    DataCell(Text('Primary material Use', style: greenTextStyle,)),
                    DataCell(Text(laptop.eWaste.toString() + ' kg')),
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
                    DataCell(Text('€ ' + ( (laptop.co2Production*0.418).round() + laptop.purchaseCost ).toString(),)),
                  ]),       
                  DataRow(cells: [
                    DataCell(Text('Sales Price', style: fontTextStyle)),
                    DataCell(Text(laptop.purchaseCost.toString(),)),
                  ]),                    
                  DataRow(cells: [
                    DataCell(Text('Carbon footprint costs production', style: fontTextStyle)),
                    DataCell(Text((laptop.co2Production*0.418).toString())),
                  ]), 
                  DataRow(cells: [
                    DataCell(Text('GHG costs use per year (elec.)', style: fontTextStyle)),
                    DataCell(Text(laptop.costsUsePerYearGHG,)),
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
                    DataCell(buildOrderButton()),
                  ]),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget createDataTableForSelectedLaptops(){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 40),
        scrollDirection: Axis.horizontal,
        itemCount: laptopInfoData.length,
        itemBuilder: (BuildContext context, int index) {
          final LaptopData laptop = laptopInfoData[index];
          if(laptop.status == 'New'){
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
                  Text(laptop.brand + ' ' + laptop.model + ' ' + laptop.processor,style: TextStyle(fontSize: 10,),),
                  Text(laptop.screenSize,style: TextStyle(fontSize: 10,),),
                  LeafIconProvider.getLeafIcons(laptop.status)
                ],
              ),
            ),
          ],
          rows: [
            DataRow(cells: [
             DataCell(Text(laptop.status == 'extend support 2 years' ? 'impact 2 years' : (laptop.status == 'refurbished' ? 'impact 4 years' : 'impact 1 year') ))
            ]),               
            DataRow(cells: [
              DataCell(Text('')),
            ]),             
            DataRow(cells: [
              DataCell(Text(laptop.co2Production.toString() + ' kg')),
            ]),               
            DataRow(cells: [
              DataCell(Text((laptop.co2ProductionPerLifeTime~/laptop.expectedLifeTime).toString())),
            ]),            
            DataRow(cells: [
              DataCell(Text(laptop.circularity)),
            ]),            
            DataRow(cells: [
              DataCell(Text(laptop.eWaste.toString() + ' kg')),
            ]),          
            DataRow(cells: [
              DataCell(Text('')),
            ]),             
            DataRow(cells: [
              DataCell(Text('')),
            ]),
            DataRow(cells: [
              DataCell(Text('€ ' + ( (laptop.co2Production*0.418).round() + laptop.purchaseCost ).toString())),
            ]), 
            DataRow(cells: [
              DataCell(Text('€ '+laptop.purchaseCost.toString())),
            ]),
            DataRow(cells: [
              DataCell(Text((laptop.co2Production*0.418).toString())),
            ]), 
            DataRow(cells: [
              DataCell(Text(laptop.costsUsePerYearGHG)),
            ]),  
            DataRow(cells: [
              DataCell(Text('Yes')),
            ]),  
            DataRow(cells: [
              DataCell(Text('')),
            ]),                  
            DataRow(cells: [
              DataCell(Row(
                children: [
                  // ImpactOfChoiceButton(laptop: laptop,),
                  SizedBox(width: 5,),
                  buildOrderButton(),
                ],
              )),
            ]),
          ]);
        },
      ),
    );
  }

  Widget buildOrderButton() {
    return MaterialButton(
      height: 50,
      // minWidth: 60,
      color: Colors.grey,
      onPressed: () {
      },
      child: Text('Order',style: TextStyle(color: Colors.white)),
    );
  }
  
  Widget buildSelectedLaptopsList(BuildContext context) {
    return SelectedLaptopsList(
      laptops: selectedLaptops,
    );
  }
  
  Widget buildSelectToCompareList(BuildContext context) {
    return LaptopListView(
      laptops: laptopInfoData,
      onSelectionChanged: handleSelectionChanged,
    );
  }
  
  Widget builBaseLine(BuildContext context) {
    return BaseLine(laptops: selectedLaptops);
  }
}