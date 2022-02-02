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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    )
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
  const ActivityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Activity(activityName: 'Coding'),
        Activity(activityName: 'Reading'),
        Activity(activityName: 'Walking'),
        Activity(activityName: 'Coding'),
        Activity(activityName: 'Reading'),
        Activity(activityName: 'Walking'),
        Activity(activityName: 'Coding')
      ],
    );
  }
}