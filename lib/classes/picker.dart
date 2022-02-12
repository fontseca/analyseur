import 'package:analyseur/screens/activities/new.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorPicker extends StatefulWidget {
  final Color color;
  final String colorName;
  final NewActivityState ref;

  ColorPicker(this.color, this.colorName, this.ref);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(25),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: this.widget.color,
          ),
        ),
        IconButton(
          splashRadius: 25,
          onPressed: () {
            widget.ref.selectColor(widget.colorName);
            Navigator.pop(context);
          },
          icon: Icon(null),
        ),
      ],
    );
  }
}