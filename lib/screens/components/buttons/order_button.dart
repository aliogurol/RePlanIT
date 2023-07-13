import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      // minWidth: 60,
      color: Colors.grey,
      onPressed: () {
      },
      child: Text('Order',style: TextStyle(color: Colors.white)),
    );
  }
}
