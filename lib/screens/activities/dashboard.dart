import 'package:analyseur/classes/record.dart';
import 'package:analyseur/classes/recordlog.dart';
import 'package:analyseur/helpers/sizes.dart';
import 'package:analyseur/classes/activity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ActivityDashboard extends StatefulWidget {
  final Activity act;

  ActivityDashboard(this.act);

  @override
  State<ActivityDashboard> createState() => _ActivityDashboardState();
}

class _ActivityDashboardState extends State<ActivityDashboard> {
  List<RecordItem> recordsList = [];

  @override
  void initState() {
    super.initState();
    widget.act.activityRecords.forEach((record) {
      recordsList.add(RecordItem(record));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityInformation(widget.act),
            ActivityChart(widget.act),
            ...recordsList,
          ],
        ),
      ),
    );
  }
}

class RecordItem extends StatelessWidget {
  final Record record;

  RecordItem(this.record);

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
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
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

    return Container(
      child: ListTile(
        title: Text('$dayWeek', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$month $day'),
        trailing: Text(durationFormatted),
        tileColor: Theme.of(context).accentColor,
        dense: true,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RecordLogs(this.record.recordLogs, 'Test');
          }));
        },
      ),
    );
  }
}

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

class RecordLogs extends StatelessWidget {
  final List<RecordLog> rlogs;
  final String title;

  RecordLogs(this.rlogs, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Records for $title')),
      body: ListView.builder(
        itemCount: this.rlogs.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            child: ListTile(
              title: Text(
                'Started: ${this.rlogs[i].startDate.hour}:${this.rlogs[i].startDate.minute}:${this.rlogs[i].startDate.second}',
              ),
              subtitle: Text(
                'Finished: ${this.rlogs[i].endDate.hour}:${this.rlogs[i].endDate.minute}:${this.rlogs[i].endDate.second}',
              ),
              trailing: Text('${this.rlogs[i].duration().toString()} hours'),
            ),
          );
        },
      ),
    );
  }
}

class ActivityChart extends StatefulWidget {
  final Activity self;

  ActivityChart(this.self);

  @override
  _ActivityChartState createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  @override
  Widget build(BuildContext context) {
    final List<WeekRecordPoint> weekData = [];

    @override
    void initState() {
      widget.self.activityRecords.forEach((record) {
        DateTime rd = record.date;
        DateTime dateRecordToPoint =
            DateTime(rd.year, rd.month, rd.day, 0, 0, 0);
        weekData.add(WeekRecordPoint(dateRecordToPoint, record.totalDuration));
      });
    }

    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(250),
      child: SfCartesianChart(
        // Duration
        primaryYAxis: NumericAxis(
          axisLine: AxisLine(
            width: 0,
          ),
          labelStyle: TextStyle(fontSize: 10),
          minimum: 0,
          maximum: 12,
          interval: 2,
          labelFormat: '{value}h',
          // title: AxisTitle(text: 'Duration (hrs)'),
        ),

        // Date
        primaryXAxis: DateTimeAxis(
          majorGridLines: MajorGridLines(
            width: 0,
          ),
          minimum: DateTime(2022, 2, (DateTime.now().day - 6)),
          maximum: DateTime.now(),
          interval: 1,
          // title: AxisTitle(text: 'Last week'),
          dateFormat: DateFormat('EEE').add_d(),
          labelRotation: -10,
          labelAlignment: LabelAlignment.center,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
          axisLine: AxisLine(
            width: 0,
          ),
        ),

        // Plot
        series: <ChartSeries>[
          LineSeries<WeekRecordPoint, DateTime>(
              dataSource: weekData,
              xValueMapper: (WeekRecordPoint record, _) => record.weekday,
              yValueMapper: (WeekRecordPoint record, _) => record.duration,
              color: Theme.of(context).primaryColor,
              width: 1,
              markerSettings: MarkerSettings(
                isVisible: true,
                height: 4,
                width: 4,
                shape: DataMarkerType.circle,
                borderWidth: 3,
                borderColor: Colors.black,
              ),
              enableTooltip: true,
              onRendererCreated: (ChartSeriesController controller) {
                initState();
              }),
        ],
      ),
    );
  }
}

class WeekRecordPoint {
  final DateTime weekday;
  final double duration;
  WeekRecordPoint(this.weekday, this.duration);
}
