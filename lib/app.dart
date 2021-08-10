import 'package:flutter/material.dart';
import 'package:flutter_timer/screens/timer_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        // accentColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      title: 'Timer',
      home: TimerPage(),
    );
  }
}
