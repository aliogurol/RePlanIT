import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/toolbar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String _hoveredTitle = '';

  @override
  Widget build(BuildContext context) {
    final double _initialCardSize = 180.0;
    double _currentCardSize = _initialCardSize;
    final double _containerWidth = MediaQuery.of(context).size.width * 0.3;
    final double _containerHeight = MediaQuery.of(context).size.height * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: Toolbar.build(
            displayButtons: false,
            rightText: Text(''),
            hoverOn: 0,
            routes: [
              {'text': 'landing', 'route': Responsive.landingScreen}
            ],
            currentRoute: Responsive.landingScreen),
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Container(
            width: _containerWidth,
            height: _containerHeight,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              children: [
                _buildCard("Laptops", Icons.laptop, context,
                    Responsive.laptopScreen, Colors.grey),
                _buildCard("Servers", Icons.network_wifi, context,
                    Responsive.serversMain, Colors.grey),
                _buildCard("Switches", Icons.router, context,
                    Responsive.landingScreen, Colors.grey),
                _buildCard(
                    "Routers", Icons.router, context, Responsive.landingScreen, Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
InkWell _buildCard(String title, IconData icon, BuildContext context, String route, Color color) {
  bool isHovered = _hoveredTitle == title;

  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    onHover: (isHovering) {
      setState(() {
        if (isHovering) {
          _hoveredTitle = title;
        } else {
          _hoveredTitle = '';
        }
      });
    },
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: color.withOpacity(0.6),
                  blurRadius: 12,
                  spreadRadius: 4,
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isHovered ? 60 : 50,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: isHovered ? 28 : 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

}