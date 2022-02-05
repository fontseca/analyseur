class RecordLog {
  double _start = 0;
  double _end = 0;
  late DateTime startDate;
  late DateTime endDate;
  late List<String> notes;

  void start() {
    startDate = DateTime.now();
    _start = DateTime.now().millisecondsSinceEpoch.toDouble();
  }

  void end() {
    endDate = DateTime.now();
    _end = DateTime.now().millisecondsSinceEpoch.toDouble();
  }

  double duration() {
    double duration = _end - _start;
    duration /= 1000;
    return duration;
  }
}
