import 'package:analyseur/models/activity_model.dart';
import 'package:analyseur/sizes.dart';
import 'package:flutter/material.dart';

class ActivityInformation extends StatefulWidget {
  final Activity act;
  ActivityInformation(this.act);

  @override
  _ActivityInformationState createState() => _ActivityInformationState();
}

class _ActivityInformationState extends State<ActivityInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Color circle
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: widget.act.color,
                    ),
                  ),
                  // Name
                  Text(
                    widget.act.name,
                    style: TextStyle(fontSize: getProportionateScreenHeight(30)),
                  ),
                ],
              ),
              // Color code text
              Text(
                '0x${widget.act.color.value.toRadixString(16).toUpperCase()}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(widget.act.description),
          ),
        ],
      ),
    );
  }
}