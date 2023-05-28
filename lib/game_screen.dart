// GameScreen widget

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage.dart';

// stateful
class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  // state
  @override
  void initState() {
    super.initState();
    ref.read(storageProvider);
  }

  // state
  @override
  void dispose() {
    super.dispose();
  }

  // state
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Money: ${ref.watch(storageProvider).getMoney}',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              child: const Text('Click'),
              onPressed: () {
                setState(() {
                  ref.watch(storageProvider).addMoney();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}