import 'package:flutter/material.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../../utils/date_formatter.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({required this.onDatePicked, this.date, Key? key}) : super(key: key);

  final DateTime? date;
  final ValueChanged<DateTime?> onDatePicked;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String _setDate = 'today';
  DateTime _selectedDate = _now;

  static final DateTime _now = DateTime.now();

  @override
  void initState() {
    //_setDate = dateFormatter(_now);
    if (widget.date != null) {
      _selectedDate = widget.date ?? _now;
    }
    _setDate = dateFormatter(_selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = context.bodyMedium ?? const TextStyle();
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Chip(
        avatar: const Icon(Icons.calendar_month_outlined),
        label: Text(
          _setDate,
          style: textStyle,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        // locale: const Locale('en', 'GB'),
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(_now.year - 3),
        lastDate: DateTime(_now.year + 10),
        errorFormatText: 'Enter a valid date',
        errorInvalidText: 'Date out of range');
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _setDate = dateFormatter(_selectedDate);
      });
    }
    widget.onDatePicked(picked);
    return picked;
  }
}
