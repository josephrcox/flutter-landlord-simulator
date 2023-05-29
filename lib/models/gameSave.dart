import 'package:isar/isar.dart';
import 'package:pubspec/pubspec.dart';

part 'gameSave.g.dart';

@collection
class GameSave {
  Id id = Isar.autoIncrement;

  String info_name;
  int money;

  GameSave({
    this.info_name = 'Save 1',
    this.money = 1000,
  });  
}