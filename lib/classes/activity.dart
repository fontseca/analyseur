import 'package:analyseur/classes/record.dart';
import 'package:analyseur/screens/activities/dashboard.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
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
      // and start the logging the time of the activity
      widget.record.startLog();
      widget.activityRecords.add(widget.record);
    } else {
      existingRecord.startLog();
    }
  }

  void finishAcitivity() {
    widget.record.finishLog();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: EdgeInsets.all(7),

        // Title
        title: Text(
          widget.activityName,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),

        // Activity color
        leading: Badge(
          position: BadgePosition(
            top: 0,
            end: 0,
          ),
          badgeColor: Colors.green.shade300,
          elevation: 0,
          showBadge: _activityIsPlaying,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: this.widget.activityColor,
            ),
          ),
        ),

        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Wrap(
                children: [
                  ListTile(
                    leading: Icon(
                      _activityIsPlaying ? Icons.stop : Icons.play_arrow,
                      color: widget.activityColor,
                    ),
                    title: Text(
                      !_activityIsPlaying ? 'Start activity' : 'Stop activity',
                      style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
                    ),
                    onTap: () {
                      if (!_activityIsPlaying) {
                        this.startActivity();
                      } else {
                        this.finishAcitivity();
                      }
                      setState(() {
                        _activityIsPlaying = !_activityIsPlaying;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: widget.activityColor,
                    ),
                    title: Text('Edit activity', style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.bar_chart),
                    title: Text('Show dashboard', style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ActivityDashboard(this.widget);
                        }),
                      );
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
