import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Breadcrumbs extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String currentRoute;

  Breadcrumbs({required this.items, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < items.length; i++)
          _getBreadcrumbs(children: [
            _getBreadcrumbItem(context, items[i]['text'], items[i]['route']),
            if (i != items.length - 1) _getArrowIcon(),
          ])
      ],
    );
  }

  Widget _getBreadcrumbs({required List<Widget> children}) {
    return Row(
      children: children,
    );
  }

  Widget _getBreadcrumbItem(BuildContext context, String text, String route) {
    return InkWell(
      child: text == 'landing' ? Icon(FontAwesomeIcons.home, color: Colors.purple,) : Text(text, style: TextStyle(fontSize: 14, color: Colors.purple[300])),
      onTap: () {
        if (currentRoute == route) {
          // Do nothing
        }
        else if(route == 'laptop_comparing'){
          // go back
          Navigator.of(context).pop();
        }
        else {
          // Navigate to the selected route
          Navigator.pushNamed(context, route);
        }
      },
    );
  }


  Widget _getArrowIcon() {
    return Row(
      children: [
        SizedBox(width: 8.0),
        Icon(Icons.arrow_forward_ios_rounded, size: 10.0, color: Colors.purple[300]),
        SizedBox(width: 8.0),
      ],
    );
  }
}
