import 'package:analyseur/classes/activity.dart';
import 'package:flutter/material.dart';
import 'package:analyseur/helpers/sizes.dart';

class ActivitiesScreen extends StatefulWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  late List<Activity> activitiesToRender = [];
  // this data will come from the server
  List actData = [
    ['Coding', Color(0xFF1572A1)],
    ['Reading', Color(0xFFBB6464)],
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
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(children: [...activitiesToRender]),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Activities'),
      actions: [
        IconButton(
          splashRadius: 25,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text('New activity', style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.filter_alt_outlined),
                      title: Text('Filter activities', style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text('Change order', style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color)),
                      onTap: () {},
                    )
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
