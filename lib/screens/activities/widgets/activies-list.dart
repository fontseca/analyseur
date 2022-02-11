import 'package:analyseur/screens/activities/widgets/activity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  late List<Activity> activitiesToRender = [];
  // this data will come from the server
  List actData = [
    ['Coding', Color(0xFF1572A1)],
    ['Reading', Color(0xFFBB6464)],
    ['Walking', Color(0xFFC0D8C0)],
    ['Resting', Color(0xFFD3DEDC)],
    ['Studying', Color(0xFF6D8299)],
  ];

  @override
  void initState() {
    super.initState();
    int numberOfActivities = actData.length;
    int i;

    for (i = 0; i < numberOfActivities; ++i) {
      activitiesToRender.add(Activity(
        activityName: actData[i][0],
        activityColor: actData[i][1],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(children: [...activitiesToRender]),
    );
  }
}