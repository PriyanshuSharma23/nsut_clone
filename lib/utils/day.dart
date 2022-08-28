final weekdays = {
  0: 'Monday',
  1: 'Tuesday',
  2: 'Wednesday',
  3: 'Thursday',
  4: 'Friday',
  5: 'Saturday',
  6: 'Sunday',
};

final months = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

class Day {
  static todaysDay() {
    var now = DateTime.now();
    var day = now.weekday - 1;
    return weekdays[day];
  }

  static todaysDate() {
    var now = DateTime.now();

    final int date = now.day;
    final String month = months[now.month]!;
    final int year = now.year;

    return '$date-$month-$year';
  }

  static dayMonth() {
    var now = DateTime.now();
    final int date = now.day;
    final String month = months[now.month]!;
    return '$date $month';
  }

  static todaysDayIndex() {
    var now = DateTime.now();
    var day = now.weekday - 1;
    return day;
  }
}
