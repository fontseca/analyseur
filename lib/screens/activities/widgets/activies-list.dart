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
    ['Coding', Color(0xFFEEF2FF)],
    ['Reading', Color(0xFFF0FDF4)],
    ['Walking', Color(0xFFFEE2E2)],
    ['Resting', Color(0xFFCCFBF1)],
    ['Studying', Color(0xFFE0E7FF)],
    ['Writing', Color(0xFFEEF2FF)],
    ['Watching TV', Color(0xFFF0FDF4)],
    ['Cooking', Color(0xFFFEE2E2)],
    ['Sleeping', Color(0xFFCCFBF1)],
    ['At the U', Color(0xFFE0E7FF)]
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
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Activities',
                  style: TextStyle(fontSize: 24),
                ),
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
            ...activitiesToRender,
          ],
        ),
      ),
    );
  }
}