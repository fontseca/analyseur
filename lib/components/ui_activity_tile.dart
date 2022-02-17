import 'package:analyseur/models/activity_model.dart';
import 'package:analyseur/views/activity/activity_dashboard.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ActivityTileWidget extends StatefulWidget {
  final Activity activity;

  ActivityTileWidget({required this.activity});

  @override
  _ActivityTileWidgetState createState() => _ActivityTileWidgetState();
}

class _ActivityTileWidgetState extends State<ActivityTileWidget> {
  bool _activityIsPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: EdgeInsets.all(7),
        
        // Title
        title: Text(
          this.widget.activity.name,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),

        trailing: IconButton(
          splashRadius: 25,
          icon: Icon(_activityIsPlaying ? Icons.stop : Icons.play_arrow),
          onPressed: () {
            if (!_activityIsPlaying) {
              this.widget.activity.startActivity();
            } else {
              this.widget.activity.finishAcitivity();
            }
            setState(() {
              _activityIsPlaying = !_activityIsPlaying;
            });
          },
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
              color: widget.activity.color,
            ),
          ),
        ),

        // Show dashboard
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ActivityDashboard(widget.activity);
            }),
          );
        },

        // Edit activity
        onLongPress: () {
          _openModalBottomSheet(context);
        },
      ),
    );
  }

  void _openModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(
                Icons.edit,
                color: widget.activity.color,
              ),
              title: Text(
                'Edit activity',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1?.color),
              ),
              onTap: () {
                // widget.activity.edit;
              },
            ),
          ],
        );
      },
    );
  }
}
