import 'package:isar/isar.dart';

part 'gameSave.g.dart';

@collection
class GameSave {
  Id id = Isar.autoIncrement;

  int money;
  int lastProfit;

  String infoName;

  int infoDay;
  int infoYear;

  PlotList? plotList;

  Staff? staff;

  int rulesNewPropCost;
  double rulesTaxRate;

  GameSave({
    this.money = 55000,
    this.lastProfit = 0,
    this.infoName = 'Save 1',
    this.infoDay = 1,
    this.infoYear = 1,
    this.plotList,
    this.rulesNewPropCost = 50000,
    this.rulesTaxRate = 0.1,
    this.staff,
  });
}

@embedded
class PlotList {
  List<Plot>? plots;
}

@embedded
class Plot {
  int rent;
  int residents;
  int maxResidents;
  int happiness;
  Upgrades? plotUpgrades;

  Plot({
    this.rent = 500,
    this.residents = 0,
    this.maxResidents = 10,
    this.happiness = 75,
    this.plotUpgrades,
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