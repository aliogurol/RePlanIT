import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/buttons/impact_button.dart';
import 'package:responsive_admin_dashboard/screens/components/formula.dart';
import 'package:responsive_admin_dashboard/screens/components/leafProvider.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

class DataTableAlternativeLaptops {
static Widget createTable(BuildContext context,List<LaptopData> selectedLaptops, arguments, previousPage) {
  ScrollController _scrollController = ScrollController();
  return Scrollbar(
    radius: Radius.circular(5),
    thickness: 15,
    thumbVisibility: true,
    controller: _scrollController,
    child: Column(
    children: [
      BuildHeader.buildHeader('SELECTION OF ALTERNATIVES'),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        padding: EdgeInsets.only(top: 40),
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: selectedLaptops.length,
          itemBuilder: (BuildContext context, int index) {
            LaptopData laptop = selectedLaptops[index];
            if(laptop.status == 'New' && laptop.brand == 'HP'){
              return Container();
            }
            return DataTable(
            headingRowHeight: 215,
            dataRowHeight: 30,
            columns: [
              DataColumn(
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(laptop.status),
                    Container(
                      height: 40,
                      width: 200,
                      child: Text(
                        getSuggestion(laptop),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Image.asset('assets/images/laptopSampleImgae.png'),
                    ),
                    Text(laptop.brand + ' ' + laptop.model,style: TextStyle(fontSize: 10,),),
                    Text(laptop.screenSize,style: TextStyle(fontSize: 10,),),
                    LeafIconProvider.getLeafIcons(laptop.status)
                  ],
                ),
              ),
            ],
            rows: getRowsFor(arguments,laptop, previousPage)
            );
          },
        ),
      ),
    ],
    )
    );
  }
  
  static getRowsFor(arguments,laptop, previousPage) {
    const greyTextStyle = TextStyle(color: Colors.grey);
        return [
          DataRow(cells: [
            DataCell(Text('')),
          ]),               
          DataRow(cells: [
            DataCell(Text('')),
          ]),             
          DataRow(cells: [
            DataCell(Text(laptop.co2Production.toString() + ' kg')),
          ]),               
          DataRow(cells: [
            DataCell(Text(Formula.getCO2FootprintUsePerYear(laptop, getQuantitiyFor(arguments)).toString() + ' kg')),
          ]),            
          DataRow(cells: [
            DataCell(Text(laptop.circularity)),
          ]),            
          DataRow(cells: [
            DataCell(Text(Formula.getVirgenResource(laptop, getQuantitiyFor(arguments)).toStringAsFixed(1) + ' kg')),
          ]),          
          DataRow(cells: [
            DataCell(Text(laptop.eWaste.toStringAsFixed(1) + ' kg')),
          ]), 
          DataRow(cells: [
            DataCell(Text('')),
          ]),             
          DataRow(cells: [
            DataCell(Text('')),
          ]), 
          DataRow(cells: [
            DataCell(Text('€ ' + Formula.getTruePurchaseCost(laptop, getQuantitiyFor(arguments)).toString())),
          ]),
          DataRow(cells: [
            DataCell(Text('€ ' + laptop.purchaseCost.toString(),style: greyTextStyle,)),
          ]),
          DataRow(cells: [
            DataCell(Text('€ '+ Formula.getCO2FootprintCostProduction(laptop, getQuantitiyFor(arguments)).toString(),style: greyTextStyle,)),
          ]), 
          DataRow(cells: [
            DataCell(Text('€ '+ Formula.getCO2FootprintCostUsePerYear(laptop, getQuantitiyFor(arguments)).toString())),
          ]),  
          DataRow(cells: [
            DataCell(Text('Yes')),
          ]),  
          DataRow(cells: [
            DataCell(Text('')),
          ]),                  
          DataRow(cells: [
            DataCell(Row(
              children: [
                ImpactOfChoiceButton(laptop:laptop, quantitiy:getQuantitiyFor(arguments),previousPage: previousPage,),
                SizedBox(width: 5,),
                buildOrderButton(),
              ],
            )),
          ]),
        ];
      }

  static getQuantitiyFor(laptops) {
    if(laptops[0] == 5){
        return laptops[1].length;
    }
    // else if(laptops[0] == 4){
    //   return 1;
    // }   
    return 1;
  }

  static String extractTextFromWidget(String input) {
    RegExp regExp = RegExp(r'"([^"]*)"');
    String extractedText = regExp.firstMatch(input)?.group(1) ?? "";
    return extractedText;
  }
    
}
