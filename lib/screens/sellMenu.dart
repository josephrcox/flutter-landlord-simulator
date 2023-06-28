import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';

import '../../configSettings.dart';
import '../models/gameSave.dart';

class SellMenu extends ConsumerStatefulWidget {
  final int plotIndex;

  const SellMenu({Key? key, required this.plotIndex}) : super(key: key);

  @override
  _SellMenuState createState() => _SellMenuState();
}

class _SellMenuState extends ConsumerState<SellMenu> {
  @override
  @override
  Widget build(BuildContext context) {
    final saveProvider = ref.watch(saveProviderNotifier);
    var save = saveProvider.save;
    final propertyList = save?.plotList;
    final plotIndex = widget.plotIndex;

    // ...

    final value = save?.plotList?.resPlots![plotIndex].propertyValue;
    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sell property #${plotIndex + 1}'),
        backgroundColor: headerBackgroundColorARGB,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: backgroundColorARGB,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 64.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Value',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '\$$value',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  // saveProvider.actionSellProperty(plotIndex);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Sell property',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
