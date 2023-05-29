import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real/game_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './game_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize the Flutter binding

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(
    ProviderScope(
      child: MaterialApp(
        // app bar
        title: 'Real estate sim',
    
        home: const MyApp(),
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          scaffoldBackgroundColor: Color.fromARGB(255, 83, 83, 83),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Menu();
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void startGame(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real estate sim'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // top safe area
            const Text(
              'Real estate sim',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  // go to game screen widget
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProviderScope(child: GameScreen());
                  }));
                },
                child: const Text('Start game')),
          ],
        ),
      ),
    );
  }
}
