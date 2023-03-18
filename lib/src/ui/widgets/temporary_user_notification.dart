import 'dart:async';

import 'package:flutter/material.dart';

import 'animated_user_notification.dart';

class TemporaryUserNotification extends StatefulWidget {
  const TemporaryUserNotification({required this.text, this.milliSecDuration = 3000, Key? key})
      : super(key: key);

  final int milliSecDuration;
  final String text;

  @override
  State<TemporaryUserNotification> createState() => _TemporaryUserNotificationState();
}

class _TemporaryUserNotificationState extends State<TemporaryUserNotification> {
  Timer? _timer;
  String _text = '';

  @override
  void initState() {
    print('TemporaryUserNotification initState');
    super.initState();
    _text = widget.text;
    _runTimer();
  }

  void _runTimer() {
    _timer = Timer(const Duration(milliseconds: 3800), () {
      if (mounted) setState(() => _text = '');
    });
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _text.isNotEmpty ? AnimatedUserNotification(msg: _text) : const SizedBox();
  }
}
