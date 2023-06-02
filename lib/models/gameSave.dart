import 'package:isar/isar.dart';

part 'gameSave.g.dart';

@collection
class GameSave {
  Id id = Isar.autoIncrement;

  String info_name;
  int info_day;
  int money;
  PlotList? plotList;

  GameSave({
    this.info_name = 'Save 1',
    this.money = 1000,
    this.info_day = 1,
    this.plotList,
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

  Plot({
    this.rent = 200,
    this.residents = 0,
    this.maxResidents = 10,
    this.happiness = 50,
  });
}

