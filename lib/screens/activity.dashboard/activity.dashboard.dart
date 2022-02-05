import 'package:analyseur/classes/activity/record/record.dart';
import 'package:analyseur/classes/activity/recordlog/recordlog.dart';
import 'package:analyseur/helpers/sizes.dart';
import 'package:analyseur/screens/activities/widgets/activity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityDashboard extends StatefulWidget {
  final Activity act;

  ActivityDashboard(this.act);

  @override
  State<ActivityDashboard> createState() => _ActivityDashboardState();
}

class _ActivityDashboardState extends State<ActivityDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityInformation(widget.act),
          ActivityChart(widget.act),
          // Records
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            child: Text(
              'Records',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: getProportionateScreenHeight(100),
            child: RecordsList(widget.act.activityRecords),
          ),
        ],
      ),
    );
  }
}

class RecordsList extends StatelessWidget {
  final List<Record> activityRecords;

  RecordsList(this.activityRecords);

  @override
  Widget build(BuildContext context) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

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

    return ListView.builder(
      itemCount: this.activityRecords.length,
      itemBuilder: (BuildContext context, int index) {
        String recordDate =
            '${days[this.activityRecords[index].date.weekday - 1]} ${this.activityRecords[index].date.day}, ${months[this.activityRecords[index].date.month - 1]}';
        double h = this.activityRecords[index].totalDuration;
        double m = this.activityRecords[index].totalDuration * 60;
        double s = m * 60;

        h = h.roundToDouble();
        m = m.roundToDouble();
        s = s.roundToDouble();

        String durationFormatted = '$h h $m m $s s';

        return Container(
          child: ListTile(
            title: Text(
              recordDate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(durationFormatted),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RecordLogs(this.activityRecords[index].recordLogs,
                    'this.act.activityName');
              }));
            },
          ),
        );
      },
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
      padding: EdgeInsets.all(getProportionateScreenWidth(16)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            widget.act.activityColor,
          ],
        ),
      ),
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
                      color: widget.act.activityColor,
                    ),
                  ),
                  // Name
                  Text(
                    widget.act.activityName,
                    style: TextStyle(fontSize: getProportionateScreenWidth(30)),
                  ),
                ],
              ),
              // Color code text
              Text(
                '0x${widget.act.activityColor.value.toRadixString(16).toUpperCase()}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(16)),
            child: Text(
              widget.act.desc.isEmpty
                  ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                  : widget.act.desc,
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
    final List<SalesData> chartData = [
      SalesData(DateTime(2010), 35),
      SalesData(DateTime(2011), 28),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 40)
    ];

    return Container(
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(),
        series: <ChartSeries>[
          // Renders line chart
          LineSeries<SalesData, DateTime>(
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final DateTime year;
  final double sales;

  SalesData(this.year, this.sales);
}
