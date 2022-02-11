import 'package:analyseur/screens/activities/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:analyseur/helpers/sizes.dart';

class ActivitiesScreen extends StatefulWidget {
  ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(child: Body()),
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
                      title: Text('New activity'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.filter_alt_outlined),
                      title: Text('Filter activities'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text('Change order'),
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
