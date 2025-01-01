

import 'package:intl/intl.dart';

class DateUtils {
  // Function to format a DateTime object into a desired string format
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(date);
  }

  // Function to parse a string to DateTime
  static DateTime parseDate(String dateString, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).parse(dateString);
  }

  // Function to get the current date in the desired format
  static String getCurrentDate({String format = 'yyyy-MM-dd'}) {
    DateTime now = DateTime.now();
    return formatDate(now, format: format);
  }

  // Function to get the difference in days between two dates
  static int getDaysDifference(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inDays;
  }

  // Function to check if a given date is in the future
  static bool isFutureDate(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  // Function to check if a given date is in the past
  static bool isPastDate(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  // Function to add days to a given date
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  // Function to subtract days from a given date
  static DateTime subtractDays(DateTime date, int days) {
    return date.subtract(Duration(days: days));
  }

  // Function to get the start of the day (00:00:00)
  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // Function to get the end of the day (23:59:59)
  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
}
