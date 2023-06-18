import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'gameOver.dart';
import 'staffMenu.dart';
import 'helpScreen.dart';
import 'upgradeMenu.dart';
import 'sellMenu.dart';
import '../configSettings.dart';
import 'package:intl/intl.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with WidgetsBindingObserver {
  bool isTapped = false;
  List<bool> isTappedList = [];
  int daysInDebt = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    isTappedList = [];
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saveProvider = ref.watch(saveProviderNotifier);
    var save = saveProvider.save;
    var propertyList = save?.plotList;
    const tapAnimationDurationMS = 150;

    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);
    Color happyColor = const Color.fromARGB(255, 17, 95, 51);
    Color sadColor = const Color.fromARGB(255, 121, 50, 41);
    Color amenitiesColor = const Color.fromARGB(255, 73, 17, 89);

    bool paused = false;

    final avgProfit = save!.profitHistory.isNotEmpty
        ? save.profitHistory.reduce((a, b) => a + b) ~/
            save.profitHistory.length
        : 0;

    Widget displayProperties() {
      if (propertyList != null &&
          propertyList.plots != null &&
          propertyList.plots!.isNotEmpty) {
        if (isTappedList.length != propertyList.plots!.length) {
          isTappedList = List<bool>.filled(propertyList.plots!.length, false);
        }

        return Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: propertyList.plots!.length,
            itemBuilder: (context, index) {
              final costToSearchManagerModifier =
                  save!.staff!.staffValues[0] == true ? 2 : 1;
              final costToSearch = '\$' +
                  '${propertyList.plots![index].rent * (gameSettings['baseSearchForResidentCost'] / costToSearchManagerModifier)}';

              final plotIndex = index;
              Map<String, bool> upgradesMap = {};
              for (int i = 0;
                  i <
                      propertyList!
                          .plots![plotIndex].plotUpgrades!.amenOptions.length;
                  i++) {
                upgradesMap[propertyList
                        .plots![plotIndex].plotUpgrades!.amenOptions[i]] =
                    propertyList.plots![plotIndex].plotUpgrades!.amenValues[i];
              }

              var upgradeListString = "";

              // for each upgrade that is true, get the icon and append to the string
              upgradesMap.forEach((key, value) {
                if (value) {
                  final info = upgradeInfo[key];
                  if (info != null) {
                    final icon = info['icon'];
                    upgradeListString += icon as String;
                  }
                }
              });

              return Padding(
                padding: const EdgeInsets.only(
                  top: 6.0,
                  bottom: 4.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: GestureDetector(
                  child: AnimatedContainer(
                    duration:
                        const Duration(milliseconds: tapAnimationDurationMS),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(75, 0, 0, 0),
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: isTappedList[index]
                            ? propertyList.plots![index].happiness < 40
                                ? sadColor.withOpacity(0.4)
                                : propertyList.plots![index].happiness > 99
                                    ? happyColor.withOpacity(0.8)
                                    : happyColor.withOpacity(0.4)
                            : propertyList.plots![index].happiness < 40
                                ? sadColor
                                : happyColor),
                    child: Slidable(
                      closeOnScroll: true,
                      endActionPane: ActionPane(
                        extentRatio: 0.7,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpgradeMenu(
                                    plotIndex: index,
                                  ),
                                ),
                              );
                            },
                            backgroundColor: amenitiesColor,
                            foregroundColor: Colors.white,
                            icon: Icons.home_repair_service,
                            label: 'Amenities',
                          ),
                          SlidableAction(
                            onPressed: (BuildContext context) async {
                              final response =
                                  await saveProvider.actionUpgradePlotLevel(
                                      propertyIndex: plotIndex);
                              if (response == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Property upgraded.'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'You need \$$response more to upgrade this property. '),
                                  ),
                                );
                              }
                            },
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            icon: Icons.arrow_upward_rounded,
                            label: 'Upgrade',
                          ),
                          SlidableAction(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            onPressed: (BuildContext context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SellMenu(
                                    plotIndex: index,
                                  ),
                                ),
                              );
                            },
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.wallet,
                            label: 'Sell',
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\$${propertyList.plots![index].rent.toString()}',
                                                style: const TextStyle(
                                                  fontSize: 28,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                                height: 0,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4.0),
                                                child: Text(
                                                  '/ month',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 2.0,
                                              bottom: 2.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Level ${propertyList.plots![index].level}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              // Residents
                                              Text(
                                                '👭 ${propertyList.plots![index].residents}/${propertyList.plots![index].maxResidents}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: propertyList
                                                              .plots![index]
                                                              .residents <
                                                          propertyList
                                                              .plots![index]
                                                              .maxResidents
                                                      ? Colors.yellow
                                                      : Colors.white,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              // Happiness
                                              Text(
                                                '😊 ${propertyList.plots![index].happiness}%',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Costs $costToSearch to headhunt',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromARGB(
                                                      255, 190, 189, 189),
                                                  // italic
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              saveProvider.actionSetRent(
                                                propertyList
                                                        .plots![index].rent -
                                                    100,
                                                index,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 136, 0),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: const Icon(
                                                Icons.arrow_downward_outlined,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 32),
                                          InkWell(
                                            onTap: () {
                                              saveProvider.actionSetRent(
                                                propertyList
                                                        .plots![index].rent +
                                                    100,
                                                index,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 0, 94, 255),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: const Icon(
                                                Icons.arrow_upward_outlined,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  upgradeListString == ""
                                      ? const SizedBox.shrink()
                                      : Column(
                                          children: [
                                            const SizedBox(height: 2),
                                            Text(
                                              upgradeListString,
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    setState(() {
                      isTappedList[index] = true;
                      Timer(
                          const Duration(milliseconds: tapAnimationDurationMS),
                          () {
                        setState(() {
                          isTappedList[index] = false;
                        });
                      });
                    });
                    final increase =
                        await saveProvider.actionSearchForResidents(index);

                    if (increase < 0) {
                      // not enough money
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 167, 46, 30),
                          behavior: SnackBarBehavior.floating,
                          width: 200,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          duration: const Duration(milliseconds: 600),
                          content: Text(
                            'You require ${-1 * increase} more money to search for residents.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                    HapticFeedback.lightImpact();
                  },
                ),
              );
            },
          ),
        );
      } else {
        return const Column(children: [
          SizedBox(height: 12),
          Text(
            'No properties, buy one :)',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 20,
            ),
          ),
        ]);
      }
    }

    if (save.gameOver == true) {
      return const GameOver();
    }
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: saveProvider.actionPurchaseProperty,
          child: Text('Buy property (${save!.rulesNewPropCost})'),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 196, 118, 1),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StaffMenu(),
              ),
            );
          },
          child: const Text('Manage Staff'),
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
        ),
      ],
      appBar: AppBar(
        title: const Text('Real estate sim'),
        backgroundColor: headerBackgroundColorARGB,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpScreen(
                    economy: save.economyTrends,
                    day: save.infoDay,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.question_mark),
          ),
          IconButton(
            onPressed: () {
              if (paused) {
                paused = false;
              } else {
                paused = true;
              }

              saveProvider.pauseGame();
            },
            icon: paused == true
                ? const Icon(Icons.play_circle)
                : const Icon(Icons.pause_circle),
          ),
          IconButton(
            onPressed: () {
              // confirm to reset
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Reset game?'),
                    content: const Text(
                        'This will reset your game and you will lose all progress.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          saveProvider.resetGame();
                          Navigator.pop(context);
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: backgroundColorARGB,
      body: saveProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  headerWidget(
                    money: save!.money,
                    day: save.infoDay,
                    year: save.infoYear,
                    background: headerBackgroundColorARGB,
                    // only go to 2 decimal places
                    taxRate: save.rulesTaxRate.toDouble(),
                    hasTaxExpert: save.staff?.staffValues[
                            save.staff?.staffOptions.indexOf('taxExpert') ??
                                -1] ??
                        false,
                    avgProfit: avgProfit,
                    economyHealth: save.economyHealth,
                    context: context,
                  ),
                  displayProperties(),
                ],
              ),
            ),
    );
  }
}

Widget headerWidget({
  required int money,
  required int avgProfit,
  required int day,
  required int year,
  required Color background,
  required double taxRate,
  required bool hasTaxExpert,
  required double economyHealth,
  context,
}) {
  // convert money int to string with commas for money
  var f = NumberFormat("###,###,###,###,###", "en_US");
  String moneyString = f.format(money);

  if (moneyString.length > 3) {
    moneyString = '\$$moneyString';
  }

  final taxRateString = (taxRate * 100).toStringAsFixed(2);
  var taxLevel;
  if (money < gameSettings['taxRateBreakpoints'][0]) {
    taxLevel = 0;
  } else if (money < gameSettings['taxRateBreakpoints'][1]) {
    taxLevel = 1;
  } else if (money < gameSettings['taxRateBreakpoints'][2]) {
    taxLevel = 2;
  } else if (money < gameSettings['taxRateBreakpoints'][3]) {
    taxLevel = 3;
  } else {
    taxLevel = 4;
  }

  return Container(
    color: background,
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text(
                'Economy health: ${economyHealth.toStringAsFixed(2)} / 300',
                // green if above 150, yellow if above 35, red if below 35
                style: TextStyle(
                  color: economyHealth > 150
                      ? const Color.fromARGB(255, 14, 222, 21)
                      : economyHealth > 35
                          ? const Color.fromARGB(255, 224, 205, 35)
                          : Colors.red,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.blueGrey,
                    behavior: SnackBarBehavior.floating,
                    width: 200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    duration: Duration(seconds: 10),
                    content: Text(
                      'Bad (0-35), \nGood (35-150), \nGreat (>150))\n\nThe better the economy, the less likely residents are to leave, and the lower your costs.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Money: $moneyString // avg profit \$$avgProfit',
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Tax rate: $taxRateString%',
                ),
                if (hasTaxExpert)
                  Text(
                    ' (normally ${gameSettings['taxRates'][taxLevel] * 100}%)',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 14, 222, 21)),
                  ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Day $day',
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Year $year',
            ),
          ],
        ),
      ],
    ),
  );
}
