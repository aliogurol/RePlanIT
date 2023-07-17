import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/leafProvider.dart';

class LaptopListView extends StatefulWidget {
  final List<LaptopData>? laptops;
  final void Function(List<LaptopData> selectedLaptops) onSelectionChanged;

  const LaptopListView({Key? key, required this.laptops, required this.onSelectionChanged}) : super(key: key);

  @override
  _LaptopListViewState createState() => _LaptopListViewState();
}

class _LaptopListViewState extends State<LaptopListView> {
  final List<LaptopData> selectedLaptops = [];  // Using a Set instead of List to avoid duplicates
  void handleCheckboxChange(bool? value, int index) {
    setState(() {
      if (value == true) {
        selectedLaptops.add(laptopInfoData[index]);
      } else {
        selectedLaptops.remove(laptopInfoData[index]);
      }
      widget.onSelectionChanged(selectedLaptops); // Converting Set to List
    });
  }

Widget buildLaptopListTile(LaptopData laptop, isSelected) {
  return Card(
    child: Flex(
      direction: Axis.horizontal,
      children: [
        SizedBox(
          width: 80,
          child: Image.asset(
            'assets/images/laptopSampleImgae.png',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    '${laptop.brand} ${laptop.model}',
                    style: TextStyle(fontSize: 13)
                  )
                ),
                LeafIconProvider.getLeafIcons(laptop.status),
              ],
            ),
            subtitle: Text(
              laptop.status,
              style: TextStyle(fontSize: 12),
            ),
            trailing: Checkbox(
              value: isSelected == null ? false : true,
              onChanged: (value) => handleCheckboxChange(value, laptopInfoData.indexOf(laptop)),
            ),
          ),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BuildHeader.buildHeader('SELECT TO COMPARE'),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: laptopInfoData.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {

  //               final isSelected =  widget.laptops[index].id ==
  // (selectedLaptops.toList().isEmpty || selectedLaptops.length <= index ? false : selectedLaptops.toList()[index].id);
              // final isSelected = selectedLaptops.contains(widget.laptops[index]);
              var isSelected;

              for(var laptop in selectedLaptops) {
                if (laptop.id == laptopInfoData[index].id) {
                 isSelected = true;
                
                  break;
                }
              }


                if(selectedLaptops.isEmpty){
                  isSelected = true;
                  widget.laptops!.forEach((element) {selectedLaptops.add(element);});
                }
              return buildLaptopListTile(laptopInfoData[index], isSelected);
              },
            ),
          ),
        ],
      ),
    );
  }
}
