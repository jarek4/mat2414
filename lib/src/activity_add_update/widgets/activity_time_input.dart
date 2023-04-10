import 'package:flutter/material.dart';
import 'package:mat2414/src/activity_add_update/widgets/widgets.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

import '../add_update_state.dart';

class ActivityTimeInput extends StatelessWidget {
  const ActivityTimeInput({Key? key}) : super(key: key);

  /// minutes multiplier. If 5 minutes in Dropdown are: 0, 5, 10, 15,... 60
  /// minutes max is 60. Prefer minMultipliers: 1, 5, 10, 15
  static const int minMultiplier = 5;

  static const double _h = 36.0;
  static const double _minW = 180.0;
  static const double _maxW = 380.0;

  static int _validMultiplier(int m) {
    if (m < 1) return 1;
    if (m > 60) return 5;
    return m;
  }

  static int _validateMinCount(int m) {
    if (m < 1) m = 1;
    if (m > 60) m = 5;
    final int valid = (60 - (60 % m)) ~/ m;
    return valid;
  }

  static List<int> val() => List<int>.generate(25, (index) => index);

  static List<int> valMin(int multi) => List<int>.generate(_validateMinCount(multi) + 1,
      (index) => index == 0 ? index : (index * _validMultiplier(multi)));

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints:
          const BoxConstraints(minHeight: _h - 2, minWidth: _minW, maxWidth: _maxW, maxHeight: _h),
      padding: const EdgeInsets.only(right: 3),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: context.colors.surface),
      child: Row(children: [
        InputLeading(child: Image.asset(AssetPath.imgHourglass512)),
        Expanded(
          flex: 7,
          child: Row(children: [
            _buildFieldName(context),
            const VerticalDivider(indent: 4.0, endIndent: 4.0, thickness: 0.8, width: 4),
            // shows current value from hours and minutes inputs fields
            _buildShowInputValue(),
          ]),
        ),
        // separated inputs for hours and minutes values
        Expanded(
          flex: 3,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            _buildHoursField(),
            Text(' : ', style: context.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
            _buildMinutesField(),
          ]),
        ),
      ]),
    );
  }

  Widget _buildFieldName(BuildContext context) {
    final TextStyle? style = context.bodySmall;
    return Expanded(
      flex: 5,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(context.loc.generalTime,
              style: style, overflow: TextOverflow.fade, maxLines: 1, softWrap: false)),
    );
  }
  Widget _buildShowInputValue() {
    return Expanded(
      flex: 2,
      child: Selector<AddUpdateState, String>(
          selector: (_, state) => '${state.h}:${state.min.toString().padLeft(2, '0')}',
          shouldRebuild: (String pre, String next) {
            return pre != next;
          },
          builder: (BuildContext context, time, __) {
            return InputValueWidget(value: time);
          }),
    );
  }

  Widget _buildHoursField() {
    return Selector<AddUpdateState, int>(
        selector: (_, state) => state.h,
        shouldRebuild: (int pre, int next) {
          return pre != next;
        },
        builder: (BuildContext context, hours, __) {
          return ActivityDropdown(
            items: val(),
            value: hours,
            onChangeHandle: (int? h) => context.read<AddUpdateState>().onHoursChange(h),
          );
        });
  }

  Widget _buildMinutesField() {
    return Selector<AddUpdateState, int>(
        selector: (_, state) => state.min,
        shouldRebuild: (int pre, int next) {
          return pre != next;
        },
        builder: (BuildContext context, minutes, __) {
          return ActivityDropdown(
            items: valMin(minMultiplier),
            value: minutes,
            onChangeHandle: (int? m) => context.read<AddUpdateState>().onMinutesChange(m),
          );
        });
  }


}
