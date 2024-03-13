import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';

class ServersImpactReportTable extends StatefulWidget {
  final List<Map<String, dynamic>>  selectedScenarios;

  ServersImpactReportTable({required this.selectedScenarios});

  @override
  _ServersImpactReportTableState createState() =>
      _ServersImpactReportTableState();
}

class _ServersImpactReportTableState extends State<ServersImpactReportTable> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        children: 
          _buildTableRows(),
      ),
    );
  }

  List<Widget> buildTableCells(Map<dynamic, dynamic> scenario) {
    return [
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['ghgEmissions']),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['co2Costs']),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['virginMaterials']),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['eWaste']),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['circularity']),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['electricityUse']),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(scenario['electricityCosts']),
            ),
          ],
        ),
      ),
    ];
  }
  
  List<Widget> buildTotals() {
    double ghgEmissions = 0;
    double co2Costs = 0;
    double eWastes = 0;
    double circularity = 0;
    double electricityUse = 0;
    double electricityCosts = 0;
    double virginMaterials = 0;

    widget.selectedScenarios.forEach((element) {
      ghgEmissions += double.parse(element['totalGHGEmission']);
      co2Costs += double.parse(element['co2_costs']);
      eWastes += double.parse(element['eWaste']);
      electricityUse += double.parse(element['electricityUse']);
      circularity += double.parse(element['circularity']);
      virginMaterials += double.parse(element['virginMaterials']);
      electricityCosts += double.parse(element['electricityCost']);
    });

    final greenStyle = TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
    return [
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$ghgEmissions kton CO₂eq.', style: greenStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              child: Text('-€ $co2Costs ,-', style: greenStyle),
              padding: const EdgeInsets.all(8.0),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$virginMaterials kg.', style: greenStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$eWastes kg.', style: greenStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('%', style: greenStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$electricityUse kWh', style: greenStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('-€ $electricityCosts ,-', style: greenStyle),
            ),
          ],
        ),
      ),
    ];
  }
  List<Widget> buildKPNTargets() {
    final blackStyle = TextStyle(fontWeight: FontWeight.bold);
    return [
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('CO2 neutralin the entire chain (2040)', style: blackStyle, textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              child: Text('-€ 0,-', style: blackStyle),
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('0 kg.', style: blackStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Near to 0 kg waste.', style: blackStyle, textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('100 % circular', style: blackStyle,),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('', style: blackStyle),
            ),
          ],
        ),
      ),
      TableCell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(''),
            ),
          ],
        ),
      ),
    ];
  }

  List<TableRow> _buildTableRows() {
    List<TableRow> rows = [];
    rows.add(
      TableRow(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('GHG', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                      Text('emissions', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                      Text('(kgCO2)', style: TextStyle(color: Colors.green),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Icon(Icons.euro_symbol, color: Colors.green, size: 50)),
                      Expanded(child: Icon(Icons.co2_sharp, color: Colors.green, size: 50)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Text('CO2', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                      Text('costs', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                      Text('(€)', style: TextStyle(color: Colors.green),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Virgin', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('Materials', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('(kg)', style: TextStyle(color: Colors.green),),
                  ],
                ),
              ],
            ),
          ),       
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('E-Waste', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('(kg)', style: TextStyle(color: Colors.green),),
                  ],
                ),
              ],
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      'assets/images/circularity.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Circularity', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('(%)', style: TextStyle(color: Colors.green),),
                  ],
                ),
              ],
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      'assets/images/electricity.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Electricity', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('use', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('(kWh)', style: TextStyle(color: Colors.green),),
                  ],
                ),
              ],
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    child: Row(
                      children: [
                        Text('€', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),),
                        Image.asset(
                          'assets/images/electricity.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Electricity', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('costs', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    Text('(€)', style: TextStyle(color: Colors.green),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

print(widget.selectedScenarios);
    widget.selectedScenarios.forEach((scenario) {
      Map<dynamic, dynamic> getScenario = tempImpactReportScenarios.firstWhere((element) => element['scenario'] == scenario['action']);
      rows.add(TableRow(
        children: buildTableCells(getScenario)
      ));
    });

    rows.add(TableRow(children: buildTotals()));
    return rows;
  }
}
