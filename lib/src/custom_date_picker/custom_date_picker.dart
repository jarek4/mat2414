import 'package:flutter/cupertino.dart';
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
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return GestureDetector(
      onTap: () => isIos ? _selectIOSDate() : _selectAndroidDate(),
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

  Future<DateTime?> _selectAndroidDate() async {
    final DateTime? picked = await _showAndroidDatePicker();
    _updateState(picked);
    widget.onDatePicked(picked);
    return picked;
  }

  Future<DateTime?> _selectIOSDate() async {
    _showIOSDatePicker();
    widget.onDatePicked(_selectedDate);
    return _selectedDate;
  }

  void _updateState(DateTime? newDate) {
    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
        _setDate = dateFormatter(_selectedDate);
      });
    }
  }

/*  Future<DateTime?> _selectDate() async {
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
  }*/

  Future<DateTime?> _showAndroidDatePicker() async {
    return showDatePicker(
        context: context,
        // locale: const Locale('en', 'GB'),
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(_now.year + 10),
        errorFormatText: 'Enter a valid date',
        errorInvalidText: 'Date out of range');
  }

  Future<void> _showIOSDatePicker() async {
    await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  initialDateTime: _selectedDate,
                  minimumDate: DateTime(2015),
                  maximumDate: DateTime(_now.year + 10),
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  // called when the user changes the date.
                  onDateTimeChanged: (nd) {
                    _updateState(nd);
                  },
                  /* onDateTimeChanged: (DateTime newDate) {
                picked = newDate;
                setState(() {
                  // _selectedDate = newDate;
                  _setDate = dateFormatter(newDate);
                });
              },*/
                ),
              ),
            ));
  }
}
