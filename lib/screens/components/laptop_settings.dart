import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

class LaptopSettings extends StatefulWidget {
const LaptopSettings({Key? key}) : super(key: key);

@override
_LaptopSettingsState createState() => _LaptopSettingsState();
}

class _LaptopSettingsState extends State<LaptopSettings> {
	
  bool visible_for_brand = false;
  bool visible_for_size = false;
  bool visible_for_specification = false;

  String? selectedValue;
  final _dropdownFormKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'SELECT SET',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            )
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(appPadding, appPadding, appPadding, 30),
          child: Text(
            'Select set of laptops based on corresponding properties',
            style: TextStyle(
              backgroundColor:Colors.white,
              color: Colors.black,
              fontSize: 12,
              )),
        ),
        Form(
          key: _dropdownFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              makeTitle('Corresponding property'),
              makeDropDown('status'),
              Visibility(child:makeTitle('Specifications'), visible: visible_for_specification,),
              Visibility(child:makeDropDown('sepcifications'), visible: visible_for_specification,),
              Visibility(child:makeTitle('Brand'), visible: visible_for_brand,),
              Visibility(child:makeDropDown('brand'), visible: visible_for_brand,),
              Visibility(child:makeTitle('Screen Size'), visible: visible_for_size,),
              Visibility(child:makeDropDown('size'), visible: visible_for_size,),
            ],
          )
        ),
      ],
    ),
  );
}

  makeDropDown(String $text)=>
    Container(
      padding: EdgeInsets.fromLTRB(appPadding, 0, appPadding, 40),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        validator: (value) => value == null ? "Select a value from the List" : null,
        dropdownColor: Colors.grey,
        value: $text,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
            if ($text == 'status') {
              visible_for_specification = true;
            }else if($text == 'sepcifications'){
              visible_for_brand = true;
            }
            else if($text == 'brand'){
              visible_for_size = true;
            }
          });
        },
        items: dropdownItems($text),
        ),
    );
  
  makeTitle(String $text)=>
    Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(appPadding, 0, appPadding, 0),
      child: Text(
        $text,
        style: TextStyle(
          backgroundColor:Colors.white,
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold
        )
      ),
    );

  List<DropdownMenuItem<String>> dropdownItems(value){
    List<DropdownMenuItem<String>> menuItems = [];
    switch(value) { 
      case 'status': { 
        menuItems = [
          DropdownMenuItem(child: Text('status'),value: 'status'),
          DropdownMenuItem(child: Text('new'),value: 'new'),
          DropdownMenuItem(child: Text('refurbished'),value: 'refurbished'),
        ];
    } 
    break; 
    
      case 'sepcifications': { 
        menuItems = [
          DropdownMenuItem(child: Text('sepcifications'),value: 'sepcifications'),
          DropdownMenuItem(child: Text('brand'),value: 'brand'),
          DropdownMenuItem(child: Text('model'),value: 'model'),
          DropdownMenuItem(child: Text('year'),value: 'year'),
        ];
      } 
      break; 
    
      case 'brand': { 
        menuItems = [
          DropdownMenuItem(child: Text('brand'),value: 'brand'),
          DropdownMenuItem(child: Text('HP'),value: 'hp'),
          DropdownMenuItem(child: Text('Dell'),value: 'dell'),
          DropdownMenuItem(child: Text('MacBook'),value: 'macbook'),
        ];
      } 
      break; 
      
      case 'size': { 
        menuItems = [
          DropdownMenuItem(child: Text('size'),value: 'size'),
          DropdownMenuItem(child: Text('18'),value: '18'),
          DropdownMenuItem(child: Text('20'),value: '20'),
          DropdownMenuItem(child: Text('22'),value: '22'),
        ];
      } 
      break; 
        
    default: { 
      menuItems = [
        DropdownMenuItem(child: Text('status'),value: 'status'),
        DropdownMenuItem(child: Text('brand'),value: 'brand'),
        DropdownMenuItem(child: Text('HP'),value: 'HP'),
        DropdownMenuItem(child: Text('size'),value: 'size'),
      ]; 
    }
    break; 
  } 
    return menuItems;
  }

}




