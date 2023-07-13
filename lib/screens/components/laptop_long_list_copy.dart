import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/fetchLaptops.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_border.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/laptop_comparing_screen.dart';


class LaptopLongListCopy extends StatefulWidget {
  const LaptopLongListCopy({Key? key}) : super(key: key);

  @override
  State<LaptopLongListCopy> createState() => _LaptopLongListCopyState();
}

class _LaptopLongListCopyState extends State<LaptopLongListCopy> {
  List<LaptopData> multipleSelected = [];
  String valueFromField = '';
  List<LaptopData> filteredLaptops = [];
  List<LaptopData> checkListItems = [];
  
static const double horizontalPadding = 8.0;
static const double verticalPadding = 16.0;
static const double buttonPadding = 2.0;
static const double dividerThickness = 0.2;

  String? selectedStatus;
  String? selectedSpecifications;
  String? selectedBMY;
  String? selectedSize;

  final List<String> statuses = ['New', 'Refurbished'];
  final List<String> specifications = ['Brand', 'Model', 'Year'];
  final Map<String, List<String>> bmys = {
    'Brand': ['Dell', 'HP', 'MacBook'],
    'Model': ['Dell - Latidue 3550', 'MacBook Pro', 'EliteBook 840'],
    'Year': ['2017', '2018', '2019', '2020', '2021', '2022']
  };
  final Map<String, List<String>> sizes = {
    'Dell': ['15', '16', '17'],
    'Dell - Latidue 3550': ['15', '16', '17'],
    'EliteBook 840': ['14', '16', '17'],
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

bool selectAll = false; // define a boolean flag variable to track if "Select All" button is clicked
int selectedLaptopAmount = 0;


  @override
  void initState() {
    super.initState();
    checkListItems = filteredLaptops = laptopInfoData;
    // getData();
  }

  Future<void> getData() async {
    List<LaptopData> laptopData = await fetchLaptops();
    setState(() {
      checkListItems = laptopData;
      filteredLaptops = checkListItems;
    });
  }
  
  void _filterLaptopsWhileTyping(id) {
    setState(() {
      if (id.isEmpty) {   // check if the id argument is empty
        print('id is empty');
        filteredLaptops = checkListItems.toList();   // add this line to display the complete list
      } else {
        filteredLaptops = checkListItems
            .where((laptop) {
                return laptop.id == id;
            })
            .toList();
      }
    });
  }
  
void _filterLaptops(id) {
  setState(() {
    if (id.isEmpty) {
      print('id is empty');
      filteredLaptops = checkListItems.toList();
    } else {
      filteredLaptops = checkListItems
          .where((laptop) {
            return laptop.id.contains(id); // use the contains() method to check if the laptop id contains the text in the text field
          })
          .toList();
    }
  });
}

void _filterLaptopsByBrand(String laptopBrand) {
  setState(() {
    filteredLaptops = checkListItems
        .where((laptop) {
          return laptop.brand.contains(laptopBrand) || laptop.model.contains(laptopBrand); // use the contains() method to check if the laptop id contains the text in the text field
        })
        .toList();
  });
}

void _filterLaptopsByScreenSize(String secreenSize) {
  setState(() {
    print(selectedBMY);
    filteredLaptops = filteredLaptops.isEmpty ? checkListItems : filteredLaptops
        .where((laptop) {
          return laptop.screenSize.contains(secreenSize) && laptop.brand == selectedBMY; // use the contains() method to check if the laptop id contains the text in the text field
        })
        .toList();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(child: 
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
                  child: BuildHeader.buildHeader('LONG LIST'),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectAll, // set the value to the selectAll flag
                      onChanged: (bool ?value) {
                        setState(() {
                          selectAll = !selectAll; // toggle the selectAll flag on each button click
                          if (selectAll) {
                            multipleSelected = List.from(filteredLaptops); // if "Select All" was clicked, add all elements to the multipleSelected list
                          } else {
                            multipleSelected.clear(); // if "Select All" was unclicked, remove all elements from the multipleSelected list
                          }
                          selectedLaptopAmount = multipleSelected.length;
                        });
                      },
                    ),
                    Text(selectAll ? '    Unselect All' : '    Select All',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Column(
                  children: List.generate(
                    filteredLaptops.length,
                    (index) {
                      bool isChecked = multipleSelected.contains(filteredLaptops[index]);
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          filteredLaptops[index].brand + ' ' +filteredLaptops[index].model,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(filteredLaptops[index].id),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              multipleSelected.add(filteredLaptops[index]);
                              selectedLaptopAmount++;
                            } else {
                              multipleSelected.remove(filteredLaptops[index]);
                              selectedLaptopAmount--;
                            }
                          });
                        },
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(appPadding),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        // style: DefaultTextStyle(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'You have selected ',
                          ),
                          TextSpan(
                            text: '$selectedLaptopAmount',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' pieces',
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(appPadding),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        multipleSelected.isEmpty 
                          ?
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Warning"),
                                content: Text("Please Select Laptop(s) from the List"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          )
                          :
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LaptopComparingScreen(arguments: multipleSelected,),
                              settings: RouteSettings(arguments: multipleSelected),
                            ),
                          );
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                )
              ],
            ),
          ),),
          BuildBorder.buildBorder(context),
          Flexible(child:
          SizedBox(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: BuildHeader.buildHeader('SELECT 1 LAPTOP'),
                ),
                Container(
                  padding: EdgeInsets.all(appPadding),
                  child: Text(
                    'Type laptop ID of current laptop and click enter',
                    style: TextStyle(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      fontSize: 12,
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Laptop ID',
                    ),
                    onChanged: (value) {
                      _filterLaptops(value);
                      setState(() {
                        valueFromField = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () async {
                      return _filterLaptopsWhileTyping(valueFromField);
                    },
                    color: Colors.grey,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: const Text('Enter'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding * buttonPadding),
                  child: Divider(
                    color: grey,
                    thickness: dividerThickness,
                  ),
                ),
              ],
            ),
          ),),
          BuildBorder.buildBorder(context),
          Flexible(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: BuildHeader.buildHeader('SELECT SET'),
                ),
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
            )
          ),
        ],
      ),
    );
  }

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
    _filterLaptopsByBrand(value as String);
  });
}

// This method is called when a specification is selected in the dropdown
void onSizeChanged(String? value) {
  setState(() {
    selectedSize = value;
    // _filterLaptopsByScreenSize(value as String);
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