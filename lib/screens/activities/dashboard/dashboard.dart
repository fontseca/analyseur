import 'package:analyseur/classes/record-item.dart';
import 'package:analyseur/classes/activity.dart';
import 'package:analyseur/screens/activities/dashboard/chart.dart';
import 'package:flutter/material.dart';
import 'activity-info.dart';

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
            recordTitle(),
            ...recordsList,
          ],
        ),
      ),
    );
  }

  Widget recordTitle() {
    if (widget.act.activityRecords.length > 0) {
      return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
        child: Text(
          'Records',
          style: TextStyle(
            fontSize: 20
          ),
        ),
      );
    } else {
      return Center(
        child: Text('No records yet. Play this activity to add a new record.'),
      );
    }
  }
}
