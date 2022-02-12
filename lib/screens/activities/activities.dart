import 'package:analyseur/classes/activity.dart';
import 'package:analyseur/screens/activities/new.dart';
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

  void createNewAcitivity() {
    setState(() {
      this.actData.add(['Test', Colors.redAccent]);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
          itemCount: this.actData.length,
          itemBuilder: (BuildContext context, i) {
            return Activity(
              activityName: this.actData[i][0],
              activityColor: this.actData[i][1],
            );
          },
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
                      title: Text(
                        'New activity',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return NewActivity();
                          }),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.filter_alt_outlined),
                      title: Text(
                        'Filter activities',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text(
                        'Change order',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
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