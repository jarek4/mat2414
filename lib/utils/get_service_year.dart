// this function is in CalendarDay model class. If change here - change the model class function!

/// service year start on 1-09-yyyy, end 31-08-yyyy+1
/// returns String startYear/endYear: 2022/2023
String getServiceYear(DateTime? date) {
  if (date == null) return '-E-';
  final int y = date.year;
  final int m = date.month;
  int startYear = y;
  int endYear = y;
  if (m <= 8) {
    startYear = startYear - 1;
  } else {
    endYear = endYear + 1;
  }
  return '$startYear/$endYear';
}
