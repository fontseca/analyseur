import 'package:analyseur/classes/activity.dart';
import 'package:analyseur/classes/week-record-point.dart';
import 'package:analyseur/helpers/sizes.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart'; // For DateFormat

class ActivityChart extends StatefulWidget {
  final Activity self;

  ActivityChart(this.self);

  @override
  _ActivityChartState createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  @override
  Widget build(BuildContext context) {
    final List<WeekRecordPoint> weekData = [
      // WeekRecordPoint(DateTime(2022, 2, 9), 1),
      // WeekRecordPoint(DateTime(2022, 2, 10), 2),
      // WeekRecordPoint(DateTime(2022, 2, 11), 3),
      // WeekRecordPoint(DateTime(2022, 2, 12), 5),
      // WeekRecordPoint(DateTime(2022, 2, 13), 2),
      // WeekRecordPoint(DateTime(2022, 2, 14), 3.5),
      // WeekRecordPoint(DateTime(2022, 2, 15), 12.344),
    ];

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
          // maximum: 12,
          // interval: 2,
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
              color: widget.self.color.withOpacity(0.5),
              width: 0.5,
              markerSettings: MarkerSettings(
                isVisible: true,
                height: 1,
                width: 1,
                borderColor: widget.self.color,
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