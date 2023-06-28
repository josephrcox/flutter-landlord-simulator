import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/button.dart';
import 'package:real/provider/provider.dart';

import '../../configSettings.dart';
import '../models/gameSave.dart';

class BuyMenu extends ConsumerStatefulWidget {
  const BuyMenu({Key? key}) : super(key: key);

  @override
  _BuyMenuState createState() => _BuyMenuState();
}

class _BuyMenuState extends ConsumerState<BuyMenu> {
  String capitalize(String str) {
    if (str == null || str.isEmpty) {
      return str;
    }

    return str[0].toUpperCase() + str.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);

    final saveProvider = ref.watch(saveProviderNotifier);
    var save = saveProvider.save;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase'),
        backgroundColor: headerBackgroundColorARGB,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: backgroundColorARGB,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 64.0, top: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < propertyTypes.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    capitalize(propertyTypes[i][0]['type'].toString()),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (var j = 0; j < propertyTypes[i].length; j++)
                  CustomButton(
                    title: propertyTypes[i][j]['name'].toString(),
                    subtitleRow: [
                      propertyTypes[i][j]['desc'].toString(),
                    ],
                    bodyRows: [
                      'Upfront: \$${propertyTypes[i][j]['cost_upfront']}',
                      if (propertyTypes[i][j]['cost_daily'] != null)
                        'Monthly: \$${((propertyTypes[i][j]['cost_daily'] as num) * 30).toStringAsFixed(0)}',
                      if (propertyTypes[i][j]['revenue_daily_max'] != null)
                        'Monthly revenue up to: \$${((propertyTypes[i][j]['revenue_daily_max'] as num) * 30).toStringAsFixed(0)}',
                    ],
                    backgroundColor: Colors.blueGrey,
                    fontColor: Colors.white,
                    footer: 'footer',
                    rightSide: [
                      Text(
                        '${propertyTypes[i][j]['icon']}',
                        style: const TextStyle(fontSize: 48),
                      ),
                    ],
                    onTap: () async {
                      final response = await saveProvider.purchaseProperty(
                          propertyTypes[i][j]['id'] as String);
                      if (response!.toLowerCase() == 'success') {
                        Navigator.pop(context);
                      }
                    },
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
