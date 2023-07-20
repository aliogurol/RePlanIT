import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/fetchLaptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/select_to_compare.dart';
import 'package:responsive_admin_dashboard/screens/components/tables/graph.dart';
import 'package:responsive_admin_dashboard/screens/components/tables/savings.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'components/tables/new_laptop.dart';

class LaptopComparingGraphScreen extends StatefulWidget {
  final dynamic arguments;

  const LaptopComparingGraphScreen({Key? key, this.arguments}) : super(key: key);

  @override
  _LaptopComparingGraphScreenState createState() => _LaptopComparingGraphScreenState();
}

class _LaptopComparingGraphScreenState extends State<LaptopComparingGraphScreen> {
  List<LaptopData> selectedLaptops = [];
  
  @override
  void initState() {
    super.initState();
    print('Navigated to Comparing Savings Screen');
  }

  Widget laptopList(List<LaptopData>? laptopList) => LaptopListView(
    laptops: widget.arguments[1],
    onSelectionChanged: handleSelectionChanged,
  );

  void handleSelectionChanged(List<LaptopData> selectedLaptops) {
      setState(() {
        this.selectedLaptops = selectedLaptops.toList();

      });
    /*Future.wait(selectedLaptops.map((laptop) => getSelectedLaptopInfoData(laptop.id)))
        .then((laptopDataList) {
      setState(() {
        this.selectedLaptops = laptopDataList.toList();
      });
    });*/
  }

  Future<LaptopData> getSelectedLaptopInfoData(id) async {
    var data = await fetchNewLaptop(id);
    if (data != null) {
      return data;
    } else {
      throw Exception('Error fetching data for laptop with ID $id');
    }
  }

  loadContent() {
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
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Column(
                  children: [
                    BuildHeader.buildHeader('NEW'),
                    DataTableGraph.createTable(context, selectedLaptops,widget.arguments),
                  ]
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  selectedLaptops.isNotEmpty
                      ? DataTableAlternativeLaptopsForGraph.createTable(context, selectedLaptops,widget.arguments,['laptop savings', Responsive.laptopComparingScreen])
                      : DataTableAlternativeLaptopsForGraph.createTable(context, widget.arguments[1],widget.arguments, ['laptop savings', Responsive.laptopComparingScreen]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: IconButtonTheme(
          data: IconButtonThemeData(),
          child: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        toolbarHeight: 100,
        title: Toolbar.build(
          displayButtons: true, 
          rightText: Text(''),
          hoverOn: 0, 
          clickedOn: widget.arguments[0] is int ? widget.arguments[0] : null, 
          laptops: selectedLaptops.isNotEmpty ? selectedLaptops : widget.arguments[1],  
          routes:[
            {'text':Responsive.landingScreen, 'route':Responsive.landingScreen},
            {'text':Responsive.laptopScreen, 'route':Responsive.laptopScreen},
            {'text':'laptop graph ', 'route':Responsive.laptopComparingGraphScreen}
          ],
          currentRoute: Responsive.laptopComparingGraphScreen
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: laptopList(widget.arguments[1])
          ),
          BuildBorder.buildBorder(context),
          Expanded(
            flex: 6,
            child: loadContent(),
          ),
          BuildBorder.buildBorder(context),
        ],
      ),
    );
  }
}