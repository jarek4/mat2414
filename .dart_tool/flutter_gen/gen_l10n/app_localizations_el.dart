import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Ματθαίος 24:14';

  @override
  String get addActivityAddRemarksBtn => 'Προσθέστε σημειώσεις';

  @override
  String get addActivityBtnNotSavedNotification => 'Μη αποθηκευμένο';

  @override
  String get addActivityBtnSavedNotification => 'Η δραστηριότητα αποθηκεύτηκε';

  @override
  String get addActivityEmptyError => 'Η δραστηριότητα είναι άδεια. Δεν θα αποθηκευτεί!';

  @override
  String get addActivityNewActivity => 'Νέα δραστηριότητα';

  @override
  String get addActivityNoChangesMadeError => 'Δεν έγινε καμία αλλαγή';

  @override
  String get addActivityNotCreatedError => 'Δεν δημιουργήθηκε. Ups';

  @override
  String get addNewActivityBtn => 'Προσθέστε νέα δραστηριότητα';

  @override
  String get databaseNoPermission => 'Δεν έχετε άδεια πρόσβασης στον τοπικό χώρο αποθήκευσης';

  @override
  String get databaseNotOpened => 'Η βάση δεδομένων δεν έχει ανοίξει';

  @override
  String get dialogMakeChanges => 'Θέλετε να αλλάξετε κάτι;';

  @override
  String get dialogWantToDelete => 'Είστε βέβαιοι ότι θέλετε να το διαγράψετε;';

  @override
  String get dialogWantToSave => 'Θέλετε να αποθηκεύσετε τις αλλαγές;';

  @override
  String get generalBibleStudies => 'Γραφικές μελέτες';

  @override
  String get generalBusinessTerritoryWitnessing => 'Μαρτυρία σε εμπορικό τομέα';

  @override
  String get generalCancel => 'Ακύρωση';

  @override
  String get generalDate => 'Ημερομηνία';

  @override
  String get generalDay => 'Ημέρα';

  @override
  String get generalDelete => 'Διαγραφή';

  @override
  String get generalEdit => 'Επεξεργασία';

  @override
  String get generalError => 'Σφάλμα';

  @override
  String get generalEveningWitnessing => 'Μαρτυρία νωρίς το βράδυ';

  @override
  String get generalForMoreInfoSeeHelp => 'Για περισσότερες πληροφορίες ανατρέξτε στην ενότητα Περισσότερα/Ρυθμίσεις/Βοήθεια';

  @override
  String get generalGroupWitnessing => 'Ομαδική μαρτυρία';

  @override
  String generalHour(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Ώρα',
      two: 'Ώρες',
      other: 'Ώρες',
    );
  }

  @override
  String get generalInformalWitnessing => 'Ανεπίσημη μαρτυρία';

  @override
  String get generalLDCHours => 'Ώρες για το Περιφερειακό Τμήμα Σχεδιασμού/Οικοδόμησης';

  @override
  String generalMinute(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Λεπτό',
      two: 'Λεπτό',
      other: 'Λεπτό',
    );
  }

  @override
  String get generalNo => 'Όχι';

  @override
  String get generalOnlyInEnglish => 'Συγνώμη, αυτή η ενότητα είναι μόνο στα αγγλικά.';

  @override
  String get generalPlacements => 'Έντυπα';

  @override
  String get generalPublicWitnessing => 'Δημόσια μαρτυρία';

  @override
  String get generalRemarks => 'Σημειώσεις';

  @override
  String get generalReturnVisits => 'Επανεπισκέψεις';

  @override
  String get generalServiceYear => 'Υπηρεσιακός έτος';

  @override
  String get generalSkip => 'Παράλειψη';

  @override
  String get generalStart => 'Έναρξη';

  @override
  String get generalSundayWitnessing => 'Μαρτυρία την Κυριακή';

  @override
  String get generalTime => 'Χρόνος';

  @override
  String get generalUsername => 'Όνομα';

  @override
  String get generalVideoShowings => 'Προβολές Βίντεο';

  @override
  String get generalYear => 'Έτος';

  @override
  String get generalYes => 'Ναι';

  @override
  String get helpBibleStudies => 'Ο συνολικός αριθμός των διαφορετικών γραφικών μελετών που διεξάγουν κατά τη διάρκεια του μήνα καθορίζεται στην προετοιμασία της μηνιαίας έκθεσης. Αυτός ο αριθμός θα αποθηκευτεί και θα εμφανιστεί ως προεπιλεγμένος αριθμός τον επόμενο μήνα. Μπορείτε να το αλλάξετε.';

  @override
  String get helpClosingReport => 'Σημαίνει να ετοιμάσεις μια μηνιαία έκθεση. Αυτή η πράξη δε μπορεί να αναιρεθεί! Μπορείτε να διαγράψετε μόνο την έκθεση. Μετά τη διαγραφή, η έκθεση μπορεί να δημιουργηθεί ξανά και να αποθηκευτεί ξανά. Για να το κάνετε αυτό, απλώς ορίστε τον επιλεγμένο μήνα στο ημερολόγιο και πατήστε το κουμπί Κλείσιμο έκθεσης. Νωρίτερα, μπορείτε να επεξεργαστείτε σημειώσεις και τον αριθμό των Γραφικών μελετών. Μόνο μια κλειστή έκθεση μπορεί να αντιγραφεί. Μόνο οι κλειστές εκθέσεις είναι ορατές στο ιστορικό.';

  @override
  String get helpLdcHours => 'Χρόνος συνεισφοράς σε εργοτάξιο ή άλλο θεοκρατικό έργο. Αυτός δεν είναι ο χρόνος που δαπανάται στην υπηρεσία αγρού και δεν υπολογίζεται στη στήλη Ώρες. Ο αριθμός για ολόκληρο τον μήνα δίνεται στις σημειώσεις. Εάν δεν χρειάζεστε αυτήν την επιλογή, μπορείτε να την απενεργοποιήσετε (είναι απενεργοποιημένη από προεπιλογή).';

  @override
  String get helpLdcHoursDescription => 'Μπορεί να θέλετε να περιγράψετε ή να ονομάσετε τις δραστηριότητές σας ως εθελοντή με περισσότερες λεπτομέρειες. Αυτή η περιγραφή θα αντικαταστήσει την προεπιλεγμένη τιμή.';

  @override
  String get helpServiceTimePrecision => 'Αποφασίστε πόσο ακριβώς θα καταγραφεί ο χρόνος. Για παράδειγμα, μπορείτε να επιλέξετε κάθε 5 λεπτά ή κάθε μισή ώρα. Η προεπιλεγμένη τιμή ορίζεται στα 5 λεπτά.';

  @override
  String homeHello(String name) {
    return 'Γεια σου $name!';
  }

  @override
  String get homeNoActivities => 'Καμία δραστηριότητα';

  @override
  String get homeTodayIs => 'Σήμερα είναι';

  @override
  String get homeYorLastActivities => 'Οι τελευταίες σας δραστηριότητες:';

  @override
  String get ldcHoursToolTip => 'Σημειώστε αν αυτός δεν είναι χρόνος που δαπανάται στην υπηρεσία αγρού. Αυτή η ώρα θα αποθηκευτεί στις σημειώσεις';

  @override
  String get onBoardingCanAddNameLater => 'Μπορείτε να προσθέσετε το όνομά σας αργότερα';

  @override
  String get onBoardingContinueWithoutName => 'Θέλετε να προχωρήσετε χωρίς όνομα;';

  @override
  String get onBoardingInfo => 'Καταγράψτε κάθε υπηρεσία σας. Στο τέλος του μήνα, δημιουργήστε μια προσωπική έκθεση   υπηρεσίας αγρού. Μπορείτε να προσθέσετε σημειώσεις. Μπορείτε να βρείτε την επιλογή ώρες για το περιφερειακό τμήμα σχεδιασμού/οικοδομής   χρήσιμη ';

  @override
  String get onBoardingRateApp => 'Αξιολογήστε την εφαρμογή και πείτε στους φίλους σας!';

  @override
  String get onBoardingVisitHelp => 'Σας ενθαρρύνουμε να εξοικειωθείτε με την ενότητα Βοήθεια στην εφαρμογή.';

  @override
  String get onBoardingYourName => 'Το όνομά σας';

  @override
  String get rateAppBtnLater => 'Υπενθυμίστε το μου αργότερα';

  @override
  String get rateAppBtnNow => 'Αξιολογήστε το τώρα';

  @override
  String get rateAppContent => 'Αν σας αρέσει να χρησιμοποιείτε αυτή η εφαρμογή, παρακαλώ κάντε μια στιγμή για να την αξιολογήσετε. Ευχαριστούμε για την υποστήριξή σας!';

  @override
  String get rateAppTitle => 'Πώς τα πάμε;';

  @override
  String get reportBibleStudiesToolTipWidgetText => 'Χρησιμοποιήστε τα βέλη για να αυξήσετε ή να μειώσετε την ποσότητα των Γραφικών μελετών. Ο αριθμός που έχετε ορίσει θα εμφανιστεί τον επόμενο μήνα';

  @override
  String get reportCloseReportBtn => 'Κλείσιμο Έκθεσης';

  @override
  String get reportCopyReportBtn => 'Αντιγραφή Έκθεσης';

  @override
  String get reportCopyReportToolTipWidgetText => 'Δεν μπορείτε να αναιρέσετε το κλείσιμο του μήνα! Δεν θα μπορείτε επίσης να κάνετε αλλαγές';

  @override
  String get reportDecreaseBibleStudiesBtnToolTip => 'Μειώστε την ποσότητα των Γραφικών μελετών';

  @override
  String get reportErrorRefreshBtn => 'Σφάλμα. Πατήστε εδώ για ανανέωση';

  @override
  String get reportIncreaseBibleStudiesBtnToolTip => 'Αυξήστε την ποσότητα των Γραφικών μελετών';

  @override
  String get reportReportWasCopied => 'Η έκθεση αντιγράφηκε';

  @override
  String get screenDetail => 'Λεπτομέρειες';

  @override
  String get screenHome => 'Αρχική σελίδα';

  @override
  String get screenMore => 'Περισσότερα';

  @override
  String get settingsAuto => 'Αυτόματο';

  @override
  String get settingsContactDev => 'Επικοινωνήστε με τον προγραμματιστή';

  @override
  String get settingsHelp => 'Βοήθεια';

  @override
  String get settingsLanguage => 'Γλώσσα';

  @override
  String get settingsMinutesPrecision => 'Ακρίβεια χρόνου υπηρεσίας σε λεπτά';

  @override
  String get settingsMinutesPrecisionExample => 'π.χ. 0:05 ή 0:30';

  @override
  String get settingsRateApp => 'Αξιολογήστε την εφαρμογή';

  @override
  String get settingsSelectStatistics => 'Επιλέξτε στατιστικά που θέλετε να δείτε';

  @override
  String get settingsSetAnnualHourGoal => 'Καθορισμός στόχου ετήσιων όρων';

  @override
  String get settingsSetAvatar => 'Το avatar σας';

  @override
  String get settingsSetLdcDescription => 'Ορίστε προσαρμοσμένη περιγραφή για τις ώρες για το περιφερειακό τμήμα σχεδιασμού/οικοδόμησης  στις σημειώσεις της έκθεσης';

  @override
  String get settingsSetMonthlyHourGoal => 'Καθορισμός στόχου μηνιαίων όρων';

  @override
  String get settingsSettings => 'Ρυθμίσεις';

  @override
  String get settingsShowLDCHours => 'Εμφάνιση κουμπιού LDC ωρών';

  @override
  String get settingsShowTips => 'Εμφάνιση συμβουλών';

  @override
  String get settingsSystem => 'Σύστημα';

  @override
  String get settingsThemeDarkTheme => 'Σκοτεινή λειτουργία';

  @override
  String get settingsThemeLightTheme => 'Φωτεινή λειτουργία';

  @override
  String get settingsThemeMode => 'Λειτουργία θέματος';

  @override
  String get settingsThemeSystemTheme => 'Θέμα συστήματος';

  @override
  String get settingsUpdateUsername => 'Όνομα χρήστη';

  @override
  String get statisticsHowManyTimes => 'φορές';

  @override
  String get tabActivity => 'Δραστηριότητα';

  @override
  String get tabHistory => 'Ιστορία';

  @override
  String get tabReport => 'Έκθεση';

  @override
  String get tabSettings => 'Ρυθμίσεις';

  @override
  String get tabStatistics => 'Στατιστικά';

  @override
  String get historyClosedMonthsVisible => 'Μόνο κλειστοί μήνες είναι ορατοί';

  @override
  String get reportCopyToClipboard => 'Αντιγραφή του κειμένου της αναφοράς στο πρόχειρο';

  @override
  String dialogDeleteReportTransferredMinutesActivityWillBeDeleted(int number) {
    return 'Αυτή η αναφορά έχει μεταφέρει $number λεπτά στον επόμενο μήνα ως δραστηριότητα. Αυτή η δραστηριότητα θα διαγραφεί!';
  }

  @override
  String dialogCreateReportTransferredMinutes(int number) {
    return '$number λεπτά όπου μεταφέρθηκαν στον επόμενο μήνα';
  }

  @override
  String dialogCreateReportTransferredMinutesWarning(int number) {
    return 'Όταν κλείσει, αυτή η αναφορά θα μεταφέρει $number λεπτά στον επόμενο μήνα. Θα χρειαστεί να αφαιρέσετε αυτή τη δραστηριότητα χειροκίνητα αν είναι απαραίτητο';
  }

  @override
  String reportTransferredMinutesTxt(int number) {
    return 'Μεταφερόμενα λεπτά $number';
  }

  @override
  String get helpTransferMinutes => 'Εάν η τιμή στη στήλη ωρών στη μηνιαία αναφορά υπηρεσίας είναι μεγαλύτερη από 1 ώρα (π.χ. 1 ώρα και 15 λεπτά), τότε τα λεπτά θα μεταφερθούν  αυτόματα στον επόμενο μήνα όταν κλείσετε την εκθεση. Σημείωση: Αν διαγράψετε μια έκθεση , ίσως χρειαστεί να διαγράψετε χειροκίνητα τη δραστηριότητα που περιέχει τα μεταφερόμενα λεπτά!';

  @override
  String get generalTransferredMinutes => 'Μεταφερόμενα λεπτά';

  @override
  String get settingsNoRemarksFromActivitiesInReport => 'Μην προσθέτετε σημειώσεις από δραστηριότητες κατά το κλείσιμο της έκθεσης';

  @override
  String get generalSave => 'Αποθήκευση';

  @override
  String get select => 'επιλέξτε';

  @override
  String generalMonth(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Ώρα',
      two: 'Ώρες',
      other: 'Ώρες',
    );
  }
}
