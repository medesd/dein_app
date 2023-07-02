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

enum ScheduleType { Call, Calendar }
