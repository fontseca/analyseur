import 'package:analyseur/classes/activity/recordlog/recordlog.dart';
import 'package:analyseur/screens/activities/widgets/activity.dart';
import 'package:flutter/material.dart';

class ActivityDashboard extends StatefulWidget {
  final Activity act;

  ActivityDashboard(this.act);

  @override
  State<ActivityDashboard> createState() => _ActivityDashboardState();
}

class _ActivityDashboardState extends State<ActivityDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.act.activityName),
      ),
      body: ListView.builder(
        itemCount: widget.act.activityRecords.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              trailing: Text('${widget.act.activityRecords[index].totalDuration.toString()} hours'),
              title: Text(widget.act.activityRecords[index].id),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RecordLogs(
                    widget.act.activityRecords[index].recordLogs,
                    widget.act.activityName
                    );
                }));
              },
            ),
          );
        },
      ),
    );
  }
}

class RecordLogs extends StatelessWidget {
  final List<RecordLog> rlogs;
  final String title;

  RecordLogs(this.rlogs, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Records for $title')),
      body: ListView.builder(
        itemCount: this.rlogs.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            child: ListTile(
                title: Text(
                  'Started: ${this.rlogs[i].startDate.hour}:${this.rlogs[i].startDate.minute}:${this.rlogs[i].startDate.second}',
                  ),
                  subtitle: Text(
                  'Finished: ${this.rlogs[i].endDate.hour}:${this.rlogs[i].endDate.minute}:${this.rlogs[i].endDate.second}',
                  ),
                  trailing: Text('${this.rlogs[i].duration().toString()} hours'),
                ),
          );
        },
      ),
    );
  }
}
