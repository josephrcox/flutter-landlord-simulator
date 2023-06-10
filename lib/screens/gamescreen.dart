import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../configSettings.dart';
import 'helpScreen.dart';
import '../upgradeMenu.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with WidgetsBindingObserver {
  bool isTapped = false;
  List<bool> isTappedList = [];
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

    void openSetRentMenu(index) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          int? newRent;
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 25,
              right: 25,
            ),
            child: SizedBox(
              height: 175,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Raise or lower rent',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Current rent: \$${propertyList?.plots![index].rent}'),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (newRent != null) {
                            saveProvider.actionSetRent(newRent!.toInt(), index);
                          }
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    onChanged: (value) {
                      try {
                        newRent = int.parse(value);
                      } catch (e) {
                        newRent = null;
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Widget displayProperties() {
      if (propertyList != null) {
        if (isTappedList.length != propertyList.plots!.length) {
          isTappedList = List<bool>.filled(propertyList.plots!.length, false);
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: propertyList.plots!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: AnimatedContainer(
                  duration:
                      const Duration(milliseconds: tapAnimationDurationMS),
                  decoration: BoxDecoration(
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
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${propertyList.plots![index].rent.toString()}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                      height: 0,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
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
                                const SizedBox(height: 5),
                                Text(
                                  '${propertyList.plots![index].residents}/${propertyList.plots![index].maxResidents} residents',
                                  style: TextStyle(
                                    color:
                                        propertyList.plots![index].residents <
                                                propertyList
                                                    .plots![index].maxResidents
                                            ? Colors.yellow
                                            : Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                    '${propertyList.plots![index].happiness}% happiness'),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 125,
                            child: Column(
                              children: [
                                const Text(
                                  'Adjust rent',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        saveProvider.actionSetRent(
                                          propertyList.plots![index].rent - 100,
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
                                        padding: const EdgeInsets.all(5.0),
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
                                          propertyList.plots![index].rent + 100,
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
                                        padding: const EdgeInsets.all(5.0),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  setState(() {
                    isTappedList[index] = true;
                    Timer(const Duration(milliseconds: tapAnimationDurationMS),
                        () {
                      setState(() {
                        isTappedList[index] = false;
                      });
                    });
                  });
                  final increase =
                      await saveProvider.actionSearchForResidents(index);
                  if (increase > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: const Color.fromARGB(255, 30, 167, 35),
                        behavior: SnackBarBehavior.floating,
                        width: 200,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        duration: const Duration(milliseconds: 600),
                        content: Text(
                          '$increase resident found! 🎉',
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

    return Scaffold(
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
                  builder: (context) => const HelpScreen(),
                ),
              );
            },
            icon: const Icon(Icons.question_mark),
          ),
          IconButton(
            onPressed: () {
              saveProvider.pauseGame();
            },
            icon: const Icon(Icons.pause_circle),
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
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    headerWidget(
                      money: save!.money,
                      day: save!.infoDay,
                      year: save!.infoYear,
                      background: headerBackgroundColorARGB,
                      taxRate: save!.rulesTaxRate,
                      lastProfit: save!.lastProfit,
                    ),
                    displayProperties(),
                    ElevatedButton(
                      onPressed: saveProvider.actionPurchaseProperty,
                      child: Text('Buy property (${save!.rulesNewPropCost})'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

Widget headerWidget({
  required int money,
  required int lastProfit,
  required int day,
  required int year,
  required Color background,
  required double taxRate,
}) {
  String moneyString = money.toString();
  if (moneyString.length > 3) {
    moneyString =
        '\$${moneyString.substring(0, moneyString.length - 3)},${moneyString.substring(moneyString.length - 3)}';
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
            Text(
              'Money: $moneyString (daily profit \$$lastProfit)',
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Tax rate: ${taxRate * 100}%',
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
