import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/controllers/controller.dart';
import 'package:responsive_admin_dashboard/screens/components/dashboard_content.dart';

import 'components/drawer_menu.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(),
      body: Container(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView(children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Responsive.dashBoardScreen);
            } ,
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.laptop,size: 50, color: Colors.white,),
                Text("Laptops", style: TextStyle(color: Colors.white, fontSize: 30),)
              ]),
            ),
          ),
          
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Responsive.dashBoardScreen);
            } ,
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.network_wifi,size: 50, color: Colors.white,),
                Text("Servers", style: TextStyle(color: Colors.white, fontSize: 30),)
              ]),
            ),
          ),
          
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Responsive.dashBoardScreen);
            } ,
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.router,size: 50, color: Colors.white,),
                Text("Switches", style: TextStyle(color: Colors.white, fontSize: 30),)
              ]),
            ),
          ),
          
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Responsive.dashBoardScreen);
            } ,
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.yellow),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.router,size: 50, color: Colors.white,),
                Text("Routers", style: TextStyle(color: Colors.white, fontSize: 30),)
              ]),
            ),
          ),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),
      ),)

    );
  }
}