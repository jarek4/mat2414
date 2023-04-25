import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';

import '../widgets/report_data_table.dart';

class AddActivityDemo extends StatefulWidget {
  const AddActivityDemo({Key? key}) : super(key: key);

  @override
  State<AddActivityDemo> createState() => _AddActivityDemoState();
}

class _AddActivityDemoState extends State<AddActivityDemo> with TickerProviderStateMixin {
  late AnimationController _buttonSizeController;
  late AnimationController _shimmerController;

  late StreamController<int>? _dataStream;

  @override
  void initState() {
    super.initState();
    _dataStream = StreamController<int>.broadcast();
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();
    _buttonSizeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..forward();
    _buttonSizeController.addStatusListener((status) => _animationListener(status));
  }

  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _dataStream?.sink.add((Random().nextInt(5) + 1) + Random().nextInt(3));
    }
  }

  @override
  void dispose() {
    _buttonSizeController.dispose();
    _buttonSizeController.removeStatusListener((status) => _animationListener);
    _shimmerController.dispose();
    _dataStream?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.1),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: AnimatedBuilder(
            animation: _shimmerController,
            builder: (BuildContext context, Widget? child) {
              return Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: const [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
                    stops: [0.05, _shimmerController.value * 0.6, _shimmerController.value],
                    begin: const Alignment(-1.0, -0.3),
                    end: const Alignment(1.0, 0.3),
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: child,
              );
            },
            child: _buildAddText(),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          constraints: const BoxConstraints(maxHeight: 150, maxWidth: 350, minWidth: 300),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
          child: ReportDataTable(
            isMonthly: true,
            placements: _dataStream?.stream.map((v) => (v * 3 - 2).toString()),
            returnVisits: _dataStream?.stream.map((v) => (v + 2).toString()),
            time: _dataStream?.stream.map((v) => '$v:00'),
            videoShowings: _dataStream?.stream.map((v) => (v + Random().nextInt(3)).toString()),
          ),
        ),
      ]),
    );
  }

  Widget _buildAddText() {
    final smallStyle = context.labelMedium ?? const TextStyle().copyWith(fontSize: 14);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text(context.loc.addActivityNewActivity, style: smallStyle),
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (_buttonSizeController.isCompleted) {
            _buttonSizeController.reset();
            _buttonSizeController.forward();
          }
        },
        icon: AnimatedBuilder(
            animation: _buttonSizeController,
            builder: (BuildContext context, Widget? child) {
              var val = _buttonSizeController.value;
              return Icon(Icons.add_circle,
                  size: (val * 20) < 12 ? 12 : val * 18, color: context.colors.primary);
            }),
      ),
    ]);
  }
}
