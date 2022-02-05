class RecordLog {
  int _start = 0;
  int _end = 0;
  late DateTime startDate;
  late DateTime endDate;
  late List<String> notes;

  void start() {
    startDate = DateTime.now();
    _start = DateTime.now().millisecondsSinceEpoch;
  }

  void end() {
    endDate = DateTime.now();
    _end = DateTime.now().millisecondsSinceEpoch;
  }

  double duration() {
    double duration = (_end - _start) as double;
    duration /= 1000;
    return duration;
  }
}
