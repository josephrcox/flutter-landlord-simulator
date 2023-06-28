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

  Map<String, dynamic>? activeSituation;

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
      _save!.plotList!.resPlots = [];
      _save!.plotList!.busPlots = [];
      await isar.writeTxn(() async {
        await isar.gameSaves.put(save!);
      });
    }

    if (_save!.plotList!.resPlots != null) {
      for (var i = 0; i < _save!.plotList!.resPlots!.length; i++) {
        final plot = _save!.plotList!.resPlots![i];
        if (plot.amenities == null) {
          plot.amenities = Upgrades();
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

  void resSetRent(int id, int change) async {
    pauseLoop = true;
    final random = Random();
    final plot = _save!.plotList!.resPlots!
        .firstWhere((element) => element.id == id, orElse: () => ResPlot());
    plot.rent += change;
    int happinessMultiplierBasedOnEconomicHealth =
        (_save!.economyHealth / 100).ceil();
    print((9 / happinessMultiplierBasedOnEconomicHealth).ceil());
    if (change > 0) {
      plot.happiness -= random.nextInt((9 / happinessMultiplierBasedOnEconomicHealth).ceil());
    } else {
      plot.happiness += random.nextInt((9 / happinessMultiplierBasedOnEconomicHealth).ceil());
    }
    await isar.writeTxn(() async {
      final oldPlots = _save!.plotList!.resPlots!.toList();
      oldPlots.removeWhere((element) => element.id == id);
      oldPlots.add(plot);
      await isar.gameSaves.put(_save!);
    });

    pauseLoop = false;
    notifyListeners();
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

    if (staffName == "leasingAgent" && toggleTo == false) {
      newStaff?.residentVacanciesFilledByLeasingAgent = 0;
    } else if (staffName == "propertyManager" && toggleTo == true) {
      for (var i = 0; i < _save!.plotList!.resPlots!.length; i++) {
        _save!.plotList!.resPlots![i].happiness +=
            gameSettings['propertyManagerHappinessImpact'] as int;
      }
    } else if (staffName == 'taxExpert' && toggleTo == false) {
      // loopTaxRateChanges(_save!, _save!.rulesTaxRate, _save!.money, true);
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

  FutureOr<String?> purchaseProperty(String id) async {
    pauseLoop = true;
    final random = Random();
    for (var category in propertyTypes) {
      for (var type in category) {
        if (type['id'] == id) {
          if (type['cost_upfront'] as int > _save!.money) {
            pauseLoop = false;
            return 'Not enough funds';
          }
          if (type['type'] == 'residential') {
            final newPlot = ResPlot();
            newPlot.id = random.nextInt(1000000000);
            newPlot.propertyValue = type['cost_upfront'] as int;
            newPlot.amenities = Upgrades();
            newPlot.purchaseDate = _save!.infoDay;
            newPlot.maxResidents = type['maxResidents'] as int;
            await isar.writeTxn(() async {
              _save!.money -= type['cost_upfront'] as int;
              final newPlotList = _save!.plotList!.resPlots!.toList();
              newPlotList.add(newPlot);
              _save!.plotList!.resPlots = newPlotList;
              await isar.gameSaves.put(_save!);
            });
            pauseLoop = false;
            return 'Success';
          } else {
            final newPlot = BusPlot();
            newPlot.id = random.nextInt(1000000000);
            newPlot.propertyValue = type['cost_upfront'] as int;
            await isar.writeTxn(() async {
              _save!.money -= type['cost_upfront'] as int;
              _save!.plotList!.busPlots!.toList().add(newPlot);
              await isar.gameSaves.put(_save!);
            });
            pauseLoop = false;
            return 'Success';
          }
        }
      }
    }
    notifyListeners();
  }

  void resSearchForResidents(int id) async {
    pauseLoop = true;
    final plot = _save!.plotList!.resPlots!
        .firstWhere((element) => element.id == id, orElse: () => ResPlot());
    if (plot.residents < plot.maxResidents) {
      plot.residents += 1;
    }

    await isar.writeTxn(() async {
      final oldPlots = _save!.plotList!.resPlots!.toList();
      oldPlots.removeWhere((element) => element.id == id);
      oldPlots.add(plot);
      _save!.plotList!.resPlots = oldPlots;
      await isar.gameSaves.put(_save!);
    });
    pauseLoop = false;
    notifyListeners();
  }

  // int? checkForSituation() {
  //   final chance = gameSettings['situationChance'] as int;
  //   final random = Random();
  //   final roll = random.nextInt(chance);

  //   if (roll == 0 && gameSettings['situationMinimumDays'] <= _save!.infoDay) {
  //     int situationIndex = -1;
  //     var tries = 0;
  //     while (situationIndex == -1 && tries < 3) {
  //       situationIndex = random.nextInt(situationsList.length);
  //       if (_save!.plotList!.resPlots!.length <
  //           (situationsList[situationIndex]['req_propertyCount'] as int)) {
  //         situationIndex = -1;
  //       }
  //       tries += 1;
  //     }

  //     return situationIndex;
  //   } else {
  //     return null;
  //   }
  // }

  void actionDealWithSituationRepercussions(int index) async {
    pauseLoop = true;
    final situation = situationsList[index];
    final random = Random();
    var newSave = _save;

    if (situation['specialCase'] != null) {
      // TO DO
    }
    if (situation['impactOnGlobalHappiness'] != null) {
      for (var i = 0; i < newSave!.plotList!.resPlots!.length; i++) {
        newSave.plotList?.resPlots?[i].happiness +=
            situation['impactOnGlobalHappiness'] as int;
      }
    }
    if (situation['impactOnMoney'] != null) {
      newSave!.money += situation['impactOnMoney'] as int;
    }
    if (situation['impactOnEconomy'] != null) {
      newSave!.economyHealth += situation['impactOnEconomy'] as int;
    }
    if (situation['impactOnPlotCount'] != null) {
      if (situation['impactOnPlotCount'] as int < 0) {
        final randomIndex = random.nextInt(_save!.plotList!.resPlots!.length);
        final list = _save!.plotList!.resPlots!.toList();
        list.removeAt(randomIndex);
        newSave!.plotList!.resPlots = list;
      } else {
        // TO DO
      }
    }

    await isar.writeTxn(() async {
      _save = newSave;
      await isar.gameSaves.put(_save!);
    });
    pauseLoop = false;
  }
}

final saveProvider = ChangeNotifierProvider((ref) => SaveProvider());

void loop(Isar isar, save, resetting) async {
  if (save == null || resetting || save?.plotList == null) {
    return;
  }

  int profit = 0;

  profit += loopResRent(save?.plotList?.resPlots);
  profit += loopAmenitiesProfits(save?.plotList?.resPlots);
  profit += loopStaffCosts(save.staff, save?.plotList?.resPlots.length);
  profit += loopPropertyTaxes(save?.plotList?.resPlots);

  save?.rulesTaxRate =
      loopTaxRateChanges(save, save?.rulesTaxRate, save?.money, false);
  save = loopResLeaving(save);
  save?.plotList?.resPlots = loopResHappiness(save?.plotList?.resPlots, save);
  save?.economyHealth = loopEconomyHealth(save);

  save?.gameOver = checkIfGameOver(save);

  save?.profitHistory ??= List<int>;

  var profitHistory = save?.profitHistory.toList();
  profitHistory.add(profit);
  if (profitHistory?.length > 7) {
    profitHistory?.removeRange(0, profitHistory?.length - 7);
  }
  save?.profitHistory = profitHistory;

  await isar.writeTxn(() async {
    save?.infoDay += 1;
    save?.money += profit;

    await isar.gameSaves.put(save!);
  });
}

int loopResRent(List<ResPlot>? plots) {
  if (plots == null) {
    return 0;
  }
  var profit = 0;
  for (var plot in plots) {
    profit += ((plot.rent * plot.residents) / 30).floor();
  }

  return profit;
}

GameSave loopResLeaving(GameSave save) {
  var plots = save.plotList!.resPlots;

  for (var i = 0; i < plots!.length; i++) {
    final plot = plots[i];
    if (plot.happiness <= 0) {
      plot.residents <= 0;
      plot.happiness = 50;
      save.plotList!.resPlots = plots;
      return save;
    }
    final random = Random();
    final target =
        (plot.happiness / 3).floor() * ((save.economyHealth * 1) / 100).floor();
    final roll = random.nextInt(target + 1);

    if ((roll == target || save.economyHealth < 25) && plot.residents > 0 ||
        (save.infoDay % 30 == 0 && plot.happiness < 50)) {
      final index = save.staff?.staffOptions.indexOf("leasingAgent") ?? -1;
      if (index == -1 || save.staff?.staffValues[index] == false) {
        final random = Random();
        save.economyHealth -= random.nextDouble() * 1.0;
        plot.residents -= 1;
        final index = plot.amenities?.amenOptions.indexOf("easyTurnover") ?? -1;
        if (index == -1 || plot.amenities?.amenValues[index] == false) {
          save.money -= (plot.rent / 3).floor();
        }
      } else {
        save.money -= (plot.rent).floor();
        save.staff?.residentVacanciesFilledByLeasingAgent += 1;
      }

      continue;
    }
  }

  return save;
}

List<ResPlot> loopResHappiness(List<ResPlot> plots, GameSave save) {
  for (var i = 0; i < plots.length; i++) {
    final plot = plots[i];
    if (plot.residents == 0) {
      continue;
    }

    final random = Random();

    if (save.infoDay % 15 == 0) {
      int happinessChange = 0;

      // Change based on economy health. The higher the health, the more likely happiness will go up.
      if (random.nextInt(300) < save.economyHealth) {
        happinessChange += random.nextInt(3);
      } else {
        happinessChange -= random.nextInt(3);
      }

      // Change based on rent. The higher the rent, the more likely happiness will go down.
      final acceptableRentBasedOnEconomicHealth =
          (1 * 900 * (save.economyHealth / 150)).clamp(600, 10000);

      if (plot.rent > acceptableRentBasedOnEconomicHealth) {
        happinessChange -= random.nextInt(4) + 2;
      }

      plot.happiness += happinessChange;

      if (plot.happiness > 300) {
        plot.happiness = 300;
      } else if (plot.happiness < 1) {
        plot.happiness = 0;
      }
    }
  }

  return plots;
}

int loopAmenitiesProfits(List<ResPlot>? plots) {
  if (plots == null) {
    return 0;
  }
  var profit = 0;
  for (var plot in plots) {
    if (plot.amenities == null) {
      continue;
    }

    for (var i = 0; i < plot.amenities!.amenValues.length; i++) {
      if (plot.amenities!.amenValues[i] == true) {
        final upgradeName = plot.amenities!.amenOptions[i];
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

double loopTaxRateChanges(
    GameSave save, double taxRate, int money, bool override) {
  if (save.infoDay % 30 != 0 && !override) {
    return taxRate;
  }
  final hasTaxExpert = save.staff
          ?.staffValues[save.staff?.staffOptions.indexOf("taxExpert") ?? -1] ??
      false;

  if (money < gameSettings['taxRateBreakpoints'][0]) {
    taxRate = gameSettings['taxRates'][0];
  } else if (money < gameSettings['taxRateBreakpoints'][1]) {
    taxRate = gameSettings['taxRates'][1];
  } else if (money < gameSettings['taxRateBreakpoints'][2]) {
    taxRate = gameSettings['taxRates'][2];
  } else if (money < gameSettings['taxRateBreakpoints'][3]) {
    taxRate = gameSettings['taxRates'][3];
  } else {
    taxRate = gameSettings['taxRates'][4];
  }

  if (hasTaxExpert) {
    final random = Random();
    // between 0.3 and 0.7
    final randomModifier = random.nextDouble() * 0.4 + 0.3;
    // round to 2 decimal places
    taxRate = (taxRate * randomModifier * 100).round() / 100;
  }

  return taxRate;
}

int loopStaffCosts(Staff staff, int propertyCount) {
  if (staff == null) {
    return 0;
  }
  var profit = 0;
  for (var i = 0; i < staff.staffValues.length; i++) {
    if (staff.staffValues[i] == true) {
      final staffName = staff.staffOptions[i];
      final staffConfig = staffInfo[staffName];
      profit -= (staffConfig?['baseMonthlyCost'] as num).toInt() ~/ 30;
      profit -= ((staffConfig?['monthlyCostPerProperty'] as num).toInt() *
              propertyCount) ~/
          30;
      if (staffConfig?['percentageOfAllProfit'] != null) {
        profit -=
            (profit * (staffConfig?['percentageOfAllProfit'] as num)).toInt();
      }
    }
  }

  return profit;
}

int loopPropertyTaxes(List<ResPlot>? plots) {
  if (plots == null) {
    return 0;
  }
  var profit = 0;
  for (var plot in plots) {
    // TO DO: THIS SHOULD BE IN THE CONFIG
    profit -= (plot.propertyValue / 50 / 30).floor();
  }

  return profit;
}

bool tooHigh = false;

double loopEconomyHealth(GameSave save) {
  var economyTrends = save.economyTrends.toList();
  var economyTrendIndex = save.economyTrendIndex;

  final random = Random();
  if (economyTrends.isEmpty) {
    bool isPositive = true;
    int positives = 0;
    int negatives = 0;

    int remaining = 10000;
    while (remaining > 0) {
      int sprintLength = min(remaining, random.nextInt(120) + 60);
      remaining -= sprintLength;

      // generate a sprint
      for (int i = 0; i < sprintLength; i++) {
        double change = (random.nextDouble() - (random.nextDouble() * 1)) *
            (isPositive ? 1 : -1);
        economyTrends.add(change);
      }

      isPositive = random.nextBool();
      if (isPositive) {
        positives++;
      } else {
        negatives++;
      }
    }
  }
  // developer.log(economyTrends.toString());

  double healthModifier = 0;
  var avgRent = 0;
  var avgHappiness = 0;
  var numPlots = 0;
  var plots = save.plotList?.resPlots;
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
  if (money > 500000) {
    healthModifier -= ((money - 500000) / 500000).clamp(-5, 5);
  }

  //// The happier the avg happiness, the happier the economy
  healthModifier += (avgHappiness / 100.0);
  if (avgHappiness < 40) {
    healthModifier -= (40 - avgHappiness) / 50.0;
  }

  //// The more plots the player has, the happier the economy
  if (numPlots > random.nextInt(10)) {
    healthModifier += (numPlots - 10) / 750.0;
  }

  if (economyTrendIndex == economyTrends.length - 1) {
    economyTrendIndex = 0;
  }

  healthModifier /= 5;
  healthModifier += economyTrends[economyTrendIndex] * (daysIntoGame / 1000);

  if (healthModifier > 5) {
    print('🚨 health modifier is greater than 5, $healthModifier');
    healthModifier = 5;
  } else if (healthModifier < -5) {
    print('🚨 health modifier is less than -5, $healthModifier');
    healthModifier = -5;
  } else {
    //print('👍 health modifier is $healthModifier');
  }

  var newHealth =
      (save.economyHealth + (healthModifier * 2)).clamp(0, 300.0).toDouble();

  // bring newHealth 25% closer to 150 if it is above 150
  if (newHealth > 250) {
    tooHigh = true;
    newHealth = newHealth - 150 * 0.05;
  } else {
    tooHigh = false;
  }

  // print(
  //     'economy health: $newHealth, modifier: $healthModifier, trend number: ${economyTrends[economyTrendIndex]}');
  return newHealth;
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
