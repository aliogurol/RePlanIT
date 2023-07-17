import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/select_to_compare.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';

class LaptopComparingGraphScreen extends StatefulWidget {
  final List<LaptopData>? laptops;
  const LaptopComparingGraphScreen({Key? key, this.laptops}) : super(key: key);
  @override
  _LaptopComparingGraphScreenState createState() => _LaptopComparingGraphScreenState();
}

class _LaptopComparingGraphScreenState extends State<LaptopComparingGraphScreen> {
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
          laptops: widget.laptops, 
          routes:[
            {'text':Responsive.landingScreen, 'route':Responsive.landingScreen},
            {'text':Responsive.laptopScreen, 'route':Responsive.laptopScreen},
            {'text':'laptop values ', 'route':''}
          ],
          currentRoute: Responsive.laptopComparingGraphScreen,
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
            child: Image.asset('assets/images/graph.png'),
          ),
          BuildBorder.buildBorder(context),
        ],
      ),
    );
  }

  Widget buildSelectToCompareList(BuildContext context) {
    return LaptopListView(
      laptops: widget.laptops,
      onSelectionChanged: handleSelectionChanged,
    );
  }
}