import 'package:analyseur/classes/activity/record/record.dart';
import 'package:analyseur/helpers/sizes.dart';
import 'package:analyseur/screens/activity.dashboard/activity.dashboard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Activity extends StatelessWidget {
  final String activityName;
  final Color activityColor;
  late String desc = '';
  late double total;
  late List<Record> activityRecords = [];
  late Record record;

  Activity({required this.activityName, required this.activityColor});

  void startActivity() {
    bool recordExists = false;
    late Record existingRecord;

    // if there are records
    if (activityRecords.isNotEmpty) {
      // look for current day's record
      activityRecords.forEach((record) {
        if (record.id == record.generateId()) {
          recordExists = true;
          existingRecord = record;
        }
      });
    }

    // if there are not records for the current day
    if (!recordExists) {
      // then create a new record
      record = new Record(this.activityName);
      record.id = record.generateId();
      print('Created \'${record.id}\' record');
      // and start the logging the time of the activity
      print('Starting log for \'${record.id}\'');
      record.startLog();
      activityRecords.add(record);
    } else {
      print('Starting log for \'${existingRecord.id}\'');
      existingRecord.startLog();
    }
  }

  void finishAcitivity() {
    print('Finished log of \'${record.id}\'');
    record.finishLog();
  }

  void printactivityRecords() {
    if (activityRecords.isEmpty) {
      print('NO ACTIVITY RECORDS YET\n');
      return;
    }
    activityRecords.forEach((record) {
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: Container(
        height: getProportionateScreenHeight(80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(new Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
          border:
              Border.all(color: Color(0xFF242A38).withOpacity(0.10), width: 1),
          // color: Theme.of(context).backgroundColor,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.repeated,
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).backgroundColor,
                this.activityColor.withOpacity(0.1)
              ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Leading(
              this,
              activityName: this.activityName,
              activityColor: this.activityColor,
            ),
            Actions(this),
          ],
        ),
      ),
    );
  }
}

class Leading extends StatelessWidget {
  final String activityName;
  final Color activityColor;
  final Activity self;

  const Leading(this.self,
      {required this.activityName, required this.activityColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Settings
        MaterialButton(
          minWidth: 10,
          height: 40,
          visualDensity: VisualDensity.compact,
          shape: const CircleBorder(),
          onPressed: () {
            // Settings
            // print('Setting up ${this.activityName}');
            self.printactivityRecords();
          },
          child: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(new Radius.circular(50.0)),
            color: this.activityColor,
          ),
        ),
        Text(
          this.activityName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Actions extends StatefulWidget {
  final Activity self;

  Actions(this.self);

  @override
  _ActionsState createState() => _ActionsState();
}

class _ActionsState extends State<Actions> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          color: Theme.of(context).iconTheme.color,
          minWidth: 10,
          height: 40,
          visualDensity: VisualDensity.compact,
          shape: CircleBorder(),
          child: Icon(
            _isPlaying ? Icons.stop : Icons.play_arrow,
            color: _isPlaying
                ? widget.self.activityColor
                : Theme.of(context).accentIconTheme.color,
          ),
          onPressed: () {
            if (!_isPlaying) {
              widget.self.startActivity();
            } else {
              widget.self.finishAcitivity();
            }
            setState(() {
              _isPlaying = !_isPlaying;
            });
          },
        ),
        // Show dashboard
        MaterialButton(
          minWidth: 10,
          height: 35,
          visualDensity: VisualDensity.compact,
          shape: CircleBorder(),
          child: Icon(
            Icons.chevron_right,
            color: Theme.of(context).iconTheme.color,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ActivityDashboard(widget.self);
              }),
            );
          },
        ),
      ],
    );
  }
}
