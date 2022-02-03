import 'package:analyseur/helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:analyseur/screens/activities/activities.dart';

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
      home: ActivitiesScreen(),
    );
  }
}