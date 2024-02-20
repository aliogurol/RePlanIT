import 'package:flutter/material.dart';

// Colors used in this app
const primaryColor = Color.fromRGBO(17, 159, 250, 1);
const secondaryColor = Colors.white;
const bgColor = Color.fromRGBO(247, 251, 254, 1);
const textColor = Colors.black;
const lightTextColor = Colors.black26;
const transparent = Colors.transparent;

const grey = Color.fromRGBO(148, 170, 220, 1);
const purple = Color.fromRGBO(165, 80, 179, 1);
const orange = Color.fromRGBO(251, 137, 13, 1);
const green = Color.fromRGBO(51, 173, 127, 1);
const red = Colors.red;

const bold = TextStyle(fontWeight: FontWeight.bold);

const boldOrange = TextStyle(fontWeight: FontWeight.bold, color: orange);
const boldGreen = TextStyle(fontWeight: FontWeight.bold, color: green);

// Default App Padding
const appPadding = 16.0;

// scenarios
List<Map> tempSustainabilityScenarios = [
  {
    'scenario': 'A1 Change power settings to balance mode',
    'CO2Emissions': '-9.5',
    'EnergyConsuption': '-35',
    'EWasteCreated': '0',
    'unit': 'kTon CO2 eq.'
  },
  {
    'scenario': 'A2 Decrease capacity by 25%',
    'CO2Emissions': '-20.7',
    'EnergyConsuption': '-47.3',
    'EWasteCreated': '-121',
    'unit': 'MWh'
  },
  {
    'scenario': 'A3 Replace 93 servers by 31 next generation models',
    'CO2Emissions': '-16.6',
    'EnergyConsuption': '-77',
    'EWasteCreated': '341 ',
    'unit': 'kg'
  },
];

// scenarios
List<String> tempExpansionScenarios = [
  'S1: Expand with 2 new servers model x',
  'S2: Expand with 3 refurbished servers model y',
  'S3: Upgrade 10 current servers',
];

// scenarios
List<Map> tempImpactReportScenarios = [
  {
    'scenario': 'A1 Replace 3 servers by 1 next gen',
    'ghgEmissions': '-11',
    'co2Costs': '-11',
    'virginMaterials': '250',
    'eWaste': '300',
    'circularity': '10',
    'electricityUse': '-11',
    'electricityCosts': '-11',
  },
  {
    'scenario': 'A2 Upgrade all RAM',
    'ghgEmissions': '22',
    'co2Costs': '22',
    'virginMaterials': '1000',
    'eWaste': '1000',
    'circularity': '40',
    'electricityUse': '22',
    'electricityCosts': '22',
  },
  {
    'scenario': 'A3 Decrease capacity by 25%',
    'ghgEmissions': '-330',
    'co2Costs': '-330',
    'virginMaterials': '230',
    'eWaste': '230',
    'circularity': '45',
    'electricityUse': '-330',
    'electricityCosts': '-330',
  },
  {
    'scenario': 'A4 Change to balance mode',
    'ghgEmissions': '-100',
    'co2Costs': '-100',
    'virginMaterials': '0',
    'eWaste': '0',
    'circularity': '42',
    'electricityUse': '-100',
    'electricityCosts': '-100',
  },
  {
    'scenario': '',
    'ghgEmissions': '-90',
    'co2Costs': '-90',
    'virginMaterials': '0',
    'eWaste': '0',
    'circularity': '42',
    'electricityUse': '-90',
    'electricityCosts': '-90',
  },
  {
    'scenario': 'A6 Replace server by refurbished',
    'ghgEmissions': '100',
    'co2Costs': '100',
    'virginMaterials': '250',
    'eWaste': '250',
    'circularity': '50',
    'electricityUse': '100',
    'electricityCosts': '100',
  },
  
];
