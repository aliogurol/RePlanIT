import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';

class MultipleDropDownMenus extends StatefulWidget {
  @override
  _MultipleDropDownMenusState createState() => _MultipleDropDownMenusState();
}

class _MultipleDropDownMenusState extends State<MultipleDropDownMenus> {
  String? selectedStatus;
  String? selectedSpecifications;
  String? selectedBMY;
  String? selectedSize;

  final List<String> statuses = ['New', 'Refurbished'];
  final List<String> specifications = ['Brand', 'Model', 'Year'];
  final Map<String, List<String>> bmys = {
    'Brand': ['Dell', 'HP', 'MacBook'],
    'Model': ['Dell - Latidue 3550', 'MacBook Pro'],
    'Year': ['2017', '2018', '2019', '2020', '2021', '2022']
  };
  final Map<String, List<String>> sizes = {
    'Dell': ['15', '16', '17'],
    'Dell - Latidue 3550': ['15', '16', '17'],
    'HP': ['13','14', '16'],
    'MacBook': ['13','16', '18'],
    'MacBook Pro': ['13','16', '18'],
    '2017': ['13','16', '18'],
    '2018': ['13','16', '18'],
    '2019': ['13','16', '18'],
    '2020': ['13','16', '18'],
    '2021': ['13','16', '18'],
    '2022': ['13','16', '18'],
  };

  bool dropdownSizeVisible = false;
  bool dropdownSpecVisible = false;
  bool dropdownBMYVisible = false;

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHeader.buildHeader('SELECT SET'),
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
          'Select set of laptops based on corresponding properties',
          style: TextStyle(
            backgroundColor: Colors.white,
            color: Colors.black,
            fontSize: 12,
          )
        ),
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //    children: [
      //     Text('Select Brand'),
      //     Container(
      //       decoration: BoxDecoration(
      //         border: Border.all(color: Colors.grey),
      //         borderRadius: BorderRadius.circular(5.0),
      //       ),
      //       child: DropdownButtonFormField<String>(
      //         dropdownColor: Colors.grey,value: selectedStatus,
      //         isExpanded: true,
      //         elevation: 16,
      //         onChanged: onStatusChanged,
      //         items: statuses.map((status) {
      //           return DropdownMenuItem(
      //             value: status,
      //             child: Center(child: Text(status)),
      //           );
      //         }).toList(),
      //       )
      //     ),
      //   ],
      // ),
      // SizedBox(height: 40),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Specification'),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: DropdownButtonFormField<String>(
              dropdownColor: Colors.grey,
              isExpanded: true,
              value: selectedSpecifications,
              onChanged: onSpecsChanged,
                items: specifications.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Center(child: Text(status)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      SizedBox(height: 40,),
      Visibility(
        visible: dropdownBMYVisible,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select $selectedSpecifications'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.grey,
                isExpanded: true,
                value: selectedBMY,
                onChanged: onBMYChanged,
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
            Text('Select size'),
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
// void onStatusChanged(String? value) {
//   setState(() {
//     selectedStatus = value;
//     selectedSpecifications = null;
//     selectedBMY = null;
//     selectedSize = null;
//     dropdownSpecVisible = value != null;
//   });
// }

// This method is called when a specification is selected in the dropdown
void onSpecsChanged(String? value) {
  setState(() {
    selectedSpecifications = value;
    selectedBMY = null;
    selectedSize = null;
    dropdownBMYVisible = value != null;
  });
}

// This method is called when a specification is selected in the dropdown
void onBMYChanged(String? value) {
  setState(() {
    selectedBMY = value;
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

// This method generates the DropdownButtonFormField items for specifications
// List<DropdownMenuItem<String>> getSpecItems() {
//   if (selectedStatus == null) {
//     return [];
//   }

//   return specifications[selectedStatus]!.map((country) {
//     return DropdownMenuItem(
//       value: country,
//       child: Center(child: Text(country)),
//     );
//   }).toList();
// }

// This method generates the DropdownButtonFormField items for brand/Models/Year
List<DropdownMenuItem<String>> getBMYItems() {
  if (selectedSpecifications == null) {
    return [];
  }

  return bmys[selectedSpecifications]!.map((country) {
    return DropdownMenuItem(
      value: country,
      child: Center(child: Text(country)),
    );
  }).toList();
}

// This method generates the DropdownButtonFormField items for brand/Models/Year
List<DropdownMenuItem<String>> getSizeItems() {
  if (selectedBMY == null) {
    return [];
  }

  return sizes[selectedBMY]!.map((country) {
    return DropdownMenuItem(
      value: country,
      child: Center(child: Text(country)),
    );
  }).toList();
}

}
