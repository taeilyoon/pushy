
import 'package:intl/intl.dart';

DateTime get today => DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
);

extension DateToString on DateTime {
  DateTime get removeHour => DateTime(year, month, day);

  String get toYYMMDD {
    return DateFormat("yyyy.MM.dd.").format(this);
  }

  String get toYYMMDDHHMM {
    return DateFormat("yyyy.MM.dd. HH:mm").format(this);
  }

  String get toHHMM {
    if (this.isAfter(DateUtil.today)) {
      return DateFormat("HH:mm").format(this.toLocal());
    } else {
      return DateFormat("MM.dd HH:mm").format(this.toLocal());
    }
  }

  String get toYYMMDash => DateFormat("yyyy-MM-dd").format(this);
}

extension DateUtil on DateTime {
  static DateTime get today {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  bool isSameOrAfter(DateTime other) {
    if (isAfter(other) || isAtSameMomentAs(other)) {
      return true;
    } else {
      return false;
    }
  }

  bool isSameOrBefore(DateTime other) {
    if (isBefore(other) || isAtSameMomentAs(other)) {
      return true;
    } else {
      return false;
    }
  }
}
