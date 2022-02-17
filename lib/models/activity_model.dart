import 'package:analyseur/models/record_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activity {
  late String name;
  late Color color;
  late String description;
  late String category;
  late List<Record> activityRecords = [];
  late Record record;

  Activity({
    required this.name,
    required this.color,
    required this.description,
    required this.category,
  });
  

  void startActivity() {
    bool recordExists = false;
    late Record existingRecord;

    // if there are records
    if (activityRecords.isNotEmpty) {
      // look for current day's record
      activityRecords.forEach((record) {
        if (record.id == record.generateId()) {
          recordExists = true;
          existingRecord = record;
        }
      });
    }

    // if there are not records for the current day
    if (!recordExists) {
      // then create a new record
      record = new Record(name);
      record.id = record.generateId();
      // and start the logging the time of the activity
      record.startLog();
      activityRecords.add(record);
    } else {
      existingRecord.startLog();
    }
  }

  void finishAcitivity() {
    record.finishLog();
  }
}