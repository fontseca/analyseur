import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  final String activityName;
  const Activity({required this.activityName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.83),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Leading(activityName: this.activityName),
          Actions()
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_drop_down_circle)
        )
      ],
    );
  }
}

class Leading extends StatelessWidget {
  final String activityName;
  const Leading({required this.activityName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
        Container(
          color: Colors.pinkAccent,
        ),
        Text(this.activityName)
      ],
    );
  }
}
