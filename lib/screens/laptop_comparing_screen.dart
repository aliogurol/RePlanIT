import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/fetchLaptops.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/select_to_compare.dart';
import 'package:responsive_admin_dashboard/screens/components/tables/alternative_laptops.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';
import 'components/tables/new_laptop.dart';

class LaptopComparingScreen extends StatefulWidget {
  final dynamic arguments;

  const LaptopComparingScreen({Key? key, this.arguments}) : super(key: key);

  @override
  _LaptopComparingScreenState createState() => _LaptopComparingScreenState();
}

class _LaptopComparingScreenState extends State<LaptopComparingScreen> {
  List<LaptopData> selectedLaptops = [];
  List<LaptopData> listFromLaptopScreen = [];
  
  @override
  void initState() {
    super.initState();
    print('Navigated to Comparing Screen');
  }

  Image loadGraphContent() => Image.asset('assets/images/graph.png');

  argsFromLaptopScreen() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      setState(() {
        listFromLaptopScreen = ModalRoute.of(context)!.settings.arguments as List<LaptopData>;
      });
    }else if(!widget.arguments.isEmpty){
      listFromLaptopScreen = widget.arguments[1];
    }
  }

  Widget laptopList(List<LaptopData> laptopList) => LaptopListView(
    laptops: laptopList,
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
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
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
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: Column(
                        children: [
                          BuildHeader.buildHeader('NEW'),
                          Expanded(
                            child: DataTableNewLaptop.createTable(context, selectedLaptops, widget.arguments),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        selectedLaptops.isEmpty 
                          ? Expanded(
                              child: DataTableAlternativeLaptops.createTable(context, listFromLaptopScreen, widget.arguments,  ['laptop values', Responsive.laptopComparingScreen]),
                              flex: 1,
                            )
                          : Expanded(
                              child: DataTableAlternativeLaptops.createTable(context, selectedLaptops, widget.arguments, ['laptop values', Responsive.laptopComparingScreen]),
                              flex: 1,
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

@override
Widget build(BuildContext context) {
  argsFromLaptopScreen();
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
        hoverOn: 2,
        clickedOn: widget.arguments[0] is int ? widget.arguments[0] : null, 
        laptops: selectedLaptops.isNotEmpty ? selectedLaptops : listFromLaptopScreen,  
        routes:[
          {'text':Responsive.landingScreen, 'route':Responsive.landingScreen},
          {'text':Responsive.laptopScreen, 'route':Responsive.laptopScreen},
          {'text':'laptop values ', 'route':Responsive.laptopComparingScreen}
        ],
        currentRoute: Responsive.laptopComparingScreen
      ),
    ),
    body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: laptopList(listFromLaptopScreen)
        ),
        BuildBorder.buildBorder(context),
        Expanded(
          flex: 7,
          child: loadContent(),
        ),
        BuildBorder.buildBorder(context),
      ],
    ),
  );
}

}