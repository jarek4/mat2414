
Duration minutesToDuration(int min) {
  final hour = min ~/ 60;
  final  minutes = min % 60;
  return Duration(hours: hour, minutes: minutes);
}

/// returns array index 0: hours, index 1: minutes
List<int> minutesToHoursAndMin(int min) {
  final h = min ~/ 60;
  final  m = min % 60;
  return [h, m];
}

/// minAndHoursToDurationInMinutes(hours, minutes);
int minAndHoursToDurationInMinutes(int h, int min) {
  if(h < 1) return min;
  final hoursConvertedToMin = h * 60;
  return hoursConvertedToMin + min;
}

/// minutesValue=18, output: 00:18
String minutesDurationToFormattedString(int minutesValue, [bool startsWith0 = true]) {
  final int hour = minutesValue ~/ 60;
  final int minutes = minutesValue % 60;
  return '${hour.toString().padLeft(startsWith0 ? 2 : 1, "0")}:${minutes.toString().padLeft(2, "0")}';
}