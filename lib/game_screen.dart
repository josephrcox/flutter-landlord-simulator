// GameScreen widget

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(counterProvider.notifier).loadFromStorage();
    final count = ref.watch(counterProvider);

    // whenever counter state changes, print something
    final counterListener = Provider((ref) {
      ref.watch(counterProvider);
    });
    ref.listen<int>(counterProvider, (int? previousCount, int newCount) {
      print('The counter changed $newCount');
      ref.read(counterProvider.notifier).saveToStorage();
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Game Screen')),
      body: Column(
        children: [
          Text('$count'),
        ],
      ),
    );
  }
}
