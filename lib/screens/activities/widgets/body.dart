import 'package:flutter/material.dart';
import './clock.dart';
import './activies-list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [DigitalClockAndDate(), Activities()],
    );
    // return Column(children: [DigitalClockAndDate(), Activities()]);
  }
}
