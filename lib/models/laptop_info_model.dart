class LaptopData {
  final String id;
  final String brand;
  final String model;
  final String processor;
  final String status;
  final String image;
  final String screenSize;
  final String ramSize;
  final String storage;
  // final String costsProductionGHG;
  final String costsUsePerYearGHG;
  final String circularity;
  final double eWaste;
  final double virgen;
  final int co2Production;
  // final String co2ProductionPerYear;
  final int co2ProductionPerLifeTime;
  final String emissionUse;
  final String energyConsumption;
  final int expectedLifeTime;
  final String deliveryTime;
  final int purchaseCost;
  final String useGHG;
  final String sparePart;
  final String supportPeriod;
  final String stock;
  final String criticalMaterials;
  final String repearibility;

  LaptopData({
    required this.id,
    required this.brand,
    required this.model,
    required this.processor,
    required this.status,
    required this.image,
    required this.screenSize,
    required this.ramSize,
    required this.storage,
    // required this.costsProductionGHG,
    required this.costsUsePerYearGHG,
    required this.circularity,
    required this.eWaste,
    required this.virgen,
    required this.co2Production,
    // required this.co2ProductionPerYear,
    required this.co2ProductionPerLifeTime,
    required this.emissionUse,
    required this.energyConsumption,
    required this.expectedLifeTime,
    required this.deliveryTime,
    required this.purchaseCost,
    required this.useGHG,
    required this.sparePart,
    required this.supportPeriod,
    required this.stock,
    required this.criticalMaterials,
    required this.repearibility,
  });
}