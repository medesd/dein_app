class ScheduleParser {
  int? user;
  ScheduleType? type;
  DateTime? date;

  ScheduleParser({
    this.user,
    this.type,
    this.date,
  });
}

// ignore_for_file: constant_identifier_names
enum ScheduleType { Call, Calendar }
