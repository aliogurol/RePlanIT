import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/breadCrumbs.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_graph_screen.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_savings_screen.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_screen.dart';

enum LogoType {
  gementeAmsterdam,
  kpn
}

class Toolbar {
  final bool displayButtons;
  final Widget rightText;
  int hoverOn = 0;
  final List<LaptopData> laptops;
  final List<Map<String, dynamic>> routes;
  final String currentRoute;
  final LogoType? logo;

  Toolbar({
    required this.displayButtons,
    required this.rightText,
    required this.hoverOn,
    required this.laptops,
    required this.routes,
    required this.currentRoute,
    this.logo,
  });

  static Widget build({
    required bool displayButtons,
    required Widget rightText,
    required int hoverOn,
    List<LaptopData>? laptops,
    required List<Map<String, dynamic>> routes,
    required String currentRoute,
    int? clickedOn,
    LogoType? logo,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: const Text(
                  "RePlanIT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildLogo(logo),
            ),
            Spacer(flex: 3),
            displayButtons
                ? Flexible(
                    flex: 4,
                    child: ButtonRow(
                      hoverOn: hoverOn,
                      clickedOn: clickedOn,
                      laptops: laptops ?? [],
                      currentRoute: currentRoute,
                    ),
                  )
                : Flexible(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: rightText,
                    ),
                  ),
          ],
        ),
        Breadcrumbs(items: routes, currentRoute: currentRoute),
      ],
    );
  }
  static Widget _buildLogo(LogoType? logo) {
    String imagePath;

    switch (logo) {
      case LogoType.gementeAmsterdam:
        imagePath = "assets/images/gementeAmsterdam.png";
        break;
      case LogoType.kpn:
        imagePath = "assets/images/kpnLogo.png";
        break;
      default:
        imagePath = "assets/images/gementeAmsterdam.png";
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
      height: logo == null ? 42 : 80,
    );
  }
}


class ButtonRow extends StatefulWidget {

    final int hoverOn;
    final int? clickedOn;
    final List<LaptopData> laptops;
    final String currentRoute;
    ButtonRow({required this.hoverOn, this.clickedOn, required this.laptops, required this.currentRoute});

  @override
  _ButtonRowState createState() => _ButtonRowState(); 
}

class _ButtonRowState extends State<ButtonRow> {
  int _selectedIndex = -1;
  int _hoverIndex = -1;

final List<Map<String, dynamic>> buttons = [
  {'icon': FontAwesomeIcons.chartBar, 'family': 'FontAwesome', 'color':Colors.grey},
  {'icon': FontAwesomeIcons.listOl, 'family': 'FontAwesome', 'color':Colors.grey},
  {'icon': FontAwesomeIcons.database, 'family': 'FontAwesome', 'color':Colors.grey},
  {'icon': FontAwesomeIcons.piggyBank, 'family': 'FontAwesome', 'color':Colors.grey},
  {'icon': FontAwesomeIcons.laptop, 'family': 'FontAwesome', 'color':Colors.grey},
  {'icon': FontAwesomeIcons.borderAll, 'family': 'FontAwesome', 'color':Colors.grey},
];
  final List<String> definitions = [
    'Graph',
    'Numbers',
    'Values',
    'Savings',
    'One Item',
    'All Items',
  ];

  Widget buildButton(int index) {
    return InkWell(
      onTap: () => {
        setState(() {
          _selectedIndex = index;
          navigate(index, widget.laptops);
        }),
      },
      onHover: (isHovering) => setState(() {
        _hoverIndex = isHovering ? index : -1;
      }),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: 
                  _selectedIndex == index 
                  || _hoverIndex == index 
                  || (widget.clickedOn != null ? (widget.clickedOn == 0 || widget.clickedOn == 2 || widget.clickedOn == 3 || widget.clickedOn == 1 ? index == 4: index == widget.clickedOn) : index == 4 )
                  || index == widget.hoverOn 
                  || ((widget.hoverOn == 2 || widget.hoverOn == 3) && index==1) 
                  || ((widget.hoverOn == 0) && (index==2 || index==3 )) 
                  ? Colors.blue 
                  : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              buttons[index]['icon'],
              size: 18,
              color:
                _selectedIndex == index 
                || _hoverIndex == index 
                || index == widget.hoverOn 
                || (widget.clickedOn != null ? (widget.clickedOn == 0 || widget.clickedOn == 2 || widget.clickedOn == 3 || widget.clickedOn == 1 ? index == 4: index == widget.clickedOn) : index == 4 )
                || ((widget.hoverOn == 2  || widget.hoverOn == 3) && index==1) 
                || ((widget.hoverOn == 0) && (index==2 || index==3 )) 

                ? Colors.blue 
                : buttons[index]['color'],
            ),
          ),
          SizedBox(height: 5,),
          buttonDefiniton(index),
        ],
      ),
    );
  }

  Widget buttonDefiniton(int index) {
    return Text(
      definitions[index],
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('Display',style: TextStyle(color: Color.fromARGB(255, 4, 68, 244),fontSize: 10)),
        SizedBox(width: 5,),
        Flexible(
          child: buildButton(0),
        ),
        SizedBox(width: 5,),
        Flexible(
          child: buildButton(1),
        ),
        Spacer(flex: 1,),
        Text('Data',style: TextStyle(color: Color.fromARGB(255, 4, 68, 244),fontSize: 10)),
        SizedBox(width: 5,),
        Flexible(
          child: buildButton(2),
        ),
        SizedBox(width: 5,),
        Flexible(
          child: buildButton(3),
        ),
        Spacer(flex: 1,),
        Text('Totals',style: TextStyle(color: Color.fromARGB(255, 4, 68, 244),fontSize: 10)),
        SizedBox(width: 5,),
        Flexible(
          child: buildButton(4),
        ),
        SizedBox(width: 5,),
        Flexible(
          child: buildButton(5),
        ),
      ]
    );
  }
  
  // xxx todo: change this, refactor this, this is not ideal
  void navigate(int index, laptops) {
    if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaptopComparingScreen(arguments:[index,laptops]),
        ),
      );
    } else if (index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaptopComparingSavingsScreen(arguments:[index,laptops]),
        ),
      );
    } else if (index == 0){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaptopComparingGraphScreen(arguments:[index,laptops]),
        ),
      );
      } else if (index == 5){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.currentRoute == Responsive.laptopComparingScreen
            ? 
             LaptopComparingScreen(arguments:[index, laptops, widget.currentRoute])
            : 
            (widget.currentRoute == Responsive.laptopComparingGraphScreen 
              ? LaptopComparingGraphScreen(arguments:[index, laptops, widget.currentRoute])
              : LaptopComparingSavingsScreen(arguments:[index, laptops, widget.currentRoute])
            )
        ),
      );
    } else if (index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LaptopComparingScreen(arguments:[index, laptops]),
        ),
      );
    } else if (index == 4){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.currentRoute == Responsive.laptopComparingScreen
            ? 
             LaptopComparingScreen(arguments:[index, laptops, widget.currentRoute])
            : 
            (widget.currentRoute == Responsive.laptopComparingGraphScreen 
              ? LaptopComparingGraphScreen(arguments:[index, laptops, widget.currentRoute])
              : LaptopComparingSavingsScreen(arguments:[index, laptops, widget.currentRoute])
            )
        ),
      );
    }
  }
}



