import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/constant_values.dart';
import 'package:mat2414/utils/date_formatter.dart' as utils;

/// data = List<int>[placements, videoShowings, returnVisits]. duration=Duration(hours: 1, minutes: 15)
class ActivitySimpleView extends StatelessWidget {
  const ActivitySimpleView({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Activity item;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    Color color = context.colors.primaryContainer;
    return Container(
      // height: 70.0,
      // minHeight:isEditable 69 : 38 !
      constraints: const BoxConstraints(minHeight: 40),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                      child: Text(
                          _makeDate(
                            context,
                            item.year,
                            item.month,
                            item.day,
                          )[0],
                          style: textTheme.labelMedium,
                          textAlign: TextAlign.center)),
                  const SizedBox(height: 2),
                  Center(
                      child: Text(_makeDate(context, item.year, item.month, item.day)[1],
                          style: textTheme.titleSmall, textAlign: TextAlign.center)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(AssetPath.imgMagazine512, height: 18),
                    const SizedBox(height: 2),
                    Center(
                      child: Text('${item.placements}',
                          style: textTheme.labelLarge, textAlign: TextAlign.center),
                    ),
                  ]),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(AssetPath.imgVideoCamera512, height: 18),
                    const SizedBox(height: 2),
                    Text('${item.videos}',
                        style: textTheme.labelLarge, textAlign: TextAlign.center),
                  ]),
            ),
            _buildHoursColumn(textTheme),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(AssetPath.imgTwoPersons512, height: 18),
                    const SizedBox(height: 2),
                    Text('${item.returnVisits}',
                        style: textTheme.labelLarge, textAlign: TextAlign.center),
                  ]),
            ),
          ]),
    );
  }

  Expanded _buildHoursColumn(TextTheme textTheme) {
    var imagePath = AssetPath.imgHourglass512;
    if (item.type == ActivityType.ldc) imagePath = AssetPath.icEngineer305;
    if (item.type == ActivityType.transferred) imagePath = AssetPath.icTimeTransfer;
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(imagePath, height: 18),
            const SizedBox(height: 2),
            Text(_makeTimeAsReadableString(item.hours, item.minutes),
                style: textTheme.labelLarge, textAlign: TextAlign.center),
          ]),
    );
  }

  List<String> _makeDate(BuildContext context, int year, int month, int day) {
    final String locale = Localizations.localeOf(context).toString();
    final Activity ea = ConstantValues.emptyActivity;
    final DateTime emptyActivityDate = DateTime(ea.year, ea.month, ea.day);
    final DateTime itemDate = DateTime(year, month, day);
    if (itemDate == emptyActivityDate) return <String>['***', '**'];
    final String d = utils.dateFormatter(DateTime(year, month, day), 'MMM,d', locale);
    return d.toUpperCase().split(',');
  }

  String _makeTimeAsReadableString(int h, int m) {
    final String hoursAndMinutes = Duration(hours: h, minutes: m).hoursAndMinutesString();
    if (hoursAndMinutes.startsWith('0')) {
      return hoursAndMinutes.substring(1);
    }
    return hoursAndMinutes;
  }
}
