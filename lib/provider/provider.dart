import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real/models/gameSave.dart';

import 'dart:async';

Timer? timer;

final saveProviderNotifier =
    AutoDisposeChangeNotifierProvider<SaveProvider>((ref) => SaveProvider());

class SaveProvider with ChangeNotifier {
  GameSave? _save;
  late Isar isar;
  Timer? _timer;
  bool initialized = false;

  GameSave? get save => _save;

  bool _loading = true;
  bool get loading => _loading;

  SaveProvider() {
    init();
  }

  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [GameSaveSchema],
      inspector: true,
      directory: dir.path,
    );

    await getFirstSave();

    _loading = false;
    notifyListeners();

    return isar;
  }

  Isar getIsar() {
    return isar;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<GameSave?> getFirstSave() async {
    _save = await isar.gameSaves.where().findFirst();
    if (_save == null) {
      final newSave = GameSave();
      await isar.writeTxn(() async {
        await isar.gameSaves.put(newSave);
      });
      _save = await isar.gameSaves.where().findFirst();
      _loading = false;
      notifyListeners();
      return _save;
    }
    _loading = false;
    notifyListeners();

    return _save;
  }

  void triggerLoop() async {
    _save?.info_day += 1;

    await isar.writeTxn(() async {
      await isar.gameSaves.put(_save!);
    });
    notifyListeners();
  }

  void actionPurchaseProperty() async {
    if (_save!.money < 100) {
      return;
    }
    _save!.money -= 1000;
    await isar.writeTxn(() async {
      // make sure plotList.plots is an empty array
      if (_save?.plotList == null) {
        _save?.plotList = PlotList();
        _save?.plotList?.plots = [];
      }
      _save?.plotList?.plots!.add(Plot());
      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
  }
}

final saveProvider = ChangeNotifierProvider((ref) => SaveProvider());

void loop(isar, save) async {
  // add day
}
