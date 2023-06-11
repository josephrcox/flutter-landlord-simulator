import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';

import '../configSettings.dart';
import 'models/gameSave.dart';

class StaffMenu extends ConsumerStatefulWidget {
  // require saveProvider to be passed in
  const StaffMenu({Key? key}) : super(key: key);

  @override
  _StaffMenuState createState() => _StaffMenuState();
}

class _StaffMenuState extends ConsumerState<StaffMenu> {
  @override
  Widget build(BuildContext context) {
    final saveProvider = ref.watch(saveProviderNotifier);
    var save = saveProvider.save;
    final staffOptions = save!.staff?.staffOptions;
    final staffValues = save.staff?.staffValues;

    // create map of options and values
    Map<String, bool> staffMap = {};
    for (int i = 0; i < staffOptions!.length; i++) {
      staffMap[staffOptions[i]] = staffValues![i];
    }

    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Staff'),
        backgroundColor: headerBackgroundColorARGB,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: backgroundColorARGB,
      body: Column(
        children: [
          _header(save.money, save.plotList!.plots!.length, context),
          Expanded(
            child: ListView.builder(
              // scrollable list of upgrades
              shrinkWrap: true,
              itemCount: staffMap.length,
              itemBuilder: (context, index) {
                String option = staffMap.keys.elementAt(index);
                bool value = staffMap.values.elementAt(index);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () async {
                      // use actionToggleStaff
                      bool success = await saveProvider.actionToggleStaff(
                        staffName: option,
                        staffIndex: index,
                        toggleTo: !value,
                      );
                      if (success) {
                        setState(
                          () {
                            staffMap[option] =
                                !value; // Toggle the boolean value
                            save = saveProvider.save;
                          },
                        );
                      }
                    },
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          color: value ? Colors.green : Colors.red,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _staffOptionButton(
                                        save,
                                        staffInfo[option]!['name'].toString(),
                                        staffInfo[option]!['desc'].toString(),
                                        value,
                                        staffInfo[option]![
                                            'monthlyCostPerProperty'] as int,
                                        staffInfo[option]!['baseMonthlyCost'] as int,
                                      ),
                                      const SizedBox(height: 16),
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

Widget _staffOptionButton(GameSave? save, String name, String description,
    bool enabled, int monthlyCostPerProperty, int baseMonthlyCost) {
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
              fontSize: 18,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 24,
            child: Text(
              enabled ? '✅' : '⃝',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.only(right: 32.0),
        child: Text(
          description,
        ),
      ),
      const SizedBox(height: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Costs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text('\$$baseMonthlyCost base cost per month'),
          const SizedBox(height: 3),
          Text('\$$monthlyCostPerProperty per property per month'),
        ],
      ),
      name == "Property Manager" && enabled
          ? Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 110, 1, 101),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          '💜 This manager has filled',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${save!.staff?.residentVacanciesFilledByPropertyManager}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'vacancies for you!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
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

Widget _header(int money, int propertyCount, context) {
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
          Text(
            '\$$money',
            style: const TextStyle(
              fontSize: size,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            propertyCount == 1
                ? 'You have $propertyCount property'
                : 'You have $propertyCount properties',
            style: const TextStyle(
              fontSize: size,
            ),
          ),
        ],
      ),
    ),
  );
}
