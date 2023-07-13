import 'package:flutter/material.dart';

class CustomToolbar extends StatefulWidget {
  @override
  _CustomToolbarState createState() => _CustomToolbarState();
}

class _CustomToolbarState extends State<CustomToolbar> {
  int _selectedIndex = 0;

  List<String> _definitions = [
    'Button 1 Definition',
    'Button 2 Definition',
    'Button 3 Definition',
    'Button 4 Definition',
    'Button 5 Definition',
    'Button 6 Definition',
    'Button 7 Definition',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              for (int i = 0; i < 7; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = i;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(right: 16.0),
                    decoration: _selectedIndex == i
                        ? BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          )
                        : null,
                    child: Text(
                      String.fromCharCode(i + 65),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(_definitions[_selectedIndex]),
        ],
      ),
    );
  }
}
