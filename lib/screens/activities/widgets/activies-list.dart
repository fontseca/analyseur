import 'package:analyseur/screens/activities/widgets/activity.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        boxShadow: [BoxShadow(
          blurRadius: 4,
          spreadRadius: 0,
          color: Colors.black.withOpacity(0.10),
          offset: Offset(0, -4),
        )],
        color: Theme.of(context).accentColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Activities', style: TextStyle(fontSize: 24),),
                Row(
                  children: [
                    MaterialButton(
                      minWidth: 10,
                      height: 40,
                      visualDensity: VisualDensity.compact,
                      shape: CircleBorder(),
                      child: Icon(Icons.filter_alt),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      minWidth: 10,
                      height: 40,
                      visualDensity: VisualDensity.compact,
                      shape: CircleBorder(),
                      child: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
            ActivityList()
          ],
        ),
      ),
    );
  }
}

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Activity> [
        Activity(activityName: 'Coding', activityColor: Color(0xFFEEF2FF)),
        Activity(activityName: 'Reading', activityColor: Color(0xFFF0FDF4)),
        Activity(activityName: 'Walking', activityColor: Color(0xFFFEE2E2)),
        Activity(activityName: 'Resting', activityColor: Color(0xFFCCFBF1)),
        Activity(activityName: 'Studying', activityColor: Color(0xFFE0E7FF)),
      ],
    );
  }
}