import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageProvider = Provider<Storage>((ref) {
  return Storage();
});

class Storage {
  // provider

  int _money = 20;

  int get getMoney => _money;

  void addMoney() {
    _money++;
  }
}
