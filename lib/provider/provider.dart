import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real/models/gameSave.dart';

import 'dart:async';

import '../configSettings.dart';

Timer? timer;

final saveProviderNotifier =
    AutoDisposeChangeNotifierProvider<SaveProvider>((ref) => SaveProvider());

class SaveProvider with ChangeNotifier {
  GameSave? _save;
  late Isar isar;
  Timer? _timer;
  bool initialized = false;
  bool resetting = false;
  bool pauseLoop = false;
  int lastProfit = 0;

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
    print(await isar.gameSaves);
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

    for (var i = 0; i < _save!.plotList!.plots!.length; i++) {
      final plot = _save!.plotList!.plots![i];
      if (plot.plotUpgrades == null) {
        plot.plotUpgrades = Upgrades();
        await isar.writeTxn(() async {
          await isar.gameSaves.put(save!);
        });
      }
    }

    _loading = false;
    notifyListeners();
    resetting = false;
    return _save;
  }

  void resetGame() async {
    pauseLoop = true;
    final id = _save!.id;
    await isar.writeTxn(() async {
      await isar.gameSaves.deleteAll([id]);
    });
    _save = GameSave();
    pauseLoop = false;

    notifyListeners();
  }

  void pauseGame() {
    pauseLoop = !pauseLoop;
    notifyListeners();
  }

  void triggerLoop() async {
    final firstSave = await isar.gameSaves.where().findFirst();
    if (firstSave == null) {
      getFirstSave();
      return;
    }
    if (pauseLoop == false) {
      loop(isar, _save!, resetting);
    }

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

      if (percentageRentIncrease > 1) {
        final decrease =
            percentageRentIncrease.toInt() * newPlots![index].residents;
        newPlots[index].happiness -= decrease;
      } else if (percentageRentIncrease < 1) {
        final increase =
            (percentageRentIncrease.round() * newPlots![index].residents)
                .round();
        newPlots[index].happiness += increase;
      }

      _save?.plotList?.plots = newPlots;

      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
  }

  Future<bool> actionToggleUpgrade(
      {required propertyIndex,
      required upgradeIndex,
      required upgradeName,
      required toggleTo}) async {
    pauseLoop = true;
    var newPlots = _save?.plotList!.plots!.toList();
    final upgradeConfig = configUpgrades[upgradeName];

    if (toggleTo == true &&
            _save!.money < (configUpgrades[upgradeName]!['cost'] as num) ||
        upgradeConfig == null ||
        newPlots?[propertyIndex].plotUpgrades == null) {
      return false;
    }

    // update the upgradeValue based on the upgradeIndex
    newPlots?[propertyIndex].plotUpgrades!.upgradeValues[upgradeIndex] =
        toggleTo;

    if (toggleTo == true) {
      _save?.money -= (upgradeConfig['cost'] as num).toInt();
      newPlots?[propertyIndex].happiness +=
          (upgradeConfig['instantHappiness'] as num).toInt();
    } else {
      newPlots?[propertyIndex].happiness -=
          (upgradeConfig['instantHappiness'] as num).toInt();
    }
    await isar.writeTxn(() async {
      _save?.plotList?.plots = newPlots;
      await isar.gameSaves.put(_save!);
      return true;
    });
    pauseLoop = false;
    return true;
  }

  Future<int> actionSearchForResidents(int index) async {
    int increase = 0;

    await isar.writeTxn(() async {
      final newPlots = _save?.plotList?.plots?.toList();
      final plot = newPlots?[index];
      if (plot!.residents >= plot.maxResidents) {
        return;
      }
      if ((plot.rent / 10) > _save!.money) {
        return;
      }
      _save!.money -= (plot.rent / 10).floor();
      final random = Random();
      final happiness = plot.happiness;
      final chance = happiness / 2;
      final multiplierBasedOnRentCost = plot.rent / 1000;
      final roll = random.nextInt(100) * multiplierBasedOnRentCost;

      if ((roll) < chance || plot.happiness > 99) {
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
      final plot = newPlots?.last;
      newPlots?.last.plotUpgrades = Upgrades();
      _save?.plotList?.plots = newPlots;
      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
  }
}

final saveProvider = ChangeNotifierProvider((ref) => SaveProvider());

void loop(Isar isar, save, resetting) async {
  if (save == null || resetting || save?.plotList == null) {
    return;
  }

  save?.infoDay += 1;

  int profit = 0;
  //////////////////////////
  /////////////////
  // Calculations
  /////////////////
  //////////////////////////

  //// Calculate rent
  profit = calculateRent(profit, save?.plotList?.plots);

  //// Calculate residents leaving
  if (save?.plotList?.plots != null) {
    save = calculateResidentsLeaving(save);
  }

  //// Calculate happiness (random changes based on things)
  save?.plotList.plots = calculateHappiness(save?.plotList?.plots);

  //// Calculate profits and losses from upgrades
  profit = calculateUpgradesProfitAndLoss(profit, save?.plotList?.plots);

  save?.lastProfit = profit - (profit * save?.rulesTaxRate).floor();
  // Add profit to money
  save?.money += save?.lastProfit;

  save?.rulesTaxRate = calculateTaxRateChanges(save?.rulesTaxRate, save?.money);

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
  for (var plot in plots) {
    money += ((plot.rent * plot.residents) / 30).floor();
  }

  return money;
}

GameSave calculateResidentsLeaving(GameSave save) {
  var plots = save.plotList!.plots;

  for (var i = 0; i < plots!.length; i++) {
    final plot = plots[i];
    // if happiness is 0, remove all residents
    if (plot.happiness <= 0) {
      plot.residents = 0;
      save.plotList!.plots = plots;
      return save;
    }
    final random = Random();
    final roll = random.nextInt((plot.happiness / 1.5).floor() + 1);
    // roll based on happiness, if the roll matches happiness then remove a resident
    if (roll == (plot.happiness / 1.5).floor() && plot.residents > 0) {
      plot.residents -= 1;
      save.money -= (plot.rent / 10).floor();
      continue;
    }
  }

  return save;
}

List<Plot> calculateHappiness(List<Plot> plots) {
  for (var i = 0; i < plots.length; i++) {
    final plot = plots[i];

    if (plot.happiness > 300) {
      plot.happiness = 300;
    } else if (plot.happiness < 1) {
      plot.happiness = 1;
    }
  }

  return plots;
}

int calculateUpgradesProfitAndLoss(int profit, List<Plot>? plots) {
  if (plots == null) {
    return profit;
  }
  for (var plot in plots) {
    if (plot.plotUpgrades == null) {
      continue;
    }
    for (var i = 0; i < plot.plotUpgrades!.upgradeValues.length; i++) {
      if (plot.plotUpgrades!.upgradeValues[i] == true) {
        final upgradeName = plot.plotUpgrades!.upgradeOptions[i];
        final upgradeConfig = configUpgrades[upgradeName];
        profit -= ((upgradeConfig?['monthlyCostPerResident'] as num).toInt() *
                plot.residents) ~/
            30;
        profit += ((upgradeConfig?['monthlyProfitPerResident'] as num).toInt() *
                plot.residents) ~/
            30;
      }
    }
  }

  return profit;
}

double calculateTaxRateChanges(double taxRate, int money) {
  if (money < 100000) {
    taxRate = 0.1;
  } else if (money < 250000) {
    taxRate = 0.15;
  } else if (money < 1000000) {
    taxRate = 0.25;
  } else if (money < 2500000) {
    taxRate = 0.40;
  } else {
    taxRate = 0.5;
  }

  return taxRate;
}
