import 'package:analyseur/components/ui_record_tile.dart';
import 'package:analyseur/models/activity_model.dart';
import 'package:analyseur/views/activity/activity_chart.dart';
import 'package:flutter/material.dart';
import 'activity_information.dart';

class ActivityDashboardScreen extends StatefulWidget {
  final Activity act;

  ActivityDashboardScreen(this.act);

  @override
  State<ActivityDashboardScreen> createState() => _ActivityDashboardScreenState();
}

class _ActivityDashboardScreenState extends State<ActivityDashboardScreen> {
  List<RecordTileWidget> recordsList = [];

  @override
  void initState() {
    super.initState();
    widget.act.activityRecords.forEach((record) {
      recordsList.add(RecordTileWidget(record));
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
