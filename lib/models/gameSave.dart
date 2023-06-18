import 'package:isar/isar.dart';
import '../configSettings.dart';

part 'gameSave.g.dart';

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
  List<Plot>? plots;
}

@embedded
class Plot {
  int rent = gameSettings['defaultRent'];
  int residents = 0;
  int maxResidents = gameSettings['defaultMaxResidents'];
  int happiness = gameSettings['defaultHappiness'];
  Upgrades? plotUpgrades;
  int propertyValue;
  int level = 1;

  Plot({
    this.residents = 0,
    this.plotUpgrades,
    this.propertyValue = 50000,
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

  List<String> staffOptions = ['leasingAgent'];

  List<bool> staffValues = [false];
}
