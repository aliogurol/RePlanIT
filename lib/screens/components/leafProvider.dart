import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeafIconProvider {
  String laptopStatus;

  LeafIconProvider(this.laptopStatus);

  static Widget getLeafIcons(String laptopStatus) {
    if (laptopStatus == "New") {
      return Row();
    } else if (laptopStatus == 'refurbished') {
      return
        Row(
          children: [
            Row(children: [Icon(FontAwesomeIcons.leaf, color: Colors.green, size:15)]),
          ],
        );
    } else if (laptopStatus == 'extend lifetime 1 year') {
      return
        Row(
          children: [
            Row(children: [Icon(FontAwesomeIcons.leaf, color: Colors.green, size:15)]),
            Row(children: [Icon(FontAwesomeIcons.leaf, color: Colors.green, size:15)]),
          ],
        );
    } else {
      return Row(
        children: [
          Row(children: [Icon(FontAwesomeIcons.leaf, color: Colors.green, size:15)]),
          Row(children: [Icon(FontAwesomeIcons.leaf, color: Colors.green, size:15)]),
          Row(children: [Icon(FontAwesomeIcons.leaf, color: Colors.green, size:15)]),
        ],
      );
    }
  }
}
