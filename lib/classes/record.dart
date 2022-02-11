import 'package:analyseur/classes/recordlog.dart';

class Record {
  late String id;
  late double totalDuration = 0;
  late List<RecordLog> recordLogs = [];
  RecordLog rl = new RecordLog();
  String activity;
  late DateTime date;

  Record(this.activity);

  void startLog() {
    date = DateTime.now();
    rl = new RecordLog();
    rl.start();
  }

  void finishLog() {
    rl.end();
    recordLogs.add(rl);
    _calculateTotalHours();
  }

  void _calculateTotalHours() {
    double duration = 0;
    recordLogs.forEach((rl) {
      duration += rl.duration();
    });
    totalDuration = duration;
  }

  String generateId() {
    String id;
    String d;
    String m;
    String y;
    d = DateTime.now().day < 10
        ? '0${DateTime.now().day.toString()}'
        : DateTime.now().day.toString();
    m = DateTime.now().month < 10
        ? '0${DateTime.now().month.toString()}'
        : DateTime.now().month.toString();
    y = DateTime.now().year.toString();

    id = '${this.activity.toLowerCase()}-$y-$m-$d';

    return id;
  }
}
