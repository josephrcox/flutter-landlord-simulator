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
  bool resetting = false;

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
    resetting = false;
    return _save;
  }

  void resetGame() async {
    resetting = true;
    final newSave = GameSave();
    await isar.writeTxn(() async {
      await isar.gameSaves.put(newSave);
    });
    _save = await isar.gameSaves.where().findFirst();
    resetting = false;

    notifyListeners();
  }

  void triggerLoop() async {
    final firstSave = await isar.gameSaves.where().findFirst();
    if (firstSave == null) {
      getFirstSave();
      return;
    }
    loop(isar, _save!, resetting);
    notifyListeners();
  }

  void actionSetRent(int rent, int index) async {
    if (rent < 0) {
      return;
    }
    final percentageRentIncrease = rent / _save!.plotList!.plots![index].rent;

    await isar.writeTxn(() async {
      final newPlots = _save?.plotList?.plots?.toList();
      newPlots?[index].rent = rent;
      print(percentageRentIncrease.toInt());

      if (percentageRentIncrease > 1) {
        newPlots?[index].happiness -=
            percentageRentIncrease.toInt() * newPlots[index].residents;
      }

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
    if (_save!.money < _save!.rulesNewPropCost) {
      return;
    }
    _save!.money -= _save!.rulesNewPropCost;
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

void loop(Isar isar, save, resetting) async {
  if (save == null || resetting) {
    return;
  }
  save?.info_day += 1;

  int profit = 0;

  profit = calculateRent(profit, save?.plotList?.plots);
  profit -= (profit * save?.rulesTaxRate).floor();

  if (save?.plotList?.plots != null) {
    save?.plotList.plots = calculateResidentsLeaving(save?.plotList?.plots);
  }

  save?.plotList.plots = calculateHappiness(save?.plotList?.plots);

  save?.money += profit;
  final firstSave = await isar.gameSaves.where().findFirst();
  if (firstSave == null) {
    return;
  }
  await isar.writeTxn(() async {
    await isar.gameSaves.put(save!);
  });
}

int calculateRent(int money, List<Plot>? plots) {
  if (plots == null) {
    return money;
  }
  plots.forEach((plot) {
    money += ((plot.rent * plot.residents) / 30).floor();
  });

  return money;
}

List<Plot> calculateResidentsLeaving(List<Plot> plots) {
  // iterate over plots
  for (var i = 0; i < plots.length; i++) {
    final plot = plots[i];
    // if happiness is 0, remove all residents
    if (plot.happiness <= 0) {
      plot.residents = 0;
      return plots;
    }
    final random = Random();
    final roll = random.nextInt((plot.happiness / 1.5).floor() + 1);
    print(
        'Roll was $roll, number to match is ${(plot.happiness / 1.5).floor()}');
    // roll based on happiness, if the roll matches happiness then remove a resident
    if (roll == (plot.happiness / 1.5).floor() && plot.residents > 0) {
      plot.residents -= 1;
      continue;
    }
  }

  return plots;
}

List<Plot> calculateHappiness(List<Plot> plots) {
  final random = Random();

  for (var i = 0; i < plots.length; i++) {
    final roll = random.nextInt(100);
    final plot = plots[i];
    if (roll < plot.happiness && roll.isEven) {
      plot.happiness += 1;
      continue;
    } else if (roll < plot.happiness && roll.isOdd) {
      plot.happiness -= 1;
      continue;
    } else {
      continue;
    }
  }

  return plots;
}
