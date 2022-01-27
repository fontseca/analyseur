import 'dart:async';
import 'package:analyseur/helpers/sizes.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Location(),
            DigitalClock(),
            DateFormatted(),
            BuildDivider()
          ],
        ));
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Divider(
        color: Theme.of(context).accentColor,
    ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on, size: 16,),
        Text('León', style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  DigitalClockState createState() => DigitalClockState();
}

class DigitalClockState extends State<DigitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _timeOfDay.hour returns hours in 24h format in opposition to hourOfPeriod
            Text(
              '${_timeOfDay.hour}:${_timeOfDay.minute}',
              style: Theme.of(context).textTheme.headline1
            ),
            // SizedBox(width: 5),
            // RotatedBox(
            //   quarterTurns: 3,
            //   child: Text(
            //     _period,
            //     style: TextStyle(fontSize: getProportionateScreenWidth(18)),
            //   ),
            // )
          ],
        )
      ],
    );
  }
}

class DateFormatted extends StatelessWidget {
  const DateFormatted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    List<String> _days = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun'
    ];
    List<String> _months = [
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
    int _currentWeekDay = currentDate.weekday - 1;
    int _currentMonthIndex = currentDate.month - 1;
    String _currentDay = _days[_currentWeekDay];
    String _currentMonth = _months[_currentMonthIndex]; 
    String _formattedDate = '$_currentDay, $_currentMonth ${currentDate.day}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formattedDate
        )
      ],
    );
  }
}
