import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiyotaka_s_food/Pages/Connexion.dart';
import 'package:kiyotaka_s_food/Pages/Inscription.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Forcer uniquement le portrait normal
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });

}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ConnexionPage(),
      ),
    );
  }
}
