import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

  // return state

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

    void openUpgradesMenu(index) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
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
                    'Upgrades',
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
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    onChanged: (value) {},
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
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: propertyList.plots!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: AnimatedContainer(
                  duration:
                      const Duration(milliseconds: tapAnimationDurationMS),
                  decoration: BoxDecoration(
                      color: isTappedList[index]
                          // when tapped, use a slightly darker color
                          ? propertyList.plots![index].happiness < 40
                              ? sadColor.withOpacity(0.4)
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
                            openSetRentMenu(index);
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.paid,
                          label: 'Set rent',
                        ),
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            openUpgradesMenu(index);
                          },
                          backgroundColor: Color.fromARGB(255, 43, 141, 95),
                          foregroundColor: Colors.white,
                          icon: Icons.rocket_launch,
                          label: 'Upgrade',
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
                                        // decrease rent by 100
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
                                        // increase rent by 100
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
                        // margin: const EdgeInsets.symmetric(horizontal: 20),
                        // make higher in screen
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
              saveProvider.resetGame();
              save = saveProvider.save;
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
                        background: headerBackgroundColorARGB),
                    displayProperties(),
                    ElevatedButton(
                      onPressed: saveProvider.actionPurchaseProperty,
                      // set rulesNewPropCost to money string with commas
                      child: Text('Buy property (${save!.rulesNewPropCost})'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// header widget that takes money
Widget headerWidget(
    {required int money,
    required int day,
    required int year,
    required Color background}) {
  // converts money to string with commas
  String moneyString = money.toString();
  if (moneyString.length > 3) {
    moneyString =
        '\$${moneyString.substring(0, moneyString.length - 3)},${moneyString.substring(moneyString.length - 3)}';
  }

  return Container(
    // bg color
    color: background,
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Money: $moneyString',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Column(
          children: [
            Text(
              'Day $day',
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
