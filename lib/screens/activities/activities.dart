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
      body: SingleChildScrollView(child: Body()));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        // icon: SvgPicture.asset(
        //   'assets/icons/settings.svg',
        //   color: Theme.of(context).iconTheme.color,
        // ),
        icon: Icon(
          Icons.menu,
          size: 30,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications,
                color: Theme.of(context).accentIconTheme.color))
      ],
    );
  }
}
