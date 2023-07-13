
import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';

class Formula {
  static int getCO2FootprintProduction(LaptopData laptop, int amount) {
    return laptop.co2Production*amount;
  }
  
  static int getCO2FootprintProductionForSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (newLaptop.co2Production - laptop.co2Production) * amount;
  }
  static int getCO2FootprintUsePerYear(LaptopData laptop, int? amount) {
    if(amount != null){
      return ((laptop.co2ProductionPerLifeTime~/4)*amount);
    }
    return (laptop.co2ProductionPerLifeTime~/4);
  }
  static int getCO2FootprintUsePerYearForSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return getCO2FootprintCostUsePerYear(newLaptop,1) - getCO2FootprintCostUsePerYear(laptop,1);
  }
  static int getTruePurchaseCost(LaptopData laptop, int amount) {
    return ( (laptop.co2Production*0.418).round() + laptop.purchaseCost) * amount;
  }
  
  static int getTruePurchaseCostForSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (( getTruePurchaseCost(newLaptop,1) - getTruePurchaseCost(laptop,1) ) / (newLaptop.expectedLifeTime/laptop.expectedLifeTime) ).round()* amount;
  }
  
  static int getPurchaseCostForSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (( newLaptop.purchaseCost - laptop.purchaseCost ) / (newLaptop.expectedLifeTime/laptop.expectedLifeTime) ).round()* amount;
  }

  static int getCO2FootprintCostProduction(LaptopData laptop, int amount) {
    return (laptop.co2Production*0.418).round()*amount;
  }
  
  static int getCO2FootprintCostProductionForSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (getCO2FootprintCostProduction(newLaptop,1) - getCO2FootprintCostProduction(laptop,1) / (newLaptop.expectedLifeTime/laptop.expectedLifeTime)).round()*amount;
  }

  static int getCO2FootprintCostUsePerYear(LaptopData laptop, int amount) {
    return (laptop.co2ProductionPerLifeTime~/4*0.418).round()*amount;
    // return (laptop.co2ProductionPerLifeTime~/laptop.expectedLifeTime*0.418).round()*amount;
  }
    
  static int getCO2FootprintCostUsePerYearForSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (getCO2FootprintCostUsePerYear(newLaptop,1) - getCO2FootprintCostUsePerYear(laptop,1)).round()*amount;
    // return (laptop.co2ProductionPerLifeTime~/laptop.expectedLifeTime*0.418).round()*amount;
  }
  static int getCO2FootprintTotalImpact(LaptopData laptop, int amount) {
    if(laptop.status == 'New'){
      return ( laptop.co2Production + getCO2FootprintUsePerYear(laptop,1)).round()*amount;
    }
    return (laptop.co2Production + getCO2FootprintUsePerYear(laptop,1) ) * amount;
    // return ( (laptop.co2Production + laptop.co2ProductionPerLifeTime) / (4/laptop.expectedLifeTime)).round()*amount;
  }
  
  static int getCO2FootprintTotalImpactSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return ( getCO2FootprintTotalImpact(newLaptop,1) - getCO2FootprintTotalImpact(laptop,1)).round() * amount;
  }

  static int getCO2FootprintCostTotalImpact(LaptopData laptop, int amount) {
    if(laptop.status == 'New'){
      return (getCO2FootprintCostUsePerYear(laptop,1) + getCO2FootprintProduction(laptop,1) * 0.418 ).round()*amount;
    }
    return (getCO2FootprintUsePerYear(laptop,1)* 0.418*amount).round();
  }

  static int getCO2FootprintCostTotalImpactSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (getCO2FootprintTotalImpactSavings(laptop,1,newLaptop) * 0.418* amount).round();
    // final totalImpactForNew = (newLaptop.co2Production + newLaptop.co2ProductionPerLifeTime) * amount;
    // final totalImpact = (laptop.co2Production + laptop.co2ProductionPerLifeTime) / (newLaptop!.expectedLifeTime/laptop.expectedLifeTime) * amount;
    // return '-€ '+ (( totalImpactForNew / (newLaptop.expectedLifeTime/laptop.expectedLifeTime) - totalImpact)*0.418).round().toString() + ',-';
  }
  
  static double getVirgenResource(LaptopData laptop, int amount) {
    return laptop.virgen*amount;
  }
  
  static double getVirgenResourceSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    return (newLaptop.virgen - laptop.virgen)*amount;
  }

  static double getEwaste(LaptopData laptop, int amount) {
    return laptop.eWaste*amount;
  }

  static double getEwasteSavings(LaptopData laptop, int amount, LaptopData newLaptop) {
    if(laptop.status == 'refurbished'){
      return (newLaptop.eWaste - laptop.eWaste)*amount;
    }
    return newLaptop.eWaste*amount;
  }
  
}
