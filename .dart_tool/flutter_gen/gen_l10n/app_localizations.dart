import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'mat2414'**
  String get appTitle;

  /// No description provided for @addActivityAddRemarksBtn.
  ///
  /// In en, this message translates to:
  /// **'Add remarks'**
  String get addActivityAddRemarksBtn;

  ///
  ///
  /// In en, this message translates to:
  /// **'Not saved'**
  String get addActivityBtnNotSavedNotification;

  /// No description provided for @addActivityBtnSavedNotification.
  ///
  /// In en, this message translates to:
  /// **'Activity was saved'**
  String get addActivityBtnSavedNotification;

  /// state error message
  ///
  /// In en, this message translates to:
  /// **'The activity is empty. It wont be saved!'**
  String get addActivityEmptyError;

  /// Add new activity title
  ///
  /// In en, this message translates to:
  /// **'New activity'**
  String get addActivityNewActivity;

  /// No description provided for @addActivityNoChangesMadeError.
  ///
  /// In en, this message translates to:
  /// **'No changes was made'**
  String get addActivityNoChangesMadeError;

  /// No description provided for @addActivityNotCreatedError.
  ///
  /// In en, this message translates to:
  /// **'Not created. Ups'**
  String get addActivityNotCreatedError;

  /// button text
  ///
  /// In en, this message translates to:
  /// **'Add new activity'**
  String get addNewActivityBtn;

  /// No description provided for @calendarDayAbbr1.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get calendarDayAbbr1;

  /// No description provided for @calendarDayAbbr2.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get calendarDayAbbr2;

  /// week day abbreviation week day abbreviation Wednesday
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get calendarDayAbbr3;

  /// week day abbreviation week day abbreviation Thursday
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get calendarDayAbbr4;

  /// No description provided for @calendarDayAbbr5.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get calendarDayAbbr5;

  /// No description provided for @calendarDayAbbr6.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get calendarDayAbbr6;

  /// No description provided for @calendarDayAbbr7.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get calendarDayAbbr7;

  ///
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get calendarMonthApril;

  /// No description provided for @calendarMonthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get calendarMonthAugust;

  /// No description provided for @calendarMonthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get calendarMonthDecember;

  /// No description provided for @calendarMonthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get calendarMonthFebruary;

  /// No description provided for @calendarMonthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get calendarMonthJanuary;

  /// No description provided for @calendarMonthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get calendarMonthJuly;

  /// No description provided for @calendarMonthJun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get calendarMonthJun;

  /// No description provided for @calendarMonthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get calendarMonthMarch;

  /// No description provided for @calendarMonthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get calendarMonthMay;

  /// No description provided for @calendarMonthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get calendarMonthNovember;

  /// No description provided for @calendarMonthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get calendarMonthOctober;

  /// No description provided for @calendarMonthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get calendarMonthSeptember;

  /// Error message, access
  ///
  /// In en, this message translates to:
  /// **'No permission to access local storage'**
  String get databaseNoPermission;

  /// Error message, not opened
  ///
  /// In en, this message translates to:
  /// **'Database is not opened'**
  String get databaseNotOpened;

  ///
  ///
  /// In en, this message translates to:
  /// **'Do you want to change something?'**
  String get dialogMakeChanges;

  /// No description provided for @dialogWantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete it?'**
  String get dialogWantToDelete;

  ///
  ///
  /// In en, this message translates to:
  /// **'Do you want to save changes?'**
  String get dialogWantToSave;

  ///
  ///
  /// In en, this message translates to:
  /// **'Bible studies'**
  String get generalBibleStudies;

  ///
  ///
  /// In en, this message translates to:
  /// **'Business territory witnessing'**
  String get generalBusinessTerritoryWitnessing;

  /// No description provided for @generalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get generalCancel;

  /// No description provided for @generalDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get generalDate;

  ///
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get generalDay;

  /// No description provided for @generalDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get generalDelete;

  /// No description provided for @generalEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get generalEdit;

  ///
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get generalError;

  /// No description provided for @moreManageCategories.
  ///
  /// In en, this message translates to:
  /// **'Manage categories. Add new one, delete or edit.'**
  String get moreManageCategories;

  /// New password
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPwd;

  ///
  ///
  /// In en, this message translates to:
  /// **'Evening witnessing'**
  String get generalEveningWitnessing;

  ///
  ///
  /// In en, this message translates to:
  /// **'For more information see More/Settings/Help'**
  String get generalForMoreInfoSeeHelp;

  /// No description provided for @generalGroupWitnessing.
  ///
  /// In en, this message translates to:
  /// **'Group witnessing'**
  String get generalGroupWitnessing;

  /// Hour for single, hours for plural
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Hour} =2{Hours} other{Hours}'**
  String generalHour(num count);

  ///
  ///
  /// In en, this message translates to:
  /// **'Informal witnessing'**
  String get generalInformalWitnessing;

  /// No description provided for @generalLDCHours.
  ///
  /// In en, this message translates to:
  /// **'LDC Hours'**
  String get generalLDCHours;

  /// No description provided for @generalMinute.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get generalMinute;

  /// No description provided for @generalMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get generalMonth;

  ///
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get generalNo;

  /// when no translation is available
  ///
  /// In en, this message translates to:
  /// **'Sorry, this section is in English only.'**
  String get generalOnlyInEnglish;

  ///
  ///
  /// In en, this message translates to:
  /// **'Placements'**
  String get generalPlacements;

  /// No description provided for @generalPublicWitnessing.
  ///
  /// In en, this message translates to:
  /// **'Public witnessing'**
  String get generalPublicWitnessing;

  ///
  ///
  /// In en, this message translates to:
  /// **'Remarks'**
  String get generalRemarks;

  ///
  ///
  /// In en, this message translates to:
  /// **'Return visits'**
  String get generalReturnVisits;

  /// 2022/23
  ///
  /// In en, this message translates to:
  /// **'Service year'**
  String get generalServiceYear;

  ///
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get generalSkip;

  /// No description provided for @generalStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get generalStart;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sunday witnessing'**
  String get generalSundayWitnessing;

  /// No description provided for @generalTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get generalTime;

  /// No description provided for @generalUsername.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get generalUsername;

  ///
  ///
  /// In en, this message translates to:
  /// **'Video showings'**
  String get generalVideoShowings;

  ///
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get generalYear;

  ///
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get generalYes;

  ///
  ///
  /// In en, this message translates to:
  /// **'The the total number of different Bible studies conducted during the month is determined in the preparation of the monthly report. This value will be saved and will appear as the default value the next month. You can change it.'**
  String get helpBibleStudies;

  ///
  ///
  /// In en, this message translates to:
  /// **'It means to prepare a monthly report and record this value. This action cannot be undone! You can only delete the report. After deletion, it can be created again and saved again. To do this, just set the selected month in the calendar and press the Close report button. Earlier you can edit notes and amount of bible studies. Only the value of a closed report can be copied. Only closed reports are visible in the history.'**
  String get helpClosingReport;

  ///
  ///
  /// In en, this message translates to:
  /// **'Time contributed at a construction site or other theocratic project. This is not time spent in field service and is not counted in the Hours column. The value for the whole month is given in the remarks. If you don\'t need this option, you can turn it off (it\'s off by default).'**
  String get helpLdcHours;

  ///
  ///
  /// In en, this message translates to:
  /// **'You may want to describe or name your activities as a volunteer in more detail. This description will override the default value.'**
  String get helpLdcHoursDescription;

  ///
  ///
  /// In en, this message translates to:
  /// **'Decide how accurately the time will be recorded. For example, you can select every 5 minutes or every half hour. Default set to 5 minutes.'**
  String get helpServiceTimePrecision;

  /// greeting
  ///
  /// In en, this message translates to:
  /// **'Hello {name}!'**
  String homeHello(String name);

  /// list is empty
  ///
  /// In en, this message translates to:
  /// **'No activities'**
  String get homeNoActivities;

  /// No description provided for @homeTodayIs.
  ///
  /// In en, this message translates to:
  /// **'Today is'**
  String get homeTodayIs;

  /// No description provided for @homeYorLastActivities.
  ///
  /// In en, this message translates to:
  /// **'Your last activities:'**
  String get homeYorLastActivities;

  /// No description provided for @ldcHoursToolTip.
  ///
  /// In en, this message translates to:
  /// **'Mark if this is not the time spent in the field service. This hours will be saved in remarks'**
  String get ldcHoursToolTip;

  ///
  ///
  /// In en, this message translates to:
  /// **'You can add your name later'**
  String get onBoardingCanAddNameLater;

  ///
  ///
  /// In en, this message translates to:
  /// **'Do you want to proceed without a name?'**
  String get onBoardingContinueWithoutName;

  ///
  ///
  /// In en, this message translates to:
  /// **'Record your each service. At the end of the month, create a personal service report. You can add remarks. You may find the LDC hours option useful.'**
  String get onBoardingInfo;

  ///
  ///
  /// In en, this message translates to:
  /// **'Rate the app and tell your friends!'**
  String get onBoardingRateApp;

  /// visit Help section
  ///
  /// In en, this message translates to:
  /// **'We encourage you to familiarize yourself with the Help section in the application.'**
  String get onBoardingVisitHelp;

  /// name form
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get onBoardingYourName;

  /// No description provided for @reportBibleStudiesToolTipWidgetText.
  ///
  /// In en, this message translates to:
  /// **'Use arrows to increase or decrease bible studies quantity. The number you set will be shown next month'**
  String get reportBibleStudiesToolTipWidgetText;

  /// No description provided for @reportCloseReportBtn.
  ///
  /// In en, this message translates to:
  /// **'Close Report'**
  String get reportCloseReportBtn;

  /// No description provided for @reportCopyReportBtn.
  ///
  /// In en, this message translates to:
  /// **'Copy Report'**
  String get reportCopyReportBtn;

  ///
  ///
  /// In en, this message translates to:
  /// **'You cannot undo closing the month! You will also not be able to make changes'**
  String get reportCopyReportToolTipWidgetText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Decrease bible studies quantity'**
  String get reportDecreaseBibleStudiesBtnToolTip;

  /// Button text. On error state
  ///
  /// In en, this message translates to:
  /// **'Error. Tap here to refresh'**
  String get reportErrorRefreshBtn;

  /// No description provided for @reportIncreaseBibleStudiesBtnToolTip.
  ///
  /// In en, this message translates to:
  /// **'Increase bible studies quantity'**
  String get reportIncreaseBibleStudiesBtnToolTip;

  /// No description provided for @reportReportWasCopied.
  ///
  /// In en, this message translates to:
  /// **'Report was copied'**
  String get reportReportWasCopied;

  /// screen name
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get screenDetail;

  /// screen name
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get screenHome;

  /// screen name
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get screenMore;

  ///
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get settingsAuto;

  /// No description provided for @settingsContactDev.
  ///
  /// In en, this message translates to:
  /// **'Contact with developer'**
  String get settingsContactDev;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  ///
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsMinutesPrecision.
  ///
  /// In en, this message translates to:
  /// **'Service time precision in minutes'**
  String get settingsMinutesPrecision;

  /// The service time precision example
  ///
  /// In en, this message translates to:
  /// **'e.g. 0:05 or 0:30'**
  String get settingsMinutesPrecisionExample;

  /// No description provided for @settingsRateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get settingsRateApp;

  /// Select statistics you want to see. Field description
  ///
  /// In en, this message translates to:
  /// **'Select statistics you want to see'**
  String get settingsSelectStatistics;

  /// No description provided for @settingsSetAnnualHourGoal.
  ///
  /// In en, this message translates to:
  /// **'Set annual hour goal'**
  String get settingsSetAnnualHourGoal;

  ///
  ///
  /// In en, this message translates to:
  /// **'Your avatar'**
  String get settingsSetAvatar;

  /// Set persistent description for LDC hours in month report .Field description
  ///
  /// In en, this message translates to:
  /// **'Set custom description for LDC hours in month report remarks'**
  String get settingsSetLdcDescription;

  /// Set monthly goal  (service time).Field description
  ///
  /// In en, this message translates to:
  /// **'Set monthly hour goal'**
  String get settingsSetMonthlyHourGoal;

  /// settings word
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsSettings;

  ///
  ///
  /// In en, this message translates to:
  /// **'Show LDC hours button'**
  String get settingsShowLDCHours;

  ///
  ///
  /// In en, this message translates to:
  /// **'Show tips'**
  String get settingsShowTips;

  /// No description provided for @settingsSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsSystem;

  /// No description provided for @settingsThemeDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get settingsThemeDarkTheme;

  /// No description provided for @settingsThemeLightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get settingsThemeLightTheme;

  /// No description provided for @settingsThemeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get settingsThemeMode;

  /// No description provided for @settingsThemeSystemTheme.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get settingsThemeSystemTheme;

  /// No description provided for @settingsUpdateUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get settingsUpdateUsername;

  /// how many times. 4 times
  ///
  /// In en, this message translates to:
  /// **'times'**
  String get statisticsHowManyTimes;

  /// tab name
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get tabActivity;

  /// tab name
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get tabHistory;

  /// tab name
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get tabReport;

  /// tab name
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// tab name
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get tabStatistics;

  /// No description provided for @historyClosedMonthsVisible.
  ///
  /// In en, this message translates to:
  /// **'Only completed months are visible'**
  String get historyClosedMonthsVisible;

  /// No description provided for @reportCopyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy the text of the report to the clipboard'**
  String get reportCopyToClipboard;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
