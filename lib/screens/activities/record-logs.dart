import 'package:analyseur/classes/recordlog.dart';
import 'package:flutter/material.dart';

class RecordLogs extends StatelessWidget {
  final List<RecordLog> rlogs;
  final String title;

  RecordLogs(this.rlogs, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Record logs history')),
      body: ListView.builder(
        itemCount: this.rlogs.length,
        itemBuilder: (BuildContext context, int i) {
          String sH = this.rlogs[i].startDate.hour.toString();
          String sM = this.rlogs[i].startDate.minute.toString();
          String sS = this.rlogs[i].startDate.second.toString();
          String start = '$sH°$sM\'$sS\'\'';

          String eH = this.rlogs[i].endDate.hour.toString();
          String eM = this.rlogs[i].endDate.minute.toString();
          String eS = this.rlogs[i].endDate.second.toString();
          String end = '$eH°$eM\'$eS\'\'';

          double temp = this.rlogs[i].duration();
          double h = 0.0;
          double m = 0.0;
          double s = 0.0;

          h = temp - (temp % 1);

          temp = (temp % 1) * 60;
          m = temp - (m % 1);

          temp = (temp % 1) * 60;
          s = temp - (s % 1);

          return Card(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: ListTile(
              dense: true,
              title: Text(
                'At $start',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
              trailing: Text('${h.toInt()}h ${m.toInt()}m ${s.toInt()}s'),
            ),
          );
        },
      ),
    );
  }
}