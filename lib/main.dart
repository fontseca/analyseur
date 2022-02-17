import 'package:analyseur/themes.dart';
import 'package:analyseur/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analyseur',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}