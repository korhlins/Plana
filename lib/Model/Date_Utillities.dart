class DateUtillities {
  DateUtillities();

  List<String> getWeekdays() {
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
  }

  List<String> getMonths() {
    return [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
  }

  String getTimeFormat(int hours, int minutes) {
    return "${getHours(hours)} : ${getMinutes(minutes)} ${hours >= 12 ? "PM" : "AM"}";
  }

  String getHours(int hours) {
    if (hours == 0) return "00";
    if (hours > 12) {
      int a = hours - 12;
      if (a >= 10) {
        return a.toString();
      } else {
        return "0$a";
      }
    } else {
      if (hours >= 10) {
        return hours.toString();
      } else {
        return "0$hours";
      }
    }
  }

  String getMinutes(int minutes) {
    if (minutes == 0) return "00";
    if (minutes < 10) {
      return "0$minutes";
    }
    return minutes.toString();
  }

  String getDateFormat(int day, int month, int year) {
    return "$day-$month-$year";
  }
}
