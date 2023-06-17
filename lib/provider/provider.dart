import 'dart:math';
import 'dart:developer' as developer;

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
  bool pauseLoop = true;

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

    _save ??= GameSave();

    if (save!.staff == null) {
      save!.staff = Staff();
      await isar.writeTxn(() async {
        await isar.gameSaves.put(save!);
      });
    }

    if (_save!.plotList == null) {
      _save!.plotList = PlotList();
      _save!.plotList!.plots = [];
      await isar.writeTxn(() async {
        await isar.gameSaves.put(save!);
      });
    }

    if (_save!.plotList!.plots != null) {
      for (var i = 0; i < _save!.plotList!.plots!.length; i++) {
        final plot = _save!.plotList!.plots![i];
        if (plot.plotUpgrades == null) {
          plot.plotUpgrades = Upgrades();
          await isar.writeTxn(() async {
            await isar.gameSaves.put(save!);
          });
        }
      }
    }

    _loading = false;

    notifyListeners();
    resetting = false;
    pauseLoop = false;
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
        newPlots?[index].happiness -= 5;
      } else if (percentageRentIncrease < 1) {
        newPlots?[index].happiness += 5;
      }

      _save?.plotList?.plots = newPlots;

      await isar.gameSaves.put(_save!);
    });

    notifyListeners();
  }

  Future<bool> actionToggleAmen(
      {required propertyIndex,
      required upgradeIndex,
      required upgradeName,
      required toggleTo}) async {
    pauseLoop = true;
    var newPlots = _save?.plotList!.plots!.toList();
    final upgradeConfig = upgradeInfo[upgradeName];

    if (toggleTo == true &&
            _save!.money < (upgradeInfo[upgradeName]!['cost'] as num) ||
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

  Future<bool> actionUpgradePlotLevel({
    required propertyIndex,
  }) async {
    pauseLoop = true;

    final newPlots = _save?.plotList!.plots!.toList();
    final currentLevel = newPlots?[propertyIndex].level;
    final costToUpgrade = gameSettings['level${currentLevel! + 1}cost'] as num;
    if (_save!.money < costToUpgrade) {
      return false;
    }
    _save!.money -= costToUpgrade.toInt();
    newPlots?[propertyIndex].level += 1;
    newPlots?[propertyIndex].happiness += 20;
    _save?.plotList?.plots = newPlots;

    await isar.writeTxn(() async {
      _save?.plotList?.plots = newPlots;
      await isar.gameSaves.put(_save!);
      pauseLoop = false;
      return true;
    });
    pauseLoop = false;
    return false;
  }

  Future<bool> actionToggleStaff(
      {required staffName, required staffIndex, required toggleTo}) async {
    pauseLoop = true;
    final newStaff = _save?.staff;
    final staffConfig = staffInfo[staffName];

    if (toggleTo == true &&
            _save!.money < (staffInfo[staffName]!['cost'] as num) ||
        staffConfig == null) {
      return false;
    }

    newStaff?.staffValues[staffIndex] = toggleTo;

    if (staffName == "manager" && toggleTo == false) {
      newStaff?.residentVacanciesFilledByPropertyManager = 0;
    }

    if (toggleTo == true) {
      _save?.money -= (staffConfig['cost'] as num).toInt();
    }

    await isar.writeTxn(() async {
      _save?.staff = newStaff;
      await isar.gameSaves.put(_save!);
      return true;
    });
    pauseLoop = false;
    return true;
  }

  FutureOr<dynamic> actionSearchForResidents(int index) async {
    int increase = 0;

    return await isar.writeTxn(() async {
      final newPlots = _save?.plotList?.plots?.toList();
      final plot = newPlots?[index];
      final hasManager = _save?.staff?.staffValues[0] ?? false;
      final hasManagerDivider = hasManager ? 2 : 1;

      final costToSearch =
          ((gameSettings['baseSearchForResidentCost'] / hasManagerDivider) *
                  plot!.rent)
              .floor();

      if (plot.residents >= plot.maxResidents) {
        return 0;
      }

      if (_save!.money < costToSearch) {
        return -1 * costToSearch;
      }

      _save!.money -= costToSearch as int;

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
      return increase;
    });
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

  void actionSellProperty(index) async {
    await isar.writeTxn(() async {
      pauseLoop = true;
      if (_save!.plotList!.plots!.isEmpty) {
        return;
      }
      final value = _save!.plotList!.plots![index].propertyValue;
      _save!.money += value;
      final list = _save!.plotList!.plots!.toList();
      list.removeAt(index);
      _save!.plotList!.plots = list;
      notifyListeners();
      pauseLoop = false;
      await isar.gameSaves.put(_save!);
    });
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
    int moneyBefore = save?.money ?? 0;
    save = calculateResidentsLeaving(save);
    int moneyAfter = save?.money ?? 0;
    // check if money has changed, and add the change to profit
    if (moneyBefore != moneyAfter) {
      print('change from residents leaving: ${moneyAfter - moneyBefore}');
      profit += moneyAfter - moneyBefore;
    }
  }

  //// Calculate happiness (random changes based on things)
  if (save?.plotList?.plots != null) {
    save?.plotList.plots = calculateHappiness(save?.plotList?.plots);
    //// Calculate profits and losses from upgrades
    profit = calculateUpgradesProfitAndLoss(profit, save?.plotList?.plots);

    //// Calculate costs of staff and takes it from profit
    profit =
        calculateStaffCosts(profit, save?.staff, save?.plotList?.plots.length);

    //// Calculate losses from property taxes
    profit = calculatePropertyTaxes(profit, save?.plotList?.plots);
  }

  //// Calculate economy helath
  save?.economyHealth = calculateEconomyHealth(save);
  save.economyTrendIndex++;

  save?.profitHistory ??= List<int>;

  var profitHistory = save?.profitHistory.toList();
  //// Set last profit
  profitHistory.add(profit);
  if (profitHistory?.length > 7) {
    // remove oldest entries until length is 7
    profitHistory?.removeRange(0, profitHistory?.length - 7);
  }
  save?.profitHistory = profitHistory;

  // Add profit to money
  save?.money += profit;

  //// Adjust tax rate based on money in bank
  save?.rulesTaxRate = calculateTaxRateChanges(save?.rulesTaxRate, save?.money);

  //// Check if game over
  save.gameOver = checkIfGameOver(save);

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
    if (plot.happiness <= 0) {
      plot.residents = 0;
      plot.happiness = 50;
      save.plotList!.plots = plots;
      return save;
    }
    final random = Random();
    final target =
        (plot.happiness / 2).floor() * ((save.economyHealth * 3) / 100).floor();
    final roll = random.nextInt(target + 1);

    if ((roll == target || save.economyHealth < 25) && plot.residents > 0) {
      // check if the user has a property manager hired
      final index = save.staff?.staffOptions.indexOf("manager") ?? -1;
      if (index == -1 || save.staff?.staffValues[index] == false) {
        final random = Random();
        save.economyHealth -= random.nextDouble() * 1.0;
        plot.residents -= 1;
        final index =
            plot.plotUpgrades?.upgradeOptions.indexOf("easyTurnover") ?? -1;
        if (index == -1 || plot.plotUpgrades?.upgradeValues[index] == false) {
          save.money -= (plot.rent / 3).floor();
        }
      } else {
        save.money -= (plot.rent).floor();
        save.staff?.residentVacanciesFilledByPropertyManager += 1;
      }

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

    final random = Random();

    if (random.nextInt(30) > 25) {
      if (plot.rent > 1500) {
        // lower happiness by random 1-3
        plot.happiness -= random.nextInt(3) + 1;
      } else if (plot.rent < 800) {
        // raise happiness by random 1-3
        plot.happiness += random.nextInt(3) + 1;
      }
      // rand change between -3 and 3
      var randChange = random.nextInt(7) - 3;
      plot.happiness += randChange;
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
        final upgradeConfig = upgradeInfo[upgradeName];
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
    taxRate = 0.185;
  } else if (money < 250000) {
    taxRate = 0.25;
  } else if (money < 1000000) {
    taxRate = 0.325;
  } else if (money < 2500000) {
    taxRate = 0.40;
  } else {
    taxRate = 0.5;
  }

  return taxRate;
}

int calculateStaffCosts(int profit, Staff? staff, int propertyCount) {
  if (staff == null) {
    return profit;
  }
  for (var i = 0; i < staff.staffValues.length; i++) {
    if (staff.staffValues[i] == true) {
      final staffName = staff.staffOptions[i];
      final staffConfig = staffInfo[staffName];
      profit -= (staffConfig?['baseMonthlyCost'] as num).toInt() ~/ 30;
      profit -= ((staffConfig?['monthlyCostPerProperty'] as num).toInt() *
              propertyCount) ~/
          30;
    }
  }

  return profit;
}

double calculateEconomyHealth(GameSave save) {
  var economyTrends = save.economyTrends;
  var economyTrendIndex = save.economyTrendIndex;

  final random = Random();
  if (economyTrends.isEmpty) {
    bool isPositive = true;

    int remaining = 10000;
    while (remaining > 0) {
      int sprintLength = min(remaining, random.nextInt(300) + 60);
      remaining -= sprintLength;

      // generate a sprint
      for (int i = 0; i < sprintLength; i++) {
        // note that 1.0 means no change, so the range of change is (-0.5, 0.5)
        double change = (random.nextDouble() - (random.nextDouble() * 0.55)) *
            (isPositive ? 1 : -1);
        economyTrends.add(change);
      }

      // flip the sign for the next sprint
      isPositive = !isPositive;
    }
  }
  // developer.log(economyTrends.toString());

  double healthModifier = 0;
  var avgRent = 0;
  var avgHappiness = 0;
  var numPlots = 0;
  var plots = save.plotList?.plots;
  var daysIntoGame = save.infoDay;
  var money = save.money;

  if (plots != null && plots.isNotEmpty) {
    numPlots = plots.length;
    for (var plot in plots) {
      avgRent += plot.rent;
      avgHappiness += plot.happiness;
    }
    avgRent = avgRent ~/ numPlots;
    avgHappiness = avgHappiness ~/ numPlots;
  }

  //// Adjust based on rent averages
  if (avgRent < 1000) {
    healthModifier += (1000 - avgRent) / 500;
  } else if (avgRent >= 1800) {
    healthModifier -= (avgRent - 1800) / 500;
  }

  //// The wealthier the player, the less happy the economy is
  if (money > 100000) {
    healthModifier -= log(money) / 2500;
  }

  //// The longer the game goes on, the more the economy will affect health
  double timeFactor = daysIntoGame < 3000
      ? 1 + pow((daysIntoGame / 3000.0), 2).toDouble()
      : 1 + pow((daysIntoGame / 3000.0), 2).toDouble();

  //// The happier the avg happiness, the happier the economy
  healthModifier += (avgHappiness / 100.0);
  if (avgHappiness < 40) {
    healthModifier -= (40 - avgHappiness) / 50.0;
  }

  // Bring healthModifer 50% closer to 1, if it's at 1.5, bring it to 1.25. If it's at -0.5, bring it to -0.25
  // healthModifier = (healthModifier - 1) / 2 + 1;

  //// The more plots the player has, the happier the economy
  if (numPlots > random.nextInt(10)) {
    healthModifier += (numPlots - 10) / 750.0;
  }

  if (economyTrendIndex == economyTrends.length - 1) {
    economyTrendIndex = 0;
  }

  final newHealth =
      (save.economyHealth + healthModifier).clamp(0, 300.0).toDouble();

  return newHealth;
}

int calculatePropertyTaxes(int profit, List<Plot>? plots) {
  if (plots == null) {
    return profit;
  }
  for (var plot in plots) {
    profit -= (2000 / 30).floor();
  }

  return profit;
}

int daysInDebt = 0;

bool checkIfGameOver(GameSave save) {
  if (save.money < 0) {
    if (daysInDebt > 15) {
      return true;
    } else {
      daysInDebt++;
    }
  } else {
    daysInDebt = 0;
  }
  return false;
}
