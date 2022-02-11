import 'package:analyseur/classes/activity/record/record.dart';
import 'package:analyseur/helpers/sizes.dart';
import 'package:analyseur/screens/activity.dashboard/activity.dashboard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Activity extends StatefulWidget {
  final String activityName;
  final Color activityColor;

  Activity({required this.activityName, required this.activityColor});

  late String desc = '';
  late double total;
  late List<Record> activityRecords = [];
  late Record record;

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool _activityIsPlaying = false;

  void startActivity() {
    bool recordExists = false;
    late Record existingRecord;

    // if there are records
    if (widget.activityRecords.isNotEmpty) {
      // look for current day's record
      widget.activityRecords.forEach((record) {
        if (record.id == record.generateId()) {
          recordExists = true;
          existingRecord = record;
        }
      });
    }

    // if there are not records for the current day
    if (!recordExists) {
      // then create a new record
      widget.record = new Record(this.widget.activityName);
      widget.record.id = widget.record.generateId();
      print('Created \'${widget.record.id}\' record');
      // and start the logging the time of the activity
      print('Starting log for \'${widget.record.id}\'');
      widget.record.startLog();
      widget.activityRecords.add(widget.record);
    } else {
      print('Starting log for \'${existingRecord.id}\'');
      existingRecord.startLog();
    }
  }

  void finishAcitivity() {
    print('Finished log of \'${widget.record.id}\'');
    widget.record.finishLog();
  }

  void printactivityRecords() {
    if (widget.activityRecords.isEmpty) {
      print('NO ACTIVITY RECORDS YET\n');
      return;
    }
    widget.activityRecords.forEach((record) {
      print('PRINTING ACTIVITY RECORDS\n----------------');
      print('Total duration of \'${record.id}\': ${record.totalDuration}');
      print('Logs of \'${record.id}\'');
      record.recordLogs.forEach((rl) {
        print('\t ${rl.duration()} hours');
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(new Radius.circular(5.0)),
        border: Border.all(
          color: Color(0xFF242A38).withOpacity(0.05),
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          tileMode: TileMode.repeated,
          colors: [
            Theme.of(context).backgroundColor,
            this.widget.activityColor.withOpacity(0.1)
          ],
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(
          widget.activityName,
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   color: Theme.of(context).appBarTheme.foregroundColor,
          // ),
        ),
        hoverColor: Colors.transparent,
        dense: true,
        
        // Activity color
        leading: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(new Radius.circular(50.0)),
            color: this.widget.activityColor,
          ),
        ),

        // Open dashboard
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ActivityDashboard(this.widget);
              }),
            );
        },

        // Play activity
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).iconTheme.color,
          ),
          child: IconButton(
            tooltip: _activityIsPlaying ? 'Stop activity' : 'Start activity',
            splashRadius: 25,
            icon: Icon(
              _activityIsPlaying ? Icons.stop : Icons.play_arrow,
              color: _activityIsPlaying ? widget.activityColor : Theme.of(context).accentIconTheme.color,
            ),
            onPressed: () {
              if (!_activityIsPlaying) {
                this.startActivity();
              } else {
                this.finishAcitivity();
              }
              setState(() {
                _activityIsPlaying = !_activityIsPlaying;
              });
            },
          ),
        ),
        
      ),
    );
  }
}