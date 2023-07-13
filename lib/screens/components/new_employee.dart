import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';

class NewEmployee extends StatefulWidget {
  @override
  _NewEmployeeState createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  String? selectedPieces;
  String? selectedmemory;
  String? selectedProcessor;
  String? selectedSize;

  final List<String> pieces = ['1', '2', '3'];
  final List<String> memories = ['4GB', '8GB', '16GB'];

  final Map<String, List<String>> processor = {
    '4GB': ['i3', 'i5', 'i7'],
    '8GB': ['i3', 'i5', 'i7'],
    '16GB': ['i3', 'i5', 'i7'],
  };
  final Map<String, List<String>> sizes = {
    'i3': ['15', '16', '17'],
    'i5': ['13','14', '16'],
    'i7': ['13','16', '18'],
  };

  bool dropdownSizeVisible = false;
  bool dropdownProcessorVisible = false;
  bool dropdownMemoryVisible = false;

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHeader.buildHeader('NEW EMPLOYEE'),
          buildDropdown(),
        ],
      ),
    ),
  );
}

// This method builds the dropdown section
Widget buildDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.all(appPadding),
        child: Text(
          'Choose specifications for new Laptop',
          style: TextStyle(
            backgroundColor: Colors.white,
            color: Colors.black,
            fontSize: 12,
          )
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Pieces'),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: DropdownButtonFormField<String>(
              dropdownColor: Colors.grey,value: selectedPieces,
              isExpanded: true,
              onChanged: onPieceChanged,
              items: pieces.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Center(child: Text(status)),
                );
              }).toList(),
            )
          ),
        ],
      ),
      SizedBox(height: 40,),
      Visibility(
        visible: dropdownMemoryVisible,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Memory'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.grey,
                isExpanded: true,
                // value: selectedmemory,
                onChanged: onMemoryChanged,
              items: memories.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Center(child: Text(status)),
                );
              }).toList(),
              )
            ),
          ],
        ),
      ),
      SizedBox(height: 40,),
      Visibility(
        visible: dropdownProcessorVisible,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Processor'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.grey,
                isExpanded: true,
                value: selectedProcessor,
                onChanged: onProcessorChanged,
                items: getBMYItems(),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 40,),
      Visibility(
        visible: dropdownSizeVisible,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Size'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.grey,
                isExpanded: true,
                value: selectedSize,
                onChanged: onSizeChanged,
                items: getSizeItems(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// This method is called when a status is selected in the dropdown
void onPieceChanged(String? value) {
  setState(() {
    selectedPieces = value;
    selectedmemory = null;
    selectedProcessor = null;
    selectedSize = null;
    dropdownMemoryVisible = value != null;
  });
}

// This method is called when a specification is selected in the dropdown
void onMemoryChanged(String? value) {
  setState(() {
    selectedmemory = value;
    selectedProcessor = null;
    selectedSize = null;
    dropdownProcessorVisible = value != null;
  });
}

// This method is called when a specification is selected in the dropdown
void onProcessorChanged(String? value) {
  setState(() {
    selectedProcessor = value;
    selectedSize = null;
    dropdownSizeVisible = value != null;
  });
}

// This method is called when a specification is selected in the dropdown
void onSizeChanged(String? value) {
  setState(() {
    selectedSize = value;
  });
}


// This method generates the DropdownButtonFormField items for brand/Models/Year
List<DropdownMenuItem<String>> getBMYItems() {
  if (selectedmemory == null) {
    return [];
  }

  return processor[selectedmemory]!.map((country) {
    return DropdownMenuItem(
      value: country,
      child: Center(child: Text(country)),
    );
  }).toList();
}

// This method generates the DropdownButtonFormField items for brand/Models/Year
List<DropdownMenuItem<String>> getSizeItems() {
  if (selectedProcessor == null) {
    return [];
  }

  return sizes[selectedProcessor]!.map((country) {
    return DropdownMenuItem(
      value: country,
      child: Center(child: Text(country)),
    );
  }).toList();
}

}
