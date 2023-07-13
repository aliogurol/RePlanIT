import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class LaptopLongList extends StatefulWidget {
  const LaptopLongList({Key? key}) : super(key: key);


  @override
  State<LaptopLongList> createState() => _LaptopLongListState();
}

class _LaptopLongListState extends State<LaptopLongList> {
  List multipleSelected = [];
  List filteredLaptops = [];
  List checkListItems = [
    {
      "id": 2890,
      "value": false,
      "title": 'HP 2.1 16" - ID 2890',
    },
    {
      "id": 2891,
      "value": false,
      "title": 'HP 2.1 16" - ID 2891',
    },
    {
      "id": 2892,
      "value": false,
      "title": 'HP 2.1 16" - ID 2892',
    },
    {
      "id": 2893,
      "value": false,
      "title": 'HP 2.1 16" - ID 2893',
    },
  ];
  
  @override
  void initState() {
    filteredLaptops = List.from(checkListItems);
    super.initState();
  }

  void selectOrDeselectAll(bool value) {
    setState(() {
      filteredLaptops.forEach((element) => element['value'] = value);
      multipleSelected = List.from(filteredLaptops);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              padding: EdgeInsets.all(appPadding),
              child: Text(
                'LONG LIST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )
              ),
            ),
            InkWell(
              onTap: () => selectOrDeselectAll(true),
              child: Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text("Select All",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              children: filteredLaptops.map((laptop) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    laptop["title"],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  value: laptop["value"],
                  onChanged: (value) {
                    setState(() {
                      laptop["value"] = value;
                      if (value!) {
                        multipleSelected.add(laptop);
                      } else {
                        multipleSelected.remove(laptop);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(appPadding, 100, appPadding, appPadding),
              child: ElevatedButton(
              onPressed: () {
      
              },
              child: Text("Continue")
          ),
            )
          ],
      ),
    );
  }
}
