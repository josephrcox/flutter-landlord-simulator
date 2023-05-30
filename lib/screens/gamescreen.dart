import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real/provider/provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> with WidgetsBindingObserver{

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Real estate sim'),
      ),
      body: saveProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (save != null)
                    Text(
                      'You have ${save.money} money',
                    ),
                ],
              ),
            ),
    );
  }
}
