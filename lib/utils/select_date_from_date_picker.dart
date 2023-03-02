import 'package:flutter/material.dart';
// to remove!

Future<DateTime?> selectDate(BuildContext context, [DateTime? initial]) async {
  final DateTime initDate = initial ?? DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(initDate.year - 3),
      lastDate: DateTime(initDate.year + 10),
      errorFormatText: 'Enter a Valid Date',
      errorInvalidText: 'Date Out of Range');
/*  if (picked != null) {
    setState(() {
      _selectedDate = picked;
      _setDate = dateFormatter(_selectedDate);
    });
  }*/
  return picked;
}
