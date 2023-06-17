import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';

import '../../configSettings.dart';
import '../models/gameSave.dart';

class GameOver extends ConsumerStatefulWidget {

  const GameOver({Key? key}) : super(key: key);

  @override
  _GameOverState createState() => _GameOverState();
}

class _GameOverState extends ConsumerState<GameOver> {
  @override
  Widget build(BuildContext context) {
    final saveProvider =
        ref.read(saveProviderNotifier); 

    Color backgroundColorARGB = const Color.fromARGB(255, 36, 59, 80);
    Color headerBackgroundColorARGB = const Color.fromARGB(255, 37, 68, 97);

    return Scaffold(
      backgroundColor: backgroundColorARGB,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Game over :(\n\nYou were out of money for over 15 days!',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  saveProvider.resetGame();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Start a new game',
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
