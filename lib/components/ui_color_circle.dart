import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActivityColorCircleWidget extends StatefulWidget {
  final Color color;
  final String colorName;
  final dynamic ref;

  ActivityColorCircleWidget(this.color, this.colorName, this.ref);

  @override
  _ActivityColorCircleWidgetState createState() => _ActivityColorCircleWidgetState();
}

class _ActivityColorCircleWidgetState extends State<ActivityColorCircleWidget> {
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