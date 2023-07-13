import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/laptop_long_list_copy.dart';
import 'package:responsive_admin_dashboard/screens/components/new_employee.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';

class LaptopScreen extends StatelessWidget {
  const LaptopScreen({super.key});

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
          displayButtons: false, 
          rightText: Text('Laptops'),
          hoverOn: 0,  
          routes:[
            {'text':Responsive.landingScreen, 'route':Responsive.landingScreen},
            {'text':Responsive.laptopScreen, 'route':Responsive.laptopScreen}],
          currentRoute: Responsive.laptopScreen
          ),
          
      ),
      body: Builder(builder:(context) {
        return SafeArea(
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 9, child: LaptopLongListCopy()),           
              BuildBorder.buildBorder(context),
              // Expanded(flex: 5, child: MultipleDropDownMenus()), 
              // BuildBorder.buildBorder(context),
              Expanded(flex: 3, child: NewEmployee())
            ],
          ),
        );
      }),
    );
  }
}