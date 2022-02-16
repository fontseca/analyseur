import 'package:analyseur/classes/activity.dart';
import 'package:analyseur/helpers/sizes.dart';
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
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      width: double.infinity,
      height: getProportionateScreenHeight(200),
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
                    style: TextStyle(fontSize: getProportionateScreenWidth(30)),
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
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(6)),
            child: Text(
              widget.act.description.isEmpty
                  ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                  : widget.act.description,
              style: TextStyle(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}