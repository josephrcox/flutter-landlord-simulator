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

  GameSave({
    this.money = 55000,
    this.infoName = 'Save 1',
    this.infoDay = 1,
    this.infoYear = 1,
    this.plotList,
    this.rulesNewPropCost = 50000,
    this.rulesTaxRate = 0.1,
    this.staff,
    this.economyHealth = 100,
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

  Plot({
    this.residents = 0,
    this.plotUpgrades,
    this.propertyValue = 1000,
  });
}

@embedded
class Upgrades {
  List<String> upgradeOptions = [
    'swimmingPool',
    'freeUitilities',
    'dogsAllowed',
    'catsAllowed',
    'improvedSecurity',
    'easyTurnover',
  ];
  List<bool> upgradeValues = [
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
  int residentVacanciesFilledByPropertyManager = 0;

  List<String> staffOptions = [
    'manager'
  ];

  List<bool> staffValues = [
    false
  ];
}