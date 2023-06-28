import 'dart:math';

import 'package:isar/isar.dart';
import '../configSettings.dart';

part 'gameSave.g.dart';

final random = Random();

@collection
class GameSave {
  Id id = Isar.autoIncrement;
  int money;
  List<int> profitHistory = [];
  List<double> economyTrends = [];
  int economyTrendIndex = 0;
  double economyHealth;
  String infoName;
  int infoDay;
  int infoYear;
  PlotList? plotList;
  Staff? staff;
  int rulesNewPropCost;
  double rulesTaxRate;
  bool gameOver;

  GameSave({
    this.money = 75000,
    this.infoName = 'Save 1',
    this.infoDay = 1,
    this.infoYear = 1,
    this.plotList,
    this.rulesNewPropCost = 50000,
    this.rulesTaxRate = 0.1,
    this.staff,
    this.economyHealth = 150,
    this.gameOver = false,
  });
}

@embedded
class PlotList {
  List<ResPlot>? resPlots;
  List<BusPlot>? busPlots;
}

@embedded
class ResPlot {
  int id = random.nextInt(1000000000);
  int rent = gameSettings['defaultRent'];
  String? type; // residential
  String? subType; // singleFamilyHome
  String? area = 'A';
  String? subArea = '1';
  int residents = 0;
  int maxResidents = gameSettings['defaultMaxResidents'];
  int happiness = gameSettings['defaultHappiness'];
  Upgrades? amenities;
  int propertyValue;
  int purchaseDate;

  ResPlot({
    this.residents = 0,
    this.amenities,
    this.propertyValue = 50000,
    this.purchaseDate = -1,
  });
}

@embedded
class BusPlot {
  int id = random.nextInt(1000000000);
  String area = 'A';
  String subarea = '1';
  String subtype;
  int propertyValue;
  int totalRevenue;

  BusPlot({
    this.subtype = '',
    this.propertyValue = 50000,
    this.totalRevenue = 0,
  });
}

@embedded
class Upgrades {
  List<String> amenOptions = [
    'dogsAllowed',
    'catsAllowed',
    'freeUitilities',
    'easyTurnover',
    'improvedSecurity', // start of level 2
    'swimmingPool',
    'gym',
    'playground', // start of level 3
    'basketball',
  ];
  List<bool> amenValues = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  Upgrades();
}

@embedded
class Staff {
  int residentVacanciesFilledByLeasingAgent = 0;

  List<String> staffOptions = [
    'leasingAgent',
    'propertyManager',
    'taxExpert',
    'advancedLeasingAgent',
  ];

  List<bool> staffValues = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
}
