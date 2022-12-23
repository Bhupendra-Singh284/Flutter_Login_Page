import 'package:flutter/material.dart';
import 'package:task_manager/loginScreen.dart';
import 'package:task_manager/preferences_util[1].dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //to remove the debug banner at top right side
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      //call home page from Home_page.dart
      home: LoginScreen(),
    );
  }
}
// This trailing comma makes auto-formatting nicer for build methods.
