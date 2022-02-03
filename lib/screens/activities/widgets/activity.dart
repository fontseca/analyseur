import 'package:analyseur/helpers/sizes.dart';
import 'package:analyseur/static/colors.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  final String activityName;
  final Color activityColor;

  const Activity({required this.activityName, required this.activityColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
          EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
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
                border: Border.all(color: Color(0xFF242A38).withOpacity(0.10), width: 1),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Leading(
                    activityName: this.activityName,
                    activityColor: this.activityColor,
                  ),
                  Actions()
            ],
          ),
        ),
      );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          minWidth: 10,
          height: 40,
          visualDensity: VisualDensity.compact,
          shape: const CircleBorder(
              side: BorderSide(color: kBodyTextColorLight, width: 1)),
          onPressed: () => {},
          child: const Icon(
            Icons.arrow_drop_down,
          ),
        ),
        MaterialButton(
          color: kBodyTextColorLight,
          minWidth: 10,
          height: 40,
          shape: const CircleBorder(
              side: BorderSide(color: kBodyTextColorLight, width: 1)),
          onPressed: () => {},
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Leading extends StatelessWidget {
  final String activityName;
  final Color activityColor;
  const Leading({required this.activityName, required this.activityColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          minWidth: 10,
          height: 40,
          visualDensity: VisualDensity.compact,
          shape: const CircleBorder(),
          onPressed: () => {},
          child: Icon(Icons.settings),
        ),
        Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(new Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 2)),
              ],
              color: this.activityColor),
        ),
        Text(
          this.activityName,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
