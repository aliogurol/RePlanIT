import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';


class LaptopLists extends StatelessWidget {
  const LaptopLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/logowithtext.png"),
          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {
                  Navigator.pushNamed(context, Responsive.dashBoardScreen);
              }),
          DrawerListTile(
              title: 'Configurator',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Planner', svgSrc: 'assets/icons/Planner.svg', tap: () {}),
          DrawerListTile(
              title: 'Statistics',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Market Place',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {
                  Navigator.pushNamed(context, Responsive.marketPlaceScreen);
              }),
          DrawerListTile(
              title: 'Reports',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),

          DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Logout',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () {
                // XXX TODO: make a proper log out
                  Navigator.pushNamed(context, Responsive.loginScreen);
              }),
        ],
      ),
    );
  }
}
