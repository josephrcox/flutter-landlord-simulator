import 'dart:math';

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
    loop(isar, _save!);
    notifyListeners();
  }

  void actionSetRent(int rent, int index) async {
    if (rent < 0) {
      return;
    }
    await isar.writeTxn(() async {
      final newPlots = _save?.plotList?.plots?.toList();
      newPlots?[index].rent = rent;
      _save?.plotList?.plots = newPlots;
      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
  }

  Future<int> actionSearchForResidents(int index) async {
    int increase = 0;

    await isar.writeTxn(() async {
      final newPlots = _save?.plotList?.plots?.toList();
      final plot = newPlots?[index];
      if (plot!.residents >= plot.maxResidents) {
        print('this plot is full');
        return;
      }
      if ((plot!.rent / 10) > _save!.money) {
        print('cant afford to search for residents');
        return;
      }
      // take money, 1/10th of the rent, rounded down to int
      _save!.money -= (plot.rent / 10).floor();
      // check if they get a resident by looking at the happiness and halving the % chance
      final random = Random();
      final happiness = plot.happiness;
      final chance = happiness / 2;
      final roll = random.nextInt(100);
      if (roll < chance) {
        plot.residents += 1;
        increase = 1;
      }

      _save?.plotList?.plots = newPlots;
      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
    return increase;
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
      final newPlots = _save?.plotList?.plots?.toList();
      newPlots?.add(Plot());
      _save?.plotList?.plots = newPlots;
      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
  }
}

final saveProvider = ChangeNotifierProvider((ref) => SaveProvider());

void loop(Isar isar, save) async {
  save?.info_day += 1;

  await isar.writeTxn(() async {
    await isar.gameSaves.put(save!);
  });
}
