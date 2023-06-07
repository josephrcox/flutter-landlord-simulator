import 'package:isar/isar.dart';

part 'gameSave.g.dart';

@collection
class GameSave {
  Id id = Isar.autoIncrement;

  int money;

  String infoName;

  int infoDay;
  int infoYear;

  PlotList? plotList;

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
  int happiness; // out of 100
  Upgrades? plotUpgrades;

  Plot({
    this.rent = 400,
    this.residents = 0,
    this.maxResidents = 10,
    this.happiness = 50,
    this.plotUpgrades,
  });
}

@embedded
class Upgrades {
  List<String> upgradeOptions = [
    'swimmingPool',
  ];
  List<bool> upgradeValues = [
    false,
  ];

  Upgrades();
}



