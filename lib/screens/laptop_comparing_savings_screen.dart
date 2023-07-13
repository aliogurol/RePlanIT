import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/fetchLaptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/select_to_compare.dart';
import 'package:responsive_admin_dashboard/screens/components/tables/savings.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'components/tables/new_laptop.dart';

class LaptopComparingSavingsScreen extends StatefulWidget {
  final dynamic arguments;

  const LaptopComparingSavingsScreen({Key? key, this.arguments}) : super(key: key);

  @override
  _LaptopComparingSavingsScreenState createState() => _LaptopComparingSavingsScreenState();
}

class _LaptopComparingSavingsScreenState extends State<LaptopComparingSavingsScreen> {
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
                    DataTableNewLaptop.createTable(context, selectedLaptops,widget.arguments),
                  ]
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  selectedLaptops.isEmpty
                      ? Container(width: 0, height: 0)
                      : DataTableSavings.createTable(context, selectedLaptops,widget.arguments),
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
          hoverOn: 3, 
          laptops: widget.arguments[1],  
          routes:[{'text':Responsive.laptopComparingSavingsScreen, 'route':Responsive.laptopComparingSavingsScreen}],
          currentRoute: Responsive.laptopComparingSavingsScreen
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