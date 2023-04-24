import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Matt 24: 14';

  @override
  String get addActivityAddRemarksBtn => 'Add remarks';

  @override
  String get addActivityBtnNotSavedNotification => 'Not saved';

  @override
  String get addActivityBtnSavedNotification => 'Activity was saved';

  @override
  String get addActivityEmptyError => 'The activity is empty. It won\'t be saved!';

  @override
  String get addActivityNewActivity => 'New activity';

  @override
  String get addActivityNoChangesMadeError => 'No changes were made';

  @override
  String get addActivityNotCreatedError => 'Not created. Ups';

  @override
  String get addNewActivityBtn => 'Add new activity';

  @override
  String get databaseNoPermission => 'No permission to access local storage';

  @override
  String get databaseNotOpened => 'Database is not opened';

  @override
  String get dialogMakeChanges => 'Do you want to change something?';

  @override
  String get dialogWantToDelete => 'Are you sure you want to delete it?';

  @override
  String get dialogWantToSave => 'Do you want to save changes?';

  @override
  String get generalBibleStudies => 'Bible studies';

  @override
  String get generalBusinessTerritoryWitnessing => 'Business territory witnessing';

  @override
  String get generalCancel => 'Cancel';

  @override
  String get generalDate => 'Date';

  @override
  String get generalDay => 'Day';

  @override
  String get generalDelete => 'Delete';

  @override
  String get generalEdit => 'Edit';

  @override
  String get generalError => 'Error';

  @override
  String get generalEveningWitnessing => 'Evening witnessing';

  @override
  String get generalForMoreInfoSeeHelp => 'For more information see More/Settings/Help';

  @override
  String get generalGroupWitnessing => 'Group witnessing';

  @override
  String generalHour(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Hour',
      two: 'Hours',
      other: 'Hours',
    );
  }

  @override
  String get generalInformalWitnessing => 'Informal witnessing';

  @override
  String get generalLDCHours => 'LDC Hours';

  @override
  String generalMinute(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Minute',
      two: 'Minutes',
      other: 'Minutes',
    );
  }

  @override
  String get generalNo => 'No';

  @override
  String get generalOnlyInEnglish => 'Sorry, this section is in English only.';

  @override
  String get generalPlacements => 'Placements';

  @override
  String get generalPublicWitnessing => 'Public witnessing';

  @override
  String get generalRemarks => 'Remarks';

  @override
  String get generalReturnVisits => 'Return visits';

  @override
  String get generalServiceYear => 'Service year';

  @override
  String get generalSkip => 'Skip';

  @override
  String get generalStart => 'Start';

  @override
  String get generalSundayWitnessing => 'Sunday witnessing';

  @override
  String get generalTime => 'Time';

  @override
  String get generalUsername => 'Name';

  @override
  String get generalVideoShowings => 'Video showings';

  @override
  String get generalYear => 'Year';

  @override
  String get generalYes => 'Yes';

  @override
  String get helpBibleStudies => 'The total number of different Bible studies conducted during the month is determined in the preparation of the monthly report. This value will be saved and will appear as the default value the next month. You can change it.';

  @override
  String get helpClosingReport => 'It means to prepare a monthly report and record this value. This action cannot be undone! You can only delete the report. After deletion, it can be created again and saved again. To do this, just set the selected month in the calendar and press the Close report button. Earlier you can edit notes and amount of bible studies. Only the value of a closed report can be copied. Only closed reports are visible in the history.';

  @override
  String get helpLdcHours => 'Time contributed at a construction site or other theocratic project. This is not time spent in field service and is not counted in the Hours column. The value for the whole month is given in the remarks. If you don\'t need this option, you can turn it off (it\'s off by default).';

  @override
  String get helpLdcHoursDescription => 'You may want to describe or name your activities as a volunteer in more detail. This description will override the default value.';

  @override
  String get helpServiceTimePrecision => 'Decide how accurately the time will be recorded. For example, you can select every 5 minutes or every half hour. Default set to 5 minutes.';

  @override
  String homeHello(String name) {
    return 'Hello $name!';
  }

  @override
  String get homeNoActivities => 'No activities';

  @override
  String get homeTodayIs => 'Today is';

  @override
  String get homeYorLastActivities => 'Your last activities:';

  @override
  String get ldcHoursToolTip => 'Mark if this is not the time spent in the field service. These hours will be saved in remarks';

  @override
  String get onBoardingCanAddNameLater => 'You can add your name later';

  @override
  String get onBoardingContinueWithoutName => 'Do you want to proceed without a name?';

  @override
  String get onBoardingInfo => 'Record your each service. At the end of the month, create a personal service report. You can add remarks. You may find the LDC hours option useful.';

  @override
  String get onBoardingRateApp => 'Rate the app and tell your friends!';

  @override
  String get onBoardingVisitHelp => 'We encourage you to familiarize yourself with the Help section in the application.';

  @override
  String get onBoardingYourName => 'Your name';

  @override
  String get rateAppBtnLater => 'Remind me later';

  @override
  String get rateAppBtnNow => 'Rate it now';

  @override
  String get rateAppContent => 'If you enjoy using mat2414, would you mind taking a moment to rate it? Thanks for your support!';

  @override
  String get rateAppTitle => 'How are we doing?';

  @override
  String get reportBibleStudiesToolTipWidgetText => 'Use arrows to increase or decrease bible studies quantity. The number you set will be shown next month';

  @override
  String get reportCloseReportBtn => 'Close Report';

  @override
  String get reportCopyReportBtn => 'Copy Report';

  @override
  String get reportCopyReportToolTipWidgetText => 'You cannot undo closing the month! You will also not be able to make changes';

  @override
  String get reportDecreaseBibleStudiesBtnToolTip => 'Decrease bible studies quantity';

  @override
  String get reportErrorRefreshBtn => 'Error. Tap here to refresh';

  @override
  String get reportIncreaseBibleStudiesBtnToolTip => 'Increase bible studies quantity';

  @override
  String get reportReportWasCopied => 'Report was copied';

  @override
  String get screenDetail => 'Detail';

  @override
  String get screenHome => 'Home';

  @override
  String get screenMore => 'More';

  @override
  String get settingsAuto => 'Auto';

  @override
  String get settingsContactDev => 'Contact with developer';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsMinutesPrecision => 'Service time precision in minutes';

  @override
  String get settingsMinutesPrecisionExample => 'e.g. 0:05 or 0:30';

  @override
  String get settingsRateApp => 'Rate the app';

  @override
  String get settingsSelectStatistics => 'Select statistics you want to see';

  @override
  String get settingsSetAnnualHourGoal => 'Set annual hour goal';

  @override
  String get settingsSetAvatar => 'Your avatar';

  @override
  String get settingsSetLdcDescription => 'Set custom description for LDC hours in month report remarks';

  @override
  String get settingsSetMonthlyHourGoal => 'Set monthly hour goal';

  @override
  String get settingsSettings => 'Settings';

  @override
  String get settingsShowLDCHours => 'Show LDC hours button';

  @override
  String get settingsShowTips => 'Show tips';

  @override
  String get settingsSystem => 'System';

  @override
  String get settingsThemeDarkTheme => 'Dark Theme';

  @override
  String get settingsThemeLightTheme => 'Light Theme';

  @override
  String get settingsThemeMode => 'Theme Mode';

  @override
  String get settingsThemeSystemTheme => 'System Theme';

  @override
  String get settingsUpdateUsername => 'Username';

  @override
  String get statisticsHowManyTimes => 'times';

  @override
  String get tabActivity => 'Activity';

  @override
  String get tabHistory => 'History';

  @override
  String get tabReport => 'Report';

  @override
  String get tabSettings => 'Settings';

  @override
  String get tabStatistics => 'Statistics';

  @override
  String get historyClosedMonthsVisible => 'Only closed months are visible';

  @override
  String get reportCopyToClipboard => 'Copy the text of the report to the clipboard';

  @override
  String dialogDeleteReportTransferredMinutesActivityWillBeDeleted(int number) {
    return 'This report has transferred $number minutes to the next month as an activity. This activity will be deleted!';
  }

  @override
  String dialogCreateReportTransferredMinutes(int number) {
    return '$number minutes where transferred to the next month';
  }

  @override
  String dialogCreateReportTransferredMinutesWarning(int number) {
    return 'When closed, this report will transfer $number minutes to the next month. You will need to remove this activity manually if necessary';
  }

  @override
  String reportTransferredMinutesTxt(int number) {
    return 'Transferred minutes $number';
  }

  @override
  String get helpTransferMinutes => 'If the value in the Hours column in the monthly service report is greater than 1 hour (e.g. 1 hour and 15 minutes), then the minutes will automatically roll over (transfer) to the next month when you close the report. Note: If you delete such a report, you may need to manually delete the activity containing the transferred minutes!';

  @override
  String get generalTransferredMinutes => 'Transferred minutes';

  @override
  String get settingsNoRemarksFromActivitiesInReport => 'Do not add remarks from activities when closing the report';

  @override
  String get generalSave => 'Save';

  @override
  String get select => 'select';

  @override
  String generalMonth(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Month',
      two: 'Months',
      other: 'Months',
    );
  }
}
