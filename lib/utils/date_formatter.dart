import 'package:intl/intl.dart';

/// String pattern = 'yyyy-MM-dd' like 2013-04-20
String dateFormatter(DateTime date, [String pattern = 'yyyy-MM-dd']) {
  final DateFormat formatter = DateFormat(pattern);
  print('dateFormatter date: $date');
  print('dateFormatter formatter.format: ${formatter.format(date)}');
  return formatter.format(date);
}

// ICU Name                   Skeleton
// --------                   --------
// DAY                          d
// ABBR_WEEKDAY                 E
// WEEKDAY                      EEEE
// ABBR_STANDALONE_MONTH        LLL
// STANDALONE_MONTH             LLLL
// NUM_MONTH                    M
// NUM_MONTH_DAY                Md
// NUM_MONTH_WEEKDAY_DAY        MEd
// ABBR_MONTH                   MMM
// ABBR_MONTH_DAY               MMMd
// ABBR_MONTH_WEEKDAY_DAY       MMMEd
// MONTH                        MMMM
// MONTH_DAY                    MMMMd
// MONTH_WEEKDAY_DAY            MMMMEEEEd
// ABBR_QUARTER                 QQQ
// QUARTER                      QQQQ
// YEAR                         y
// YEAR_NUM_MONTH               yM
// YEAR_NUM_MONTH_DAY           yMd
// YEAR_NUM_MONTH_WEEKDAY_DAY   yMEd
// YEAR_ABBR_MONTH              yMMM
// YEAR_ABBR_MONTH_DAY          yMMMd
// YEAR_ABBR_MONTH_WEEKDAY_DAY  yMMMEd
// YEAR_MONTH                   yMMMM
// YEAR_MONTH_DAY               yMMMMd
// YEAR_MONTH_WEEKDAY_DAY       yMMMMEEEEd
// YEAR_ABBR_QUARTER            yQQQ
// YEAR_QUARTER                 yQQQQ
// HOUR24                       H
// HOUR24_MINUTE                Hm
// HOUR24_MINUTE_SECOND         Hms
// HOUR                         j
// HOUR_MINUTE                  jm
// HOUR_MINUTE_SECOND           jms
// HOUR_MINUTE_GENERIC_TZ       jmv
// HOUR_MINUTE_TZ               jmz
// HOUR_GENERIC_TZ              jv
// HOUR_TZ                      jz
// MINUTE                       m
// MINUTE_SECOND                ms
// SECOND                       s

/// minutesValue=18, output: 00:18
String getTimeString(int minutesValue) {
  final int hour = minutesValue ~/ 60;
  final int minutes = minutesValue % 60;
  return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
}


/// duration=Duration(hours: 2, minutes: 05), output: 02:05
String formatHoursAndMinutesDuration(Duration duration) {
  final String hours = duration.inHours.toString().padLeft(2, '0');
  final String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  // String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$hours:$minutes';
}
