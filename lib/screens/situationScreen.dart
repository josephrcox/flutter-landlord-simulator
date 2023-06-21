import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';

import '../../configSettings.dart';
import '../models/gameSave.dart';

class SituationScreen extends ConsumerStatefulWidget {
  const SituationScreen({Key? key, required this.situation, required this.index}) : super(key: key);

  final Map<String, dynamic> situation;
  final int index;

  @override
  _SituationScreenState createState() => _SituationScreenState();
}

class _SituationScreenState extends ConsumerState<SituationScreen> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);
    final situation = widget.situation;
    final saveProvider = ref.read(saveProviderNotifier);
    if (saveProvider.pauseLoop != true) {
      saveProvider.pauseLoop = true;
    }

    return Scaffold(
      appBar: AppBar(
        // no back button in top
        automaticallyImplyLeading: false,
        title: Text('Situation'),
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
              Text(
                '${situation['description']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  
                  saveProvider.activeSituation = null;
                  saveProvider.actionDealWithSituationRepercussions(widget.index);
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
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
