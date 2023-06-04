import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/models/gameSave.dart';
import 'package:real/provider/provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

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

    // 547AA5
    Color backgroundColorARGB = Color.fromARGB(255, 36, 59, 80);
    // 293132
    Color headerBackgroundColorARGB = Color.fromARGB(255, 37, 68, 97);
    // 4F5165
    Color happyColor = Color.fromARGB(255, 17, 95, 51);
    // F39B6D
    Color sadColor = Color.fromARGB(255, 121, 50, 41);

    // displayProperties()
    Widget displayProperties() {
      var newRent = null;

      if (propertyList != null) {
        return ListView.builder(
          // dont let scroll down
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: propertyList.plots!.length,
          itemBuilder: (context, index) {
            return ListTile(
              splashColor: Color.fromARGB(42, 255, 230, 0),
              leading: const Icon(Icons.home),
              tileColor: propertyList.plots![index].happiness < 40
                  ? sadColor
                  : happyColor,
              title: Text('\$${propertyList.plots![index].rent.toString()}'),
              subtitle: Text(
                  '${propertyList.plots![index].residents}/${propertyList.plots![index].maxResidents} residents'),
              trailing:
                  Text('${propertyList.plots![index].happiness}% happiness'),
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 25,
                          right: 25),
                      child: SizedBox(
                        height: 175,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Raise or lower rent',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Current rent: \$${propertyList.plots![index].rent}'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  // border
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  // show suffix icon if newRent is not null
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        if (newRent != null) {
                                          saveProvider.actionSetRent(
                                              newRent, index);
                                        }
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.check))),
                              textInputAction: TextInputAction.done,
                              // have submit button to change rent
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              // on every character change, set newRent to value
                              onChanged: (value) {
                                // try to parse number out of value, if not, set to null
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
              },
              onTap: () async {
                // on tap, search for residents
                final increase =
                    await saveProvider.actionSearchForResidents(index);
                if (increase > 0) {
                  // if residents found, show toast
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color.fromARGB(255, 30, 167, 35),
                      behavior: SnackBarBehavior.floating,
                      width: 200,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      duration: const Duration(milliseconds: 600),
                      content: Text('$increase resident found! 🎉',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  );
                }

                // light haptic
                HapticFeedback.lightImpact();
              },
            );
          },
        );
      } else {
        return const Text('No properties');
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    headerWidget(
                        money: save!.money,
                        day: save!.info_day,
                        background: headerBackgroundColorARGB),
                    displayProperties(),
                    const Spacer(),
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
    {required int money, required int day, required Color background}) {
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
            fontSize: 20,
          ),
        ),
        Text(
          'Day: $day',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
