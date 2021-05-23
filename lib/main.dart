import 'package:flutter/material.dart';
import './screens/main_screen.dart';
import './screens/app_1_screen.dart';
import './screens/app_2_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema 2',
      home: MainScreen(),
      routes: {
        App1Screen.routeName: (ctx) => App1Screen(),
        App2Screen.routeName: (ctx) => App2Screen(),
      },
    );
  }
}
