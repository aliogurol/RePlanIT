import 'package:responsive_admin_dashboard/models/laptop_info_model.dart';

LaptopData standardizedLaptopData(map) {
  return LaptopData(
    id: map['id']??'NA',
    brand: map['Brand']??'NA',
    model: map['Model']??'NA',
    status: map['Status']?? map['hasStatus']??'NA',
    costsUsePerYearGHG: map['costsUsePerYearGHG']??'NA',
    processor: map['processor']??'NA',
    image: 'assets/images/laptopSampleImgae.png',
    ramSize: map['ram'] ?? 'NA',
    screenSize: map['ScreenSize'] ?? '14"',
    storage: map['storage'] ?? '256',
    stock: map['stock'] ?? '25',
    circularity: map['circularity'] ?? 'NA',
    co2Production: map['co2Production'] ?? 'NA',
    co2ProductionPerLifeTime: map['co2ProductionPerLifeTime'] ?? 'NA',
    emissionUse: map['emissionUse'] ?? 'NA',
    purchaseCost: map['PurchaseCost'] ?? 'NA',
    eWaste: map['eWaste'] ?? 'NA',
    virgen: map['virgen'] ?? 'NA',
    energyConsumption: map['energyConsumption'] ?? '300 kWh',
    expectedLifeTime: map['expectedLifeTime'] ?? '4 years',
    sparePart: map['sparePart'] ?? 'medium',
    supportPeriod: map['supportPeriod'] ?? '4 years',
    repearibility: map['reparability'] ?? 'medium',
    criticalMaterials: map['criticalMaterials'] ?? '0,02%',
    deliveryTime: map['deliveryTime'] ?? '4 weken',
    useGHG: map['useGHG'] ?? '€30',
  );
}