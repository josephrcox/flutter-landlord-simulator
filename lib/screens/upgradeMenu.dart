import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';

import '../../configSettings.dart';
import '../models/gameSave.dart';

class UpgradeMenu extends ConsumerStatefulWidget {
  // require saveProvider to be passed in
  const UpgradeMenu({Key? key, required this.plotIndex}) : super(key: key);

  final int plotIndex;

  @override
  _UpgradeMenuState createState() => _UpgradeMenuState();
}

class _UpgradeMenuState extends ConsumerState<UpgradeMenu> {
  @override
  Widget build(BuildContext context) {
    final saveProvider = ref.watch(saveProviderNotifier);
    var save = saveProvider.save;
    final propertyList = save?.plotList;
    final plotIndex = widget.plotIndex;
    final plotLevel = propertyList!.plots![plotIndex].level;

    Map<String, bool> upgradesMap = {};

    for (int i = 0;
        i <
            propertyList!
                .plots![widget.plotIndex].plotUpgrades!.amenOptions.length;
        i++) {
      upgradesMap[
              propertyList.plots![plotIndex].plotUpgrades!.amenOptions[i]] =
          propertyList.plots![plotIndex].plotUpgrades!.amenValues[i];
    }

    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);

    return Scaffold(
      appBar: AppBar(
        title: Text('Amenities for #${plotIndex + 1}'),
        backgroundColor: headerBackgroundColorARGB,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: backgroundColorARGB,
      body: Column(
        children: [
          _header(propertyList, plotIndex, save!.money, context),
          Expanded(
            child: ListView.builder(
              // scrollable list of upgrades
              shrinkWrap: true,
              itemCount: upgradesMap.length,
              itemBuilder: (context, index) {
                String propertyName = upgradesMap.keys.elementAt(index);
                bool propertyValue = upgradesMap.values.elementAt(index);

                final availableForUpgrade =
                    (upgradeInfo[propertyName]!['levelRequired'] as int) <=
                            plotLevel
                        ? true
                        : false;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () async {
                      if (availableForUpgrade) {
                        final success = await saveProvider.actionToggleAmen(
                          propertyIndex: plotIndex,
                          upgradeIndex: index,
                          upgradeName: upgradesMap.keys.elementAt(index),
                          toggleTo: !propertyValue,
                        );
                        if (success) {
                          setState(
                            () {
                              upgradesMap[propertyName] =
                                  !propertyValue; // Toggle the boolean value
                              save = saveProvider.save;
                            },
                          );
                        }
                      }
                    },
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: propertyValue
                                ? Colors.green
                                : availableForUpgrade
                                    ? Colors.red
                                    : Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      availableForUpgrade
                                          ? const SizedBox.shrink()
                                          : Column(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'PROPERTY NEEDS TO BE LEVEL ${(upgradeInfo[propertyName]!['levelRequired'])}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                              ],
                                            ),
                                      _upgradeNameAndDescription(
                                        upgradeInfo[propertyName]!['name']
                                            .toString(),
                                        upgradeInfo[propertyName]!['desc']
                                            .toString(),
                                        propertyValue,
                                      ),
                                      availableForUpgrade
                                          ? const SizedBox(height: 16)
                                          : const SizedBox.shrink(),
                                      availableForUpgrade
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _costs(
                                                  upgradeInfo[propertyName]![
                                                          "cost"]
                                                      .toString(),
                                                  upgradeInfo[propertyName]![
                                                          "monthlyCostPerResident"]
                                                      .toString(),
                                                ),
                                                const SizedBox(width: 10),
                                                _profits(
                                                  upgradeInfo[propertyName]![
                                                          "monthlyProfitPerResident"]
                                                      .toString(),
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _upgradeNameAndDescription(
    String name, String description, bool enabled) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 24,
            child: Text(
              enabled ? '✅' : '⃝',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Text(
        description,
      ),
    ],
  );
}

Widget _costs(String cost, String monthlyCostPerResident) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      (cost == "0") && (monthlyCostPerResident == "0")
          ? const Text(
              'No costs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          : const Text(
              'Costs',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
      const SizedBox(height: 3),
      cost == "0"
          ? const SizedBox.shrink()
          : Text(
              'Upfront: \$${cost.toString()}',
            ),
      const SizedBox(height: 3),
      monthlyCostPerResident == "0"
          ? const SizedBox.shrink()
          : Text(
              'Monthly: \$${monthlyCostPerResident.toString()}',
            ),
    ],
  );
}

Widget _profits(String monthlyProfitPerResident) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      monthlyProfitPerResident == "0"
          ? const Text(
              'No Profits',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Monthly Profits',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '\$${monthlyProfitPerResident.toString()} a month per resident',
                ),
              ],
            ),
    ],
  );
}

Widget _header(PlotList? propertyList, int plotIndex, int money, context) {
  const double size = 16.0;
  return Container(
    color: const Color.fromARGB(255, 37, 68, 97),
    child: Padding(
      padding: const EdgeInsets.only(
          bottom: 16.0, top: 8.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              '\$$money',
              style: const TextStyle(
                fontSize: size,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              '\$${propertyList?.plots![plotIndex].rent.toString()} rent',
              style: const TextStyle(
                fontSize: size,
              ),
            ),
          ),
          Text('${propertyList?.plots![plotIndex].happiness}% 😊',
              style: const TextStyle(fontSize: size)),
        ],
      ),
    ),
  );
}
