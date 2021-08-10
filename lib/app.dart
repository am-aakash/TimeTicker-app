import 'package:flutter/material.dart';
import 'package:flutter_timer/screens/timer_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white70,
        accentColor: Colors.blueGrey[900],
        brightness: Brightness.dark,
      ),
      title: 'Flutter Timer',
      home: TimerPage(),
    );
  }
}
