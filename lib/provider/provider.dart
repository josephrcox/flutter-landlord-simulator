import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real/models/gameSave.dart';

import 'dart:async';

Timer? timer;

final saveProviderNotifier =
    AutoDisposeChangeNotifierProvider<SaveProvider>((ref) => SaveProvider());

class SaveProvider with ChangeNotifier {
  GameSave? _save;
  late Isar isar;
  Timer? _timer;

  GameSave? get save => _save;

  bool _loading = true;
  bool get loading => _loading;

  SaveProvider() {
    init();
  }

  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [GameSaveSchema],
      inspector: true,
      directory: dir.path,
    );

    await getFirstSave();

    _loading = false;
    notifyListeners();

    return isar;
  }

  Isar getIsar() {
    return isar;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<GameSave?> getFirstSave() async {
    _save = await isar.gameSaves.where().findFirst();
    if (_save == null) {
      final newSave = GameSave();
      await isar.writeTxn(() async {
        await isar.gameSaves.put(newSave);
      });
      _save = await isar.gameSaves.where().findFirst();
      _loading = false;
      notifyListeners();
      return _save;
    }
    _loading = false;
    notifyListeners();

    return _save;
  }

  void triggerLoop() {
    loop(isar);
  }
}

final saveProvider = ChangeNotifierProvider((ref) => SaveProvider());

void loop(isar) {
  print('hi');
}
