import 'package:flutter/material.dart';

class BuildBorder {
  static Widget buildBorder(BuildContext context) {
    return Container(
      width: 5.0,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
