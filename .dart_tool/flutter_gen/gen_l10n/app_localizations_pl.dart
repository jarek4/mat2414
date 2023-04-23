import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Mt 24: 14';

  @override
  String get addActivityAddRemarksBtn => 'Dodaj uwagi';

  @override
  String get addActivityBtnNotSavedNotification => 'Nie zachowane';

  @override
  String get addActivityBtnSavedNotification => 'Aktywność zapisana';

  @override
  String get addActivityEmptyError => 'Pusta aktywność. Nie została zapisana!';

  @override
  String get addActivityNewActivity => 'Nowa aktywność';

  @override
  String get addActivityNoChangesMadeError => 'Nie wprowadzono zmian';

  @override
  String get addActivityNotCreatedError => 'Nie zostało utworzone. Ups...';

  @override
  String get addNewActivityBtn => 'Dodaj aktywność';

  @override
  String get databaseNoPermission => 'Brak pozwolenia na dostęp do pamięci lokalnej';

  @override
  String get databaseNotOpened => 'Nie można otworzyć bazy danych';

  @override
  String get dialogMakeChanges => 'Czy chcesz coś zmienić?';

  @override
  String get dialogWantToDelete => 'Na pewno chcesz usunąć ten element?';

  @override
  String get dialogWantToSave => 'Czy chcesz zapisać zmiany?';

  @override
  String get generalBibleStudies => 'Studia biblijne';

  @override
  String get generalBusinessTerritoryWitnessing => 'Teren handlowy';

  @override
  String get generalCancel => 'Anuluj';

  @override
  String get generalDate => 'Data';

  @override
  String get generalDay => 'Dzień';

  @override
  String get generalDelete => 'Usuń';

  @override
  String get generalEdit => 'Edytuj';

  @override
  String get generalError => 'Błąd';

  @override
  String get generalEveningWitnessing => 'Głoszenie wieczorem';

  @override
  String get generalForMoreInfoSeeHelp => 'Aby dowidzieć się więcej zobacz Więcej/Ustawienia/Pomoc';

  @override
  String get generalGroupWitnessing => 'Głoszenie grupowe';

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
  String get generalInformalWitnessing => 'Głoszenie nieoficjalne';

  @override
  String get generalLDCHours => 'Czas LDPB';

  @override
  String generalMinute(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Minuta',
      two: 'Minuty',
      other: 'Minut',
    );
  }

  @override
  String get generalNo => 'Nie';

  @override
  String get generalOnlyInEnglish => 'Przykro mam, ta sekcja jest tylko w języku angielskim.';

  @override
  String get generalPlacements => 'Publikacje';

  @override
  String get generalPublicWitnessing => 'Świadczenie publiczne';

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
  String get generalSundayWitnessing => 'Głoszenie w niedzielę';

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
  String get helpBibleStudies => 'Ogólna liczba różnych studiów biblijnych przeprowadzonych w ciągu miesiąca jest wprowadzana podczas przygotowywania sprawozdania miesięcznego. Ta wartość zostanie zapisana i pojawi się jako wartość domyślna w następnym miesiącu. Tę wartość możesz zmieniać.';

  @override
  String get helpClosingReport => 'Oznacza to przygotowanie sprawozdania miesięcznego i zapisanie jego wartości. Tej czynności nie można cofnąć! Możesz jednak usunąć sprawozdanie. Po usunięciu można go ponownie utworzyć i ponownie zapisać (zamknąć). W tym celu wystarczy ustawić wybrany miesiąc w kalendarzu i nacisnąć przycisk Zamknij. Wcześniej możesz edytować notatki i ilość studiów biblijnych. Można skopiować tylko wartość zamkniętego sprawozdania. W historii widoczne są tylko zamknięte sprawozdania.';

  @override
  String get helpLdcHours => 'Czas poświęcany na budowę lub inny projekt teokratyczny. To nie jest czas spędzony w służbie polowej i nie jest liczony w kolumnie Godziny. W uwagach podana jest wartość za cały miesiąc. Jeśli nie potrzebujesz tej opcji, możesz ją wyłączyć (domyślnie jest wyłączona).';

  @override
  String get helpLdcHoursDescription => 'Możesz bardziej szczegółowo opisać lub nazwać swoją działalność jako ochotnik. Ten opis zastąpi wartość domyślną.';

  @override
  String get helpServiceTimePrecision => 'Zdecyduj, jak dokładnie będzie rejestrowany czas. Na przykład możesz wybrać co 5 minut lub co pół godziny. Domyślnie ustawiony na 5 minut.';

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
  String get ldcHoursToolTip => 'Zaznacz, jeśli to nie jest czas spędzony w służbie polowej. Te godziny zostaną zapisane w uwagach';

  @override
  String get onBoardingCanAddNameLater => 'Możesz również podać imię później';

  @override
  String get onBoardingContinueWithoutName => 'Chcesz kontynuować bez podawania imienia?';

  @override
  String get onBoardingInfo => 'Zapisuj każde wyruszenie do służby. Pod koniec miesiąca przygotuj osobiste sprawozdanie ze służby. Możesz również dodać uwagi. Przydatna może być opcja godzin LDPB.';

  @override
  String get onBoardingRateApp => 'Oceń aplikację i poleć znajomym!';

  @override
  String get onBoardingVisitHelp => 'Zachęcamy do zapoznania się z sekcją Pomoc w aplikacji.';

  @override
  String get onBoardingYourName => 'Twoje imię';

  @override
  String get rateAppBtnLater => 'Przypomnij mi później';

  @override
  String get rateAppBtnNow => 'Ocenię teraz';

  @override
  String get rateAppContent => 'Jeśli lubisz korzystać z mat2414, czy mógłbyś poświęcić chwilę na ocenę? Dzięki za Twoje wsparcie!';

  @override
  String get rateAppTitle => 'Jak Ci się podoba aplikacja?';

  @override
  String get reportBibleStudiesToolTipWidgetText => 'Użyj strzałek, aby zwiększyć lub zmniejszyć liczbę studiów biblijnych. Ustawiona liczba zostanie też pokazana jako domyśla w następnym miesiącu';

  @override
  String get reportCloseReportBtn => 'Zamknij sprawozdanie';

  @override
  String get reportCopyReportBtn => 'Kopiuj sprawozdanie';

  @override
  String get reportCopyReportToolTipWidgetText => 'Nie można cofnąć zamknięcia miesiąca! Nie będziesz też mógł już nic zmienić';

  @override
  String get reportDecreaseBibleStudiesBtnToolTip => 'Zmniejsz liczbę studiów biblijnych';

  @override
  String get reportErrorRefreshBtn => 'Błąd. Naciśnij tu, żeby odświeżyć';

  @override
  String get reportIncreaseBibleStudiesBtnToolTip => 'Zwiększ liczbę studiów biblijnych';

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
  String get settingsContactDev => 'Kontakt z deweloperem';

  @override
  String get settingsHelp => 'Pomoc';

  @override
  String get settingsLanguage => 'Język';

  @override
  String get settingsMinutesPrecision => 'Precyzja czasu służby';

  @override
  String get settingsMinutesPrecisionExample => 'np. 0:05 lub 0:30';

  @override
  String get settingsRateApp => 'Oceń aplikację';

  @override
  String get settingsSelectStatistics => 'Wybierz widoczne statystyki';

  @override
  String get settingsSetAnnualHourGoal => 'Ustaw roczny cel godzinowy';

  @override
  String get settingsSetAvatar => 'Twój awatar';

  @override
  String get settingsSetLdcDescription => 'Ustaw własny opis dla czasu LDPB w sprawozdaniu';

  @override
  String get settingsSetMonthlyHourGoal => 'Ustaw miesięczny cel godzinowy';

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
  String get historyClosedMonthsVisible => 'Widoczne są tylko zamknięte miesiące';

  @override
  String get reportCopyToClipboard => 'Kopiuj sprawozdanie do schowka';

  @override
  String get dialogDeleteReportTransferredMinutesActivityWillBeDeleted => 'To sprawozdanie przeniosło {number} minut na kolejny miesiąc jako aktywność. Ta aktywność zostanie usunięta!';

  @override
  String get dialogCreateReportTransferredMinutes => '{number} minut przeniesione następny miesiąc';

  @override
  String get dialogCreateReportTransferredMinutesWarning => 'Po zamknięciu to sprawozdanie przeniesie {number} minut na następny miesiąc. W razie potrzeby może być konieczne ręczne usunięcie tej aktywności';

  @override
  String reportTransferredMinutesTxt(int number) {
    return 'Przeniesione minuty $number';
  }

  @override
  String get helpTransferMinutes => 'Jeśli wartość w rubryce Godziny w miesięcznym sprawozdaniu ze służby jest większa niż 1 godzina (np. 1 godz. i 15 min.), to minuty zostaną automatycznie przeniesione (przetransferowane) na kolejny miesiąc gdy zamkniesz sprawozdanie. Uwaga: jeśli usuniesz takie sprawozdanie, może być konieczne ręczne usunięcie usunięcie aktywności zawierającej przeniesione minuty!';

  @override
  String get generalTransferredMinutes => 'Przeniesione minuty';

  @override
  String get settingsNoRemarksFromActivitiesInReport => 'Nie dodawaj uwag z aktywności przy zamykaniu sprawozdania';

  @override
  String get generalSave => 'Zapisz';

  @override
  String get select => 'wybierz';

  @override
  String generalMonth(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Miesiąc',
      two: 'Miesiące',
      other: 'Miesięcy',
    );
  }
}
