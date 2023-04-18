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
  String get addActivityBtnNotSavedNotification => 'Aktywność nie zapisana';

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
  String get generalMinute => 'Minuta';

  @override
  String get generalMonth => 'Miesiąc';

  @override
  String get generalNo => 'Nie';

  @override
  String get generalOnlyInEnglish => 'Przykro nam. Ta sekcja jest tylko po angielsku';

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
  String get onBoardingRateApp => 'Oceń aplikację i poleć znajomym';

  @override
  String get onBoardingVisitHelp => 'We encourage you to familiarize yourself with the Help section in the application.';

  @override
  String get onBoardingYourName => 'Twoje imię';

  @override
  String get rateAppBtnLater => 'Przypomnij mi później';

  @override
  String get rateAppBtnNow => 'Ocenię teraz';

  @override
  String get rateAppContent => 'Jeśli lubisz korzystać z mat2414, czy mógłbyś poświęcić chwilę na ocenę? Dzięki za Twoje wsparcie!';

  @override
  String get rateAppTitle => 'Jak Ci się podoba aplikacja';

  @override
  String get reportBibleStudiesToolTipWidgetText => 'Use arrows to increase or decrease bible studies quantity. The number you set will be shown next month';

  @override
  String get reportCloseReportBtn => 'Zamknij sprawozdanie';

  @override
  String get reportCopyReportBtn => 'Kopiuj sprawozdanie';

  @override
  String get reportCopyReportToolTipWidgetText => 'You cannot undo closing the month! You will also not be able to make changes';

  @override
  String get reportDecreaseBibleStudiesBtnToolTip => 'Decrease bible studies quantity';

  @override
  String get reportErrorRefreshBtn => 'Błąd. Naciśnij tu, aby odświerzyć';

  @override
  String get reportIncreaseBibleStudiesBtnToolTip => 'Increase bible studies quantity';

  @override
  String reportTransferredMinutesTxt(int number) {
    return 'Przeniesione minuty $number';
  }

  @override
  String get reportReportWasCopied => 'Sprawozdanie skopiowane';

  @override
  String get screenDetail => 'Szczegóły';

  @override
  String get screenHome => 'Początek';

  @override
  String get screenMore => 'Więcej';

  @override
  String get settingsAuto => 'Auto';

  @override
  String get settingsContactDev => 'Kontakt z developerwm';

  @override
  String get settingsHelp => 'Pomoc';

  @override
  String get settingsLanguage => 'Język';

  @override
  String get settingsMinutesPrecision => 'Dokładność czasu służby';

  @override
  String get settingsMinutesPrecisionExample => 'np. 0:01 lub 0:30';

  @override
  String get settingsRateApp => 'Oceń aplikację';

  @override
  String get settingsSelectStatistics => 'Select statistics you want to see';

  @override
  String get settingsSetAnnualHourGoal => 'Set annual hour goal';

  @override
  String get settingsSetAvatar => 'Twój awatar';

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
  String get settingsThemeDarkTheme => 'Ciemny motyw';

  @override
  String get settingsThemeLightTheme => 'Jasny motyw';

  @override
  String get settingsThemeMode => 'Tryb';

  @override
  String get settingsThemeSystemTheme => 'Motyw systemu';

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
  String get historyClosedMonthsVisible => 'Widoczne są tylko zamknięte sprawozdania';

  @override
  String get reportCopyToClipboard => 'Kopiuj sprawozdanie do schowka';
}
