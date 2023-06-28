// import 'dart:math';
// import 'dart:developer' as developer;

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:real/models/gameSave.dart';

// import 'dart:async';

// import '../configSettings.dart';

// Timer? timer;

// final saveProviderNotifier =
//     AutoDisposeChangeNotifierProvider<SaveProvider>((ref) => SaveProvider());

// class SaveProvider with ChangeNotifier {
//   GameSave? _save;
//   late Isar isar;
//   Timer? _timer;
//   bool initialized = false;
//   bool resetting = false;
//   bool pauseLoop = true;

//   Map<String, dynamic>? activeSituation;

//   GameSave? get save => _save;

//   bool _loading = true;
//   bool get loading => _loading;

//   SaveProvider() {
//     init();
//   }

//   Future<Isar> init() async {
//     final dir = await getApplicationDocumentsDirectory();

//     isar = await Isar.open(
//       [GameSaveSchema],
//       inspector: true,
//       directory: dir.path,
//     );

//     await getFirstSave();

//     _loading = false;
//     notifyListeners();

//     return isar;
//   }

//   Isar getIsar() {
//     return isar;
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   Future<GameSave?> getFirstSave() async {
//     _save = await isar.gameSaves.where().findFirst();

//     _save ??= GameSave();

//     if (save!.staff == null) {
//       save!.staff = Staff();
//       await isar.writeTxn(() async {
//         await isar.gameSaves.put(save!);
//       });
//     }

//     if (_save!.plotList == null) {
//       _save!.plotList = PlotList();
//       _save!.plotList!.resPlots = [];
//       await isar.writeTxn(() async {
//         await isar.gameSaves.put(save!);
//       });
//     }

//     if (_save!.plotList!.resPlots != null) {
//       for (var i = 0; i < _save!.plotList!.resPlots!.length; i++) {
//         final plot = _save!.plotList!.resPlots![i];
//         if (plot.plotUpgrades == null) {
//           plot.plotUpgrades = Upgrades();
//           await isar.writeTxn(() async {
//             await isar.gameSaves.put(save!);
//           });
//         }
//       }
//     }

//     _loading = false;

//     notifyListeners();
//     resetting = false;
//     pauseLoop = false;
//     return _save;
//   }

//   void resetGame() async {
//     pauseLoop = true;
//     final id = _save!.id;
//     await isar.writeTxn(() async {
//       await isar.gameSaves.deleteAll([id]);
//     });
//     _save = GameSave();
//     pauseLoop = false;

//     notifyListeners();
//   }

//   void pauseGame() {
//     pauseLoop = !pauseLoop;
//     notifyListeners();
//   }

//   void triggerLoop() async {
//     final firstSave = await isar.gameSaves.where().findFirst();
//     if (firstSave == null) {
//       getFirstSave();
//       return;
//     }
//     if (pauseLoop == false) {
//       loop(isar, _save!, resetting);
//     }

//     notifyListeners();
//   }

//   void actionSetRent(int rent, int index) async {
//     if (rent < 0) {
//       return;
//     }
//     final percentageRentIncrease = rent / _save!.plotList!.resPlots![index].rent;

//     final random = Random();
//     await isar.writeTxn(() async {
//       final newPlots = _save?.plotList?.resPlots?.toList();
//       newPlots?[index].rent = rent;

//       if (percentageRentIncrease > 1) {
//         // adjust the happiness based on economyHealth. The lower the economyHealth, the larger the decrease in happiness
//         newPlots?[index].happiness -=
//             random.nextInt((0.02 * _save!.economyHealth + 8).floor());
//       } else if (percentageRentIncrease < 1) {
//         newPlots?[index].happiness +=
//             random.nextInt(((0.02 * _save!.economyHealth) + 1).floor());
//       }

//       _save?.plotList?.resPlots = newPlots;

//       await isar.gameSaves.put(_save!);
//     });

//     notifyListeners();
//   }

//   Future<bool> actionToggleAmen(
//       {required propertyIndex,
//       required upgradeIndex,
//       required upgradeName,
//       required toggleTo}) async {
//     pauseLoop = true;
//     var newPlots = _save?.plotList!.resPlots!.toList();
//     final upgradeConfig = upgradeInfo[upgradeName];

//     if (toggleTo == true &&
//             _save!.money < (upgradeInfo[upgradeName]!['cost'] as num) ||
//         upgradeConfig == null ||
//         newPlots?[propertyIndex].plotUpgrades == null) {
//       pauseLoop = false;
//       return false;
//     }

//     // update the upgradeValue based on the upgradeIndex
//     newPlots?[propertyIndex].plotUpgrades!.amenValues[upgradeIndex] = toggleTo;

//     if (toggleTo == true) {
//       _save?.money -= (upgradeConfig['cost'] as num).toInt();
//       newPlots?[propertyIndex].happiness +=
//           (upgradeConfig['instantHappiness'] as num).toInt();
//     } else {
//       newPlots?[propertyIndex].happiness -=
//           (upgradeConfig['instantHappiness'] as num).toInt();
//     }
//     await isar.writeTxn(() async {
//       _save?.plotList?.resPlots = newPlots;
//       await isar.gameSaves.put(_save!);
//       pauseLoop = false;
//       return true;
//     });
//     pauseLoop = false;
//     return true;
//   }

//   int? checkForSituation() {
//     final chance = gameSettings['situationChance'] as int;
//     final random = Random();
//     final roll = random.nextInt(chance);

//     if (roll == 0 && gameSettings['situationMinimumDays'] <= _save!.infoDay) {
//       int situationIndex = -1;
//       var tries = 0;
//       while (situationIndex == -1 && tries < 3) {
//         situationIndex = random.nextInt(situationsList.length);
//         if (_save!.plotList!.resPlots!.length <
//             (situationsList[situationIndex]['req_propertyCount'] as int)) {
//           situationIndex = -1;
//         }
//         tries += 1;
//       }

//       return situationIndex;
//     } else {
//       return null;
//     }
//   }

//   // Future<int> actionUpgradePlotLevel({
//   //   required propertyIndex,
//   // }) async {
//   //   pauseLoop = true;

//   //   final newPlots = _save?.plotList!.resPlots!.toList();
//   //   final currentLevel = newPlots?[propertyIndex].level;
//   //   final costToUpgrade = gameSettings['level${currentLevel! + 1}cost'] as num;
//   //   if (_save!.money < costToUpgrade) {
//   //     pauseLoop = false;
//   //     return costToUpgrade.toInt();
//   //   }
//   //   _save!.money -= costToUpgrade.toInt();
//   //   newPlots?[propertyIndex].propertyValue += costToUpgrade.toInt();
//   //   newPlots?[propertyIndex].level += 1;
//   //   newPlots?[propertyIndex].happiness += 20;
//   //   newPlots?[propertyIndex].maxResidents =
//   //       gameSettings['level${currentLevel + 1}maxResidents'] as int;
//   //   _save?.plotList?.resPlots = newPlots;

//   //   await isar.writeTxn(() async {
//   //     _save?.plotList?.resPlots = newPlots;
//   //     await isar.gameSaves.put(_save!);
//   //     pauseLoop = false;
//   //     return 0;
//   //   });
//   //   return costToUpgrade.toInt();
//   // }

//   Future<bool> actionToggleStaff(
//       {required staffName, required staffIndex, required toggleTo}) async {
//     pauseLoop = true;
//     final newStaff = _save?.staff;
//     final staffConfig = staffInfo[staffName];

//     if (toggleTo == true &&
//             _save!.money < (staffInfo[staffName]!['cost'] as num) ||
//         staffConfig == null) {
//       return false;
//     }

//     newStaff?.staffValues[staffIndex] = toggleTo;

//     if (staffName == "leasingAgent" && toggleTo == false) {
//       newStaff?.residentVacanciesFilledByLeasingAgent = 0;
//     } else if (staffName == "propertyManager" && toggleTo == true) {
//       for (var i = 0; i < _save!.plotList!.resPlots!.length; i++) {
//         _save!.plotList!.resPlots![i].happiness +=
//             gameSettings['propertyManagerHappinessImpact'] as int;
//       }
//     } else if (staffName == 'taxExpert' && toggleTo == false) {
//       calculateTaxRateChanges(_save!, _save!.rulesTaxRate, _save!.money, true);
//     }

//     if (toggleTo == true) {
//       _save?.money -= (staffConfig['cost'] as num).toInt();
//     }

//     await isar.writeTxn(() async {
//       _save?.staff = newStaff;
//       await isar.gameSaves.put(_save!);
//       return true;
//     });
//     pauseLoop = false;
//     return true;
//   }

//   FutureOr<dynamic> actionSearchForResidents(int index) async {
//     int increase = 0;

//     return await isar.writeTxn(() async {
//       final newPlots = _save?.plotList?.resPlots?.toList();
//       final plot = newPlots?[index];
//       final hasLeasingAgent = _save?.staff?.staffValues[0] ?? false;
//       final hasLADivier = hasLeasingAgent ? 2 : 1;

//       final costToSearch =
//           ((gameSettings['baseSearchForResidentCost'] / hasLADivier) *
//                   plot!.rent)
//               .floor();

//       if (plot.residents >= plot.maxResidents) {
//         return 0;
//       }

//       if (_save!.money < costToSearch) {
//         return -1 * costToSearch;
//       }

//       _save!.money -= costToSearch as int;

//       final random = Random();
//       final happiness = plot.happiness;
//       final chance = happiness / 2;
//       final multiplierBasedOnRentCost = plot.rent / 1000;
//       final roll = random.nextInt(100) * multiplierBasedOnRentCost;

//       if ((roll) < chance || plot.happiness > 99) {
//         plot.residents += 1;
//         increase = 1;
//       }

//       _save?.plotList?.resPlots = newPlots;
//       await isar.gameSaves.put(_save!);
//       return increase;
//     });
//   }

//   void actionPurchaseProperty() async {
//     if (_save!.money < _save!.rulesNewPropCost) {
//       return;
//     }
//     _save!.money -= _save!.rulesNewPropCost;
//     await isar.writeTxn(() async {
//       // make sure plotList.resPlots is an empty array
//       if (_save?.plotList == null) {
//         _save?.plotList = PlotList();
//         _save?.plotList?.resPlots = [];
//       }
//       final newPlots = _save?.plotList?.resPlots?.toList();
//       newPlots?.add(Plot());
//       final plot = newPlots?.last;
//       newPlots?.last.plotUpgrades = Upgrades();
//       _save?.plotList?.resPlots = newPlots;
//       await isar.gameSaves.put(_save!);
//     });

//     notifyListeners();
//   }

//   void actionSellProperty(index) async {
//     await isar.writeTxn(() async {
//       pauseLoop = true;
//       if (_save!.plotList!.resPlots!.isEmpty) {
//         return;
//       }
//       final value = _save!.plotList!.resPlots![index].propertyValue;
//       _save!.money += value;
//       final list = _save!.plotList!.resPlots!.toList();
//       list.removeAt(index);
//       _save!.plotList!.resPlots = list;
//       notifyListeners();
//       pauseLoop = false;
//       await isar.gameSaves.put(_save!);
//     });
//   }

//   void actionDealWithSituationRepercussions(int index) async {
//     pauseLoop = true;
//     final situation = situationsList[index];
//     final random = Random();
//     var newSave = _save;

//     if (situation['specialCase'] != null) {
//       // TO DO
//     }
//     if (situation['impactOnGlobalHappiness'] != null) {
//       for (var i = 0; i < newSave!.plotList!.resPlots!.length; i++) {
//         newSave.plotList?.resPlots?[i].happiness +=
//             situation['impactOnGlobalHappiness'] as int;
//       }
//     }
//     if (situation['impactOnMoney'] != null) {
//       newSave!.money += situation['impactOnMoney'] as int;
//     }
//     if (situation['impactOnEconomy'] != null) {
//       newSave!.economyHealth += situation['impactOnEconomy'] as int;
//     }
//     if (situation['impactOnPlotCount'] != null) {
//       if (situation['impactOnPlotCount'] as int < 0) {
//         final randomIndex = random.nextInt(_save!.plotList!.resPlots!.length);
//         final list = _save!.plotList!.resPlots!.toList();
//         list.removeAt(randomIndex);
//         newSave!.plotList!.resPlots = list;
//       } else {
//         // TO DO
//       }
//     }

//     await isar.writeTxn(() async {
//       _save = newSave;
//       await isar.gameSaves.put(_save!);
//     });
//     pauseLoop = false;
//   }
// }

// final saveProvider = ChangeNotifierProvider((ref) => SaveProvider());

// void loop(Isar isar, save, resetting) async {
//   if (save == null || resetting || save?.plotList == null) {
//     return;
//   }

//   save?.infoDay += 1;

//   int profit = 0;

//   //////////////////////////
//   /////////////////
//   // Calculations
//   /////////////////
//   //////////////////////////

//   //// Calculate rent
//   profit = calculateRent(profit, save?.plotList?.resPlots);

//   //// Calculate residents leaving
//   if (save?.plotList?.resPlots != null) {
//     int moneyBefore = save?.money ?? 0;
//     save = calculateResidentsLeaving(save);
//     int moneyAfter = save?.money ?? 0;
//     // check if money has changed, and add the change to profit
//     if (moneyBefore != moneyAfter) {
//       profit += moneyAfter - moneyBefore;
//     }
//   }

//   //// Calculate happiness (random changes based on things)
//   if (save?.plotList?.resPlots != null) {
//     save?.plotList.resPlots = calculateHappiness(save?.plotList?.resPlots, save);
//     //// Calculate profits and losses from upgrades
//     profit = calculateUpgradesProfitAndLoss(profit, save?.plotList?.resPlots);

//     //// Calculate costs of staff and takes it from profit
//     profit =
//         calculateStaffCosts(profit, save?.staff, save?.plotList?.resPlots.length);

//     //// Calculate losses from property taxes
//     profit = calculatePropertyTaxes(profit, save?.plotList?.resPlots);
//   }

//   //// Calculate economy helath
//   save?.economyHealth = calculateEconomyHealth(save);
//   save.economyTrendIndex++;

//   //// Calculate plot values
//   save?.plotList?.resPlots = calculatePlotValues(save);

//   ///////////////////////////////// End of calculations
//   save?.profitHistory ??= List<int>;

//   var profitHistory = save?.profitHistory.toList();
//   //// Set last profit
//   profitHistory.add(profit);
//   if (profitHistory?.length > 7) {
//     // remove oldest entries until length is 7
//     profitHistory?.removeRange(0, profitHistory?.length - 7);
//   }
//   save?.profitHistory = profitHistory;

//   // Add profit to money
//   save?.money += profit;

//   //// Adjust tax rate based on money in bank
//   save?.rulesTaxRate =
//       calculateTaxRateChanges(save, save?.rulesTaxRate, save?.money, false);

//   //// Check if game over
//   save.gameOver = checkIfGameOver(save);

//   final firstSave = await isar.gameSaves.where().findFirst();
//   if (firstSave == null) {
//     return;
//   }
//   await isar.writeTxn(() async {
//     await isar.gameSaves.put(save!);
//   });
// }

// int calculateRent(int money, List<Plot>? plots) {
//   if (plots == null) {
//     return money;
//   }
//   for (var plot in plots) {
//     money += ((plot.rent * plot.residents) / 30).floor();
//   }

//   return money;
// }

// GameSave calculateResidentsLeaving(GameSave save) {
//   var plots = save.plotList!.resPlots;

//   for (var i = 0; i < plots!.length; i++) {
//     final plot = plots[i];
//     if (plot.happiness <= 0) {
//       plot.residents = 0;
//       plot.happiness = 50;
//       save.plotList!.resPlots = plots;
//       return save;
//     }
//     final random = Random();
//     final target =
//         (plot.happiness / 3).floor() * ((save.economyHealth * 1) / 100).floor();
//     final roll = random.nextInt(target + 1);

//     if ((roll == target || save.economyHealth < 25) && plot.residents > 0 || (save.infoDay % 30 == 0 && plot.happiness < 50)) {
//       final index = save.staff?.staffOptions.indexOf("leasingAgent") ?? -1;
//       if (index == -1 || save.staff?.staffValues[index] == false) {
//         final random = Random();
//         save.economyHealth -= random.nextDouble() * 1.0;
//         plot.residents -= 1;
//         final index =
//             plot.plotUpgrades?.amenOptions.indexOf("easyTurnover") ?? -1;
//         if (index == -1 || plot.plotUpgrades?.amenValues[index] == false) {
//           save.money -= (plot.rent / 3).floor();
//         }
//       } else {
//         save.money -= (plot.rent).floor();
//         save.staff?.residentVacanciesFilledByLeasingAgent += 1;
//       }

//       continue;
//     }
//   }

//   return save;
// }

// List<Plot> calculateHappiness(List<Plot> plots, GameSave save) {
//   for (var i = 0; i < plots.length; i++) {
//     final plot = plots[i];
//     if (plot.residents == 0) {
//       continue;
//     }

//     final random = Random();

//     if (save.infoDay % 15 == 0) {
//       int happinessChange = 0;

//       // Change based on economy health. The higher the health, the more likely happiness will go up.
//       if (random.nextInt(300) < save.economyHealth) {
//         happinessChange += random.nextInt(3);
//       } else {
//         happinessChange -= random.nextInt(3);
//       }

//       // Change based on rent. The higher the rent, the more likely happiness will go down.
//       final acceptableRentBasedOnEconomicHealth =
//           (1 * 900 * (save.economyHealth / 150)).clamp(600, 10000);

//       if (plot.rent > acceptableRentBasedOnEconomicHealth) {
//         happinessChange -= random.nextInt(4) + 2;
//       }

//       plot.happiness += happinessChange;

//       if (plot.happiness > 300) {
//         plot.happiness = 300;
//       } else if (plot.happiness < 1) {
//         plot.happiness = 0;
//       }
//     }
//   }

//   return plots;
// }

// int calculateUpgradesProfitAndLoss(int profit, List<Plot>? plots) {
//   if (plots == null) {
//     return profit;
//   }
//   for (var plot in plots) {
//     if (plot.plotUpgrades == null) {
//       continue;
//     }
//     for (var i = 0; i < plot.plotUpgrades!.amenValues.length; i++) {
//       if (plot.plotUpgrades!.amenValues[i] == true) {
//         final upgradeName = plot.plotUpgrades!.amenOptions[i];
//         final upgradeConfig = upgradeInfo[upgradeName];
//         profit -= ((upgradeConfig?['monthlyCostPerResident'] as num).toInt() *
//                 plot.residents) ~/
//             30;
//         profit += ((upgradeConfig?['monthlyProfitPerResident'] as num).toInt() *
//                 plot.residents) ~/
//             30;
//       }
//     }
//   }

//   return profit;
// }

// double calculateTaxRateChanges(
//     GameSave save, double taxRate, int money, bool override) {
//   if (save.infoDay % 30 != 0 && !override) {
//     return taxRate;
//   }
//   final hasTaxExpert = save.staff
//           ?.staffValues[save.staff?.staffOptions.indexOf("taxExpert") ?? -1] ??
//       false;

//   if (money < gameSettings['taxRateBreakpoints'][0]) {
//     taxRate = gameSettings['taxRates'][0];
//   } else if (money < gameSettings['taxRateBreakpoints'][1]) {
//     taxRate = gameSettings['taxRates'][1];
//   } else if (money < gameSettings['taxRateBreakpoints'][2]) {
//     taxRate = gameSettings['taxRates'][2];
//   } else if (money < gameSettings['taxRateBreakpoints'][3]) {
//     taxRate = gameSettings['taxRates'][3];
//   } else {
//     taxRate = gameSettings['taxRates'][4];
//   }

//   if (hasTaxExpert) {
//     final random = Random();
//     // between 0.3 and 0.7
//     final randomModifier = random.nextDouble() * 0.4 + 0.3;
//     // round to 2 decimal places
//     taxRate = (taxRate * randomModifier * 100).round() / 100;
//   }

//   return taxRate;
// }

// int calculateStaffCosts(int profit, Staff? staff, int propertyCount) {
//   if (staff == null) {
//     return profit;
//   }
//   for (var i = 0; i < staff.staffValues.length; i++) {
//     if (staff.staffValues[i] == true) {
//       final staffName = staff.staffOptions[i];
//       final staffConfig = staffInfo[staffName];
//       profit -= (staffConfig?['baseMonthlyCost'] as num).toInt() ~/ 30;
//       profit -= ((staffConfig?['monthlyCostPerProperty'] as num).toInt() *
//               propertyCount) ~/
//           30;
//       if (staffConfig?['percentageOfAllProfit'] != null) {
//         profit -=
//             (profit * (staffConfig?['percentageOfAllProfit'] as num)).toInt();
//       }
//     }
//   }

//   return profit;
// }

// bool tooHigh = false;

// double calculateEconomyHealth(GameSave save) {
//   var economyTrends = save.economyTrends;
//   var economyTrendIndex = save.economyTrendIndex;

//   final random = Random();
//   if (economyTrends.isEmpty) {
//     bool isPositive = true;
//     int positives = 0;
//     int negatives = 0;

//     int remaining = 10000;
//     while (remaining > 0) {
//       int sprintLength = min(remaining, random.nextInt(120) + 60);
//       remaining -= sprintLength;

//       // generate a sprint
//       for (int i = 0; i < sprintLength; i++) {
//         double change = (random.nextDouble() - (random.nextDouble() * 1)) *
//             (isPositive ? 1 : -1);
//         economyTrends.add(change);
//       }

//       isPositive = random.nextBool();
//       if (isPositive) {
//         positives++;
//       } else {
//         negatives++;
//       }
//     }
//   }
//   // developer.log(economyTrends.toString());

//   double healthModifier = 0;
//   var avgRent = 0;
//   var avgHappiness = 0;
//   var numPlots = 0;
//   var plots = save.plotList?.resPlots;
//   var daysIntoGame = save.infoDay;
//   var money = save.money;

//   if (plots != null && plots.isNotEmpty) {
//     numPlots = plots.length;
//     for (var plot in plots) {
//       avgRent += plot.rent;
//       avgHappiness += plot.happiness;
//     }
//     avgRent = avgRent ~/ numPlots;
//     avgHappiness = avgHappiness ~/ numPlots;
//   }

//   //// Adjust based on rent averages
//   if (avgRent < 1000) {
//     healthModifier += (1000 - avgRent) / 500;
//   } else if (avgRent >= 1800) {
//     healthModifier -= (avgRent - 1800) / 500;
//   }

//   //// The wealthier the player, the less happy the economy is
//   if (money > 500000) {
//     healthModifier -= ((money - 500000) / 500000).clamp(-5, 5);
//   }

//   //// The happier the avg happiness, the happier the economy
//   healthModifier += (avgHappiness / 100.0);
//   if (avgHappiness < 40) {
//     healthModifier -= (40 - avgHappiness) / 50.0;
//   }

//   //// The more plots the player has, the happier the economy
//   if (numPlots > random.nextInt(10)) {
//     healthModifier += (numPlots - 10) / 750.0;
//   }

//   if (economyTrendIndex == economyTrends.length - 1) {
//     economyTrendIndex = 0;
//   }

//   healthModifier /= 5;
//   healthModifier += economyTrends[economyTrendIndex] * (daysIntoGame / 1000);

//   if (healthModifier > 5) {
//     print('🚨 health modifier is greater than 5, $healthModifier');
//     healthModifier = 5;
//   } else if (healthModifier < -5) {
//     print('🚨 health modifier is less than -5, $healthModifier');
//     healthModifier = -5;
//   } else {
//     //print('👍 health modifier is $healthModifier');
//   }

//   var newHealth =
//       (save.economyHealth + (healthModifier * 2)).clamp(0, 300.0).toDouble();

//   // bring newHealth 25% closer to 150 if it is above 150
//   if (newHealth > 250) {
//     tooHigh = true;
//     newHealth = newHealth - 150 * 0.05;
//   } else {
//     tooHigh = false;
//   }

//   // print(
//   //     'economy health: $newHealth, modifier: $healthModifier, trend number: ${economyTrends[economyTrendIndex]}');
//   return newHealth;
// }

// int calculatePropertyTaxes(int profit, List<Plot>? plots) {
//   if (plots == null) {
//     return profit;
//   }
//   for (var plot in plots) {
//     profit -= (plot.propertyValue / 50 / 30).floor();
//   }

//   return profit;
// }

// int daysInDebt = 0;

// bool checkIfGameOver(GameSave save) {
//   if (save.money < 0) {
//     if (daysInDebt > 15) {
//       return true;
//     } else {
//       daysInDebt++;
//     }
//   } else {
//     daysInDebt = 0;
//   }
//   return false;
// }

// List<Plot> calculatePlotValues(GameSave save) {
//   final plots = save.plotList?.resPlots;
//   if (plots == null) {
//     return [];
//   }
//   for (var plot in plots) {
//     int addedValue = 0;
//     if (save.staff?.staffValues[
//             save.staff?.staffOptions.indexOf("propertyManager") ?? -1] ==
//         true) {
//       addedValue = (plot.propertyValue ~/ 75000);
//     }
//     if (save.economyHealth < 50) {
//       addedValue += plot.propertyValue ~/ 1000;
//     } else if (save.economyHealth < 150) {
//       addedValue += 0;
//     } else if (save.economyHealth < 250) {
//       addedValue += (plot.propertyValue ~/ 50000);
//     } else if (save.economyHealth < 300) {
//       addedValue += (plot.propertyValue ~/ 25000);
//     }
//     plot.propertyValue += addedValue;
//   }

//   return plots;
// }
