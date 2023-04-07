import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'mat2414';

  @override
  String get addActivityAddRemarksBtn => 'Dodaj uwagi';

  @override
  String get addActivityBtnNotSavedNotification => 'Nie udało się zapisać';

  @override
  String get addActivityBtnSavedNotification => 'Aktywność zapisana';

  @override
  String get addActivityEmptyError => 'Aktywność jest pusta. Nie została zapisana!';

  @override
  String get addActivityNewActivity => 'Nowa aktywność';

  @override
  String get addActivityNoChangesMadeError => 'Nie wprowadzono zmian';

  @override
  String get addActivityNotCreatedError => 'Not created. Ups';

  @override
  String get addNewActivityBtn => 'Dodaj aktywność';

  @override
  String get calendarDayAbbr1 => 'Mon';

  @override
  String get calendarDayAbbr2 => 'Tue';

  @override
  String get calendarDayAbbr3 => 'Wed';

  @override
  String get calendarDayAbbr4 => 'Thu';

  @override
  String get calendarDayAbbr5 => 'Fri';

  @override
  String get calendarDayAbbr6 => 'Sat';

  @override
  String get calendarDayAbbr7 => 'Sun';

  @override
  String get calendarMonthApril => 'April';

  @override
  String get calendarMonthAugust => 'August';

  @override
  String get calendarMonthDecember => 'December';

  @override
  String get calendarMonthFebruary => 'February';

  @override
  String get calendarMonthJanuary => 'January';

  @override
  String get calendarMonthJuly => 'July';

  @override
  String get calendarMonthJun => 'Jun';

  @override
  String get calendarMonthMarch => 'March';

  @override
  String get calendarMonthMay => 'May';

  @override
  String get calendarMonthNovember => 'November';

  @override
  String get calendarMonthOctober => 'October';

  @override
  String get calendarMonthSeptember => 'September';

  @override
  String get databaseNoPermission => 'No permission to access local storage';

  @override
  String get databaseNotOpened => 'Database is not opened';

  @override
  String get dialogMakeChanges => 'Czy chcesz coś zmienić?';

  @override
  String get dialogWantToDelete => 'Czy na pewno chce usunąć element?';

  @override
  String get dialogWantToSave => 'Do you want to save changes?';

  @override
  String get generalBibleStudies => 'Studia biblijne';

  @override
  String get generalBusinessTerritoryWitnessing => 'Business territory witnessing';

  @override
  String get generalCancel => 'Anuluj';

  @override
  String get generalDate => 'Data';

  @override
  String get generalDay => 'Day';

  @override
  String get generalDelete => 'Usuń';

  @override
  String get generalEdit => 'Edytuj';

  @override
  String get generalError => 'Błąd';

  @override
  String get moreManageCategories => 'Manage categories. Add new one, delete or edit.';

  @override
  String get newPwd => 'New password';

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
      one: 'Godzina',
      two: 'Godziny',
      other: 'Godzin',
    );
  }

  @override
  String get generalInformalWitnessing => 'Informal witnessing';

  @override
  String get generalLDCHours => 'Czas LDPB';

  @override
  String get generalMinute => 'Minute';

  @override
  String get generalMonth => 'Month';

  @override
  String get generalNo => 'Nie';

  @override
  String get generalOnlyInEnglish => 'Sorry, this section is in English only.';

  @override
  String get generalPlacements => 'Publikacje';

  @override
  String get generalPublicWitnessing => 'Public witnessing';

  @override
  String get generalRemarks => 'Uwagi';

  @override
  String get generalReturnVisits => 'Odwiedziny ponowne';

  @override
  String get generalServiceYear => 'Rok służbowy';

  @override
  String get generalSkip => 'Pomiń';

  @override
  String get generalStart => 'Start';

  @override
  String get generalSundayWitnessing => 'Sunday witnessing';

  @override
  String get generalTime => 'Czas';

  @override
  String get generalUsername => 'Imię';

  @override
  String get generalVideoShowings => 'Wyświetlone filmy';

  @override
  String get generalYear => 'Rok';

  @override
  String get generalYes => 'Tak';

  @override
  String get helpBibleStudies => 'The the total number of different Bible studies conducted during the month is determined in the preparation of the monthly report. This value will be saved and will appear as the default value the next month. You can change it.';

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
    return 'Witaj $name!';
  }

  @override
  String get homeNoActivities => 'Brak aktywności';

  @override
  String get homeTodayIs => 'Dziś jest';

  @override
  String get homeYorLastActivities => 'Twoja ostatnia aktywność:';

  @override
  String get ldcHoursToolTip => 'Mark if this is not the time spent in the field service. This hours will be saved in remarks';

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
  String get screenHome => 'Początek';

  @override
  String get screenMore => 'Więcej';

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
  String get settingsSettings => 'Ustawienia';

  @override
  String get settingsShowLDCHours => 'Pokaż przycisk godziny LDPB';

  @override
  String get settingsShowTips => 'Pokazuj podpowiedzi';

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
  String get settingsUpdateUsername => 'Nazwa użytkownika';

  @override
  String get statisticsHowManyTimes => 'razy';

  @override
  String get tabActivity => 'Aktywność';

  @override
  String get tabHistory => 'Historia';

  @override
  String get tabReport => 'Sprawozdanie';

  @override
  String get tabSettings => 'Ustawienia';

  @override
  String get tabStatistics => 'Statystyki';

  @override
  String get historyClosedMonthsVisible => 'Only closed months are visible';

  @override
  String get reportCopyToClipboard => 'Kopiuj sprawozdanie do schowka';
}
