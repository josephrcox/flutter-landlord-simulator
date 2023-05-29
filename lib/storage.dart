import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(-1);

  bool loaded = false;

  void loadFromStorage() async {
    if (!loaded) {
      final prefs = await SharedPreferences.getInstance();
      state = prefs.getInt('counter') ?? 0;
      set(state);
    }
    loaded = true;
  }

  void saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', state);
  }

  void increment() => state++;

  void set(x) => state = x;
}
