import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/button.dart';
import 'package:real/provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:real/screens/buyMenu.dart';

import 'gameOver.dart';
import 'staffMenu.dart';
import 'helpScreen.dart';
import 'upgradeMenu.dart';
import 'sellMenu.dart';
import '../configSettings.dart';
import 'package:intl/intl.dart';
import 'situationScreen.dart';

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
    const tapAnimationDurationMS = 120;

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

    void checkForSituation() {
      // final response = saveProvider.checkForSituation();
      // if (response != null) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => SituationScreen(
      //         situation: situationsList[response],
      //         index: response,
      //       ),
      //     ),
      //   );
      // }
    }

    Widget displayProperties() {
      if (propertyList != null &&
          propertyList.resPlots != null &&
          propertyList.resPlots!.isNotEmpty) {
        if (isTappedList.length != propertyList.resPlots!.length) {
          isTappedList =
              List<bool>.filled(propertyList.resPlots!.length, false);
        }

        return Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: propertyList.resPlots!.length,
            itemBuilder: (context, index) {
              final costToSearchManagerModifier =
                  save!.staff!.staffValues[0] == true ? 2 : 1;
              final costToSearch = '\$' +
                  '${propertyList.resPlots![index].rent * (gameSettings['baseSearchForResidentCost'] / costToSearchManagerModifier)}';

              final plotIndex = index;
              Map<String, bool> upgradesMap = {};
              for (int i = 0;
                  i <
                      propertyList!
                          .resPlots![plotIndex].amenities!.amenOptions.length;
                  i++) {
                upgradesMap[propertyList
                        .resPlots![plotIndex].amenities!.amenOptions[i]] =
                    propertyList.resPlots![plotIndex].amenities!.amenValues[i];
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

              var amenitiesString = '';
              // for each amentity that the plot has set to true, get the icon and append to the string
              for (int i = 0;
                  i <
                      propertyList
                          .resPlots![plotIndex].amenities!.amenOptions.length;
                  i++) {
                if (propertyList
                    .resPlots![plotIndex].amenities!.amenValues[i]) {
                  final info = upgradeInfo[propertyList
                      .resPlots![plotIndex].amenities!.amenOptions[i]];
                  if (info != null) {
                    final icon = info['icon'];
                    amenitiesString += icon as String;
                  }
                }
              }

              var propertyIcon = '';
              // Search propertyTypes for this exact type and get the icon
              for (var category in propertyTypes) {
                for (var type in category) {
                  if (type['id'] == propertyList.resPlots![plotIndex].type) {
                    propertyIcon = type['icon'] as String;
                  }
                }
              }

              return GestureDetector(
                child: AnimatedContainer(
                  duration:
                      const Duration(milliseconds: tapAnimationDurationMS),
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
                                  plotId: propertyList.resPlots![index].id,
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
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          onPressed: (BuildContext context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SellMenu(
                                  plotId: propertyList.resPlots![index].id
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
                    child: CustomButton(
                      title: '\$${propertyList.resPlots![index].rent}',
                      subtitleRow: [
                        '😊 ${propertyList.resPlots![index].happiness}%',
                        ' ',
                        (propertyList.resPlots![index].residents <
                                propertyList.resPlots![index].maxResidents)
                            ? '👨‍👩‍👦 ${propertyList.resPlots![index].residents} / ${propertyList.resPlots![index].maxResidents} 📉'
                            : '👨‍👩‍👦 ${propertyList.resPlots![index].residents} / ${propertyList.resPlots![index].maxResidents}'
                      ],
                      bodyRows: [],
                      backgroundColor:
                          propertyList.resPlots![index].happiness > 50
                              ? happyColor
                              : sadColor,
                      leadingIcon: propertyIcon,
                      rightSide: [
                        Column(
                          children: [
                            InkWell(
                              child: const Text(
                                '🔼',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                ),
                              ),
                              onTap: () {
                                saveProvider.resSetRent(
                                  propertyList.resPlots![index].id,
                                  100,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              child: const Text(
                                '⬇️',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                ),
                              ),
                              onTap: () {
                                saveProvider.resSetRent(
                                  propertyList.resPlots![index].id,
                                  -100,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                      footer: amenitiesString,
                      onTap: () {
                        saveProvider.resSearchForResidents(
                            propertyList.resPlots![index].id);
                      },
                      fontColor: Colors.white,
                    ),
                  ),
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
        // ElevatedButton(
        //   onPressed: saveProvider.actionPurchaseProperty,
        //   child: Text('Buy property (${save!.rulesNewPropCost})'),
        //   style: ElevatedButton.styleFrom(
        //     primary: const Color.fromARGB(255, 196, 118, 1),
        //   ),
        // ),
        // button that navigates to buyMenu
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BuyMenu(),
              ),
            );
          },
          child: const Text('Buy Property'),
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
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
                  // saveProvider.activeSituation != null
                  //     ? Column(
                  //         children: [
                  //           Text('active'),
                  //           ElevatedButton(
                  //               onPressed: () {
                  //                 saveProvider.activeSituation = null;
                  //                 saveProvider.pauseLoop = false;
                  //               },
                  //               child: Text('')),
                  //         ],
                  //       )
                  //     : const SizedBox.shrink(),
                  headerWidget(
                    money: save.money,
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
