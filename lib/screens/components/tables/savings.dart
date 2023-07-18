import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/data/laptops.dart';
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';
import 'package:responsive_admin_dashboard/screens/components/build_header.dart';
import 'package:responsive_admin_dashboard/screens/components/buttons/impact_button.dart';
import 'package:responsive_admin_dashboard/screens/components/formula.dart';
import 'package:responsive_admin_dashboard/screens/components/leafProvider.dart';
import 'package:responsive_admin_dashboard/screens/components/selected_laptops_to_compare.dart';

class DataTableSavings {
  static Widget createTable(BuildContext context,List<LaptopData> selectedLaptops, arguments, previousPage) {
    return Column(
      children: [
        BuildHeader.buildHeader('SELECTION OF ALTERNATIVES'),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 40),
            scrollDirection: Axis.horizontal,
            itemCount: selectedLaptops.length,
            itemBuilder: (BuildContext context, int index) {
              LaptopData laptop = selectedLaptops[index];
              if(laptop.status == 'New'&& laptop.brand == 'HP'){
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
              rows: getRowsFor(laptop, arguments, previousPage)
              );
            },
          ),
        ),
      ],
    );
  }
  
  static getRowsFor(laptop,arguments, previousPage) {
    int quantitiy = 1;
    if(arguments.first is int && arguments.first == 5){
      quantitiy = arguments[1].length;
    }
    const greenTextStyle = TextStyle(color: Colors.green);
    final LaptopData newLaptop = laptopInfoData.where((laptopInstance) => laptopInstance.status == 'New' && laptopInstance.brand == laptop.brand).first;

        return [
          DataRow(cells: [
            DataCell(Text('')),
          ]),                           
          DataRow(cells: [
              DataCell(Text(laptop.status == 'extend support 2 years' ? 'savings first year' : (laptop.status == 'refurbished' ? 'savings first year' : 'savings first year') ))
          ]),               
          DataRow(cells: [
            DataCell(Text('-' + Formula.getCO2FootprintTotalImpactSavings(laptop, quantitiy,newLaptop).toString() +' kg', style: greenTextStyle,)),
          ]),             
          DataRow(cells: [
            DataCell(Text('-' + Formula.getCO2FootprintProductionForSavings(laptop, quantitiy,newLaptop).toString() +' kg',style:greenTextStyle)),
          ]),               
          DataRow(cells: [
              DataCell(Text('-' + Formula.getCO2FootprintUsePerYearForSavings(laptop,quantitiy,newLaptop).toString() +' kg',style:greenTextStyle ))
          ]),                    
          DataRow(cells: [
            DataCell(Text(laptop.circularity,style:greenTextStyle ))
          ]),          
          DataRow(cells: [
            DataCell(Text('-' + Formula.getVirgenResourceSavings(laptop,quantitiy,newLaptop).toStringAsFixed(1) + ' kg',style: greenTextStyle,)),
          ]),             
          DataRow(cells: [
            DataCell(Text('-' + Formula.getEwasteSavings(laptop, quantitiy, newLaptop).toStringAsFixed(1) + ' kg', style: greenTextStyle,)),
          ]), 
          DataRow(cells: [
            DataCell(Text('')),
          ]), 
          DataRow(cells: [
            DataCell(Text('')),
          ]), 
          DataRow(cells: [
            DataCell(Text('-€ ' + Formula.getTruePurchaseCostForSavings(laptop, quantitiy,newLaptop).toString(),style:greenTextStyle ))
          ]),
          DataRow(cells: [
            DataCell(Text('-€ ' + Formula.getPurchaseCostForSavings(laptop,quantitiy,newLaptop).toString(),style:greenTextStyle ))
          ]),
          DataRow(cells: [
            DataCell(Text('-€ ' + Formula.getCO2FootprintCostProductionForSavings(laptop,quantitiy,newLaptop).toString(),style:greenTextStyle ))
          ]), 
          DataRow(cells: [
            DataCell(Text('-€ ' + Formula.getCO2FootprintUsePerYearForSavings(laptop, quantitiy, newLaptop).toString(),style:greenTextStyle ))
          ]),  
          DataRow(cells: [
            DataCell(Text('')),
          ]),  
          DataRow(cells: [
            DataCell(Text('')),
          ]),                  
          DataRow(cells: [
            DataCell(Row(
              children: [
                ImpactOfChoiceButton(laptop:laptop, quantitiy:getQuantitiyFor(arguments),previousPage: previousPage),
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
}
