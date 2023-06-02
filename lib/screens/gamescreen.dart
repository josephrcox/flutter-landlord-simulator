import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
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
    final save = saveProvider.save;
    var propertyList = save?.plotList;

    Color backgroundColorARGB = const Color.fromARGB(255, 149, 150, 255);

    // displayProperties()
    Widget displayProperties() {
      if (propertyList != null) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: propertyList.plots!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(propertyList.plots![index].rent.toString()),
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
        backgroundColor: backgroundColorARGB,
        shadowColor: Colors.transparent,
      ),
      // 239 100 79
      backgroundColor: backgroundColorARGB,
      body: saveProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    headerWidget(money: save!.money, day: save.info_day),
                    // displayProperties(),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: saveProvider.actionPurchaseProperty,
                      child: const Text('Buy property'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// header widget that takes money 
Widget headerWidget({required int money, required int day}) {

  // converts money to string with commas
  String moneyString = money.toString();
  if (moneyString.length > 3) {
    moneyString = '\$${moneyString.substring(0, moneyString.length - 3)},${moneyString.substring(moneyString.length - 3)}';
  }

  return Container(
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

