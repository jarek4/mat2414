import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../../utils/date_formatter.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String _setDate = '';
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    _setDate = dateFormatter(DateTime.now());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose Date',
              style: context.textTheme.titleLarge),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: FittedBox(child: Text(_setDate, style: context.textTheme.titleLarge)),
            ),
          ]),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050),
        errorFormatText: 'Enter a Valid Date',
        errorInvalidText: 'Date Out of Range');
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _setDate = dateFormatter(_selectedDate);
      });
    }
    return picked;
  }
}
