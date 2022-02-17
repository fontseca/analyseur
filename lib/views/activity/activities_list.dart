import 'package:analyseur/components/ui_activity_tile.dart';
import 'package:analyseur/models/activity_model.dart';
import 'package:analyseur/views/activity/create_activity.dart';
import 'package:flutter/material.dart';
import 'package:analyseur/sizes.dart';

class ActivitiesScreen extends StatefulWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  // late List<Activity> activitiesToRender = [];
  // this data will come from the server
  List<Activity> databaseSimulationData = [
    Activity(
      name: 'Coding',
      color: Color(0xFF1572A1),
      description: 'Coding my future',
      category: 'Others',
    ),
  ];

  List<ActivityTileWidget> activitiesToRender = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < databaseSimulationData.length; ++i) {
      activitiesToRender.add(
        ActivityTileWidget(
          activity: Activity(
            name: this.databaseSimulationData[i].name,
            color: this.databaseSimulationData[i].color,
            description: this.databaseSimulationData[i].description,
            category: this.databaseSimulationData[i].category,
          ),
        ),
      );
    }
    print(activitiesToRender);
  }

  void _createNewActivity(BuildContext context) async {
    final Activity res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateActivityScreen()),
    );
    setState(() {
      activitiesToRender.add(
        ActivityTileWidget(
          activity: Activity(
            name: res.name,
            color: res.color,
            description: res.description,
            category: res.category,
          ),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context, this),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
        itemCount: this.activitiesToRender.length,
        itemBuilder: (BuildContext context, i) {
          return activitiesToRender[i];
        },
      ),
    );
  }

  AppBar buildAppBar(
    BuildContext context,
    _ActivitiesScreenState self,
  ) {
    return AppBar(
      title: Text('Activities'),
      actions: [
        IconButton(
          splashRadius: 25,
          icon: Icon(Icons.add),
          onPressed: () {
            self._createNewActivity(context);
          },
        ),
        IconButton(
          splashRadius: 25,
          icon: Icon(Icons.more_vert),
          onPressed: () {
            showModalBottomSheetUI(context, self);
          },
        ),
      ],
    );
  }

  void showModalBottomSheetUI(
      BuildContext context, _ActivitiesScreenState self) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
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
  }
}
