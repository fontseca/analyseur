import 'package:analyseur/models/record_model.dart';
import 'package:analyseur/views/activity/record_logs.dart';
import 'package:flutter/material.dart';

class RecordTileWidget extends StatelessWidget {
  final Record record;

  RecordTileWidget(this.record);

  @override
  Widget build(BuildContext context) {
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    String dayWeek = days[this.record.date.weekday - 1];
    String month = months[this.record.date.month - 1];
    String day = this.record.date.day.toString();
    double temp = this.record.totalDuration;
    double h = 0.0;
    double m = 0.0;
    double s = 0.0;

    h = temp - (temp % 1);

    temp = (temp % 1) * 60;
    m = temp - (m % 1);

    temp = (temp % 1) * 60;
    s = temp - (s % 1);

    String durationFormatted = '${h.toInt()}h ${m.toInt()}m';

    return ListTile(
      leading: Icon(Icons.schedule),
      title: Text(
        '$dayWeek',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1?.color,
        ),
      ),
      subtitle: Text('$month $day'),
      trailing: Text(durationFormatted),
      dense: true,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RecordLogsScreen(this.record.recordLogs, 'Test');
        }));
      },
    );
  }
}