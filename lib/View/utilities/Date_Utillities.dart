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
    String getHours(int hours) {
      if (hours == 0) return "00";
      if (hours > 12) {
        int a = hours - 12;
        return (a >= 10) ? a.toString() : "0$a";
      } else {
        return hours >= 10 ? hours.toString() : "0$hours";
      }
    }

    String getMinutes(int minutes) {
      if (minutes == 0) return "00";
      return minutes < 10 ? "0$minutes" : minutes.toString();
    }

    return "${getHours(hours)} : ${getMinutes(minutes)} ${hours >= 12 ? "PM" : "AM"}";
  }

  String getDateFormat(int day, month, year) {
    String getDay(int day) {
      return day < 10 ? "0$day" : day.toString();
    }

    String getMonth(int month) {
      return month < 10 ? "0$month" : month.toString();
    }

    String getYear(int year) {
      return year == 0 ? "0$year" : year.toString();
    }

    return "${getDay(day)}-${getMonth(month)}-${getYear(year)}";
  }
}
