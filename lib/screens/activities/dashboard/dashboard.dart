import 'package:analyseur/classes/record-item.dart';
import 'package:analyseur/classes/activity.dart';
import 'package:analyseur/screens/activities/dashboard/chart.dart';
import 'package:flutter/material.dart';
import 'info.dart';

class ActivityDashboard extends StatefulWidget {
  final Activity act;

  ActivityDashboard(this.act);

  @override
  State<ActivityDashboard> createState() => _ActivityDashboardState();
}

class _ActivityDashboardState extends State<ActivityDashboard> {
  List<RecordItem> recordsList = [];

  @override
  void initState() {
    super.initState();
    widget.act.activityRecords.forEach((record) {
      recordsList.add(RecordItem(record));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityInformation(widget.act),
            ActivityChart(widget.act),
            ...recordsList,
          ],
        ),
      ),
    );
  }
}
