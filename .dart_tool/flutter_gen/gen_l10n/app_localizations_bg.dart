import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Мат. 24:14';

  @override
  String get addActivityAddRemarksBtn => 'Добавете бележки';

  @override
  String get addActivityBtnNotSavedNotification => 'Незапазено';

  @override
  String get addActivityBtnSavedNotification => 'Активността е запазена';

  @override
  String get addActivityEmptyError => 'Активността не е попълнена. Няма да бъде запазена!';

  @override
  String get addActivityNewActivity => 'Нова активност';

  @override
  String get addActivityNoChangesMadeError => 'Няма направени промени';

  @override
  String get addActivityNotCreatedError => 'Не се създаде. Упс';

  @override
  String get addNewActivityBtn => 'Добави нова активност';

  @override
  String get databaseNoPermission => 'Няма разрешение за достъп до хранилището';

  @override
  String get databaseNotOpened => 'Базата данни не се отваря';

  @override
  String get dialogMakeChanges => 'Искате ли да направите промени?';

  @override
  String get dialogWantToDelete => 'Сигурни ли сте, че искате да изтриете?';

  @override
  String get dialogWantToSave => 'Желаете ли да запазите направените промени?';

  @override
  String get generalBibleStudies => 'Библейски изучавания';

  @override
  String get generalBusinessTerritoryWitnessing => 'Свидетелстване в бизнес район';

  @override
  String get generalCancel => 'Отмени';

  @override
  String get generalDate => 'Дата';

  @override
  String get generalDay => 'Ден';

  @override
  String get generalDelete => 'Изтрий';

  @override
  String get generalEdit => 'Редактирай';

  @override
  String get generalError => 'Грешка';

  @override
  String get generalEveningWitnessing => 'Вечерна служба';

  @override
  String get generalForMoreInfoSeeHelp => 'За повече информация виж:\nПовече/Настройки/Помощ';

  @override
  String get generalGroupWitnessing => 'Групова служба';

  @override
  String generalHour(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Час',
      two: 'Часове',
      other: 'Часа',
    );
  }

  @override
  String get generalInformalWitnessing => 'Неофициално свидетелстване';

  @override
  String get generalLDCHours => 'Часове за МОПС';

  @override
  String generalMinute(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Минута',
      two: 'Минути',
      other: 'Минути',
    );
  }

  @override
  String get generalNo => 'Не';

  @override
  String get generalOnlyInEnglish => 'За съжаление, тази секция е само на английски език.';

  @override
  String get generalPlacements => 'Издания';

  @override
  String get generalPublicWitnessing => 'Свидетелстване на обществени места';

  @override
  String get generalRemarks => 'Бележки';

  @override
  String get generalReturnVisits => 'Повторни посещения';

  @override
  String get generalServiceYear => 'Служебна година';

  @override
  String get generalSkip => 'Пропусни';

  @override
  String get generalStart => 'Старт';

  @override
  String get generalSundayWitnessing => 'Свидетелстване в неделя';

  @override
  String get generalTime => 'Време';

  @override
  String get generalUsername => 'Име';

  @override
  String get generalVideoShowings => 'Показани видеоклипове';

  @override
  String get generalYear => 'Година';

  @override
  String get generalYes => 'Да';

  @override
  String get helpBibleStudies => 'Общият брой различни библейски изучавания, водени през месеца, се определя при подготовката на месечния отчет. Общият брой ще бъде запазен и ще се появи като брой по подразбиране следващия месец. Можете да го промените.';

  @override
  String get helpClosingReport => 'Означава да изготвите и запишете месечния си отчет. Това действие не може да бъде отменено! Можете само да изтриете отчета. След като бъде изтрит, отчетът може да се създаде и да се запази отново. За целта просто задайте избрания месец в календара и натиснете бутона Приключи отчета. Предварително можете да редактирате бележките и количеството библейски изучавания. Може да се копират само данните от приключен отчет. В хронологията се виждат само приключените отчети.';

  @override
  String get helpLdcHours => 'Време, прекарано на строителен обект или друг теократичен проект. Това не е време, прекарано в проповедната служба и не се отчита в колона Часове. Общото количество часове за целия месец се вижда в бележките. Ако тази опция не ви е необходима, можете да я изключите (по подразбиране е изключена).';

  @override
  String get helpLdcHoursDescription => 'Възможно е да желаете да опишете дейностите си като доброволец по-подробно. Това описание ще замени стойността по подразбиране.';

  @override
  String get helpServiceTimePrecision => 'Определете колко точно да бъде записвано времето. Например, можете да изберете на всеки 5 минути или на всеки половин час. По подразбиране е зададено 5 минути.';

  @override
  String homeHello(String name) {
    return 'Здравей $name,';
  }

  @override
  String get homeNoActivities => 'Няма дейности';

  @override
  String get homeTodayIs => 'Днес е';

  @override
  String get homeYorLastActivities => 'Последната ви активност:';

  @override
  String get ldcHoursToolTip => 'Отбележи, ако това не е време, прекарано в проповедна служба. Тези часове ще бъдат запазени в бележки';

  @override
  String get onBoardingCanAddNameLater => 'Може да добавите името си по-късно';

  @override
  String get onBoardingContinueWithoutName => 'Искате ли да продължите без име?';

  @override
  String get onBoardingInfo => 'Записвайте всяко свое участие в службата. В края на месеца създайте своя личен отчет. Може да добавяте бележки. Опцията часове за МОПС може да ви е от полза.';

  @override
  String get onBoardingRateApp => 'Дайте оценка на приложението и споделете с приятели!';

  @override
  String get onBoardingVisitHelp => 'Препоръчваме ви да се запознаете със секцията Помощ в приложението.';

  @override
  String get onBoardingYourName => 'Вашето име';

  @override
  String get rateAppBtnLater => 'Припомни ми по-късно';

  @override
  String get rateAppBtnNow => 'Оценете го сега';

  @override
  String get rateAppContent => 'Ако ви харесва да използвате mat2414, бихте ли имали против да отделите време, за да го оцените? Благодарим за подкрепата!';

  @override
  String get rateAppTitle => 'Доволни ли сте от приложението?';

  @override
  String get reportBibleStudiesToolTipWidgetText => 'Използвайте стелките, за да увеличите или намалите общия брой на библейските изучавания. Броят, който посочите, ще се показва следващия месец';

  @override
  String get reportCloseReportBtn => 'Приключи отчета';

  @override
  String get reportCopyReportBtn => 'Копирай отчета';

  @override
  String get reportCopyReportToolTipWidgetText => 'Приключването на месеца не може да бъде отменено! Няма да е възможно също да правите промени';

  @override
  String get reportDecreaseBibleStudiesBtnToolTip => 'Намалете количеството на библейските изучавания';

  @override
  String get reportErrorRefreshBtn => 'Грешка. Кликнете тук, за да обновите';

  @override
  String get reportIncreaseBibleStudiesBtnToolTip => 'Увеличете количеството на библейските изучавания';

  @override
  String get reportReportWasCopied => 'Отчетът е копиран';

  @override
  String get screenDetail => 'Детайл';

  @override
  String get screenHome => 'Начало';

  @override
  String get screenMore => 'Повече';

  @override
  String get settingsAuto => 'Автоматично';

  @override
  String get settingsContactDev => 'Свържете се с разработчик';

  @override
  String get settingsHelp => 'Помощ';

  @override
  String get settingsLanguage => 'Език';

  @override
  String get settingsMinutesPrecision => 'Точност на времето за служба в минути';

  @override
  String get settingsMinutesPrecisionExample => 'Напр. 0:05 или 0:30';

  @override
  String get settingsRateApp => 'Оценете приложението';

  @override
  String get settingsSelectStatistics => 'Изберете статистките, които желаете да са видими';

  @override
  String get settingsSetAnnualHourGoal => 'Задайте годишен норматив';

  @override
  String get settingsSetAvatar => 'Вашият аватар';

  @override
  String get settingsSetLdcDescription => 'Задайте персонализирано описание на часовете за МОПС в бележките към месечния отчет ';

  @override
  String get settingsSetMonthlyHourGoal => 'Задайте месечен норматив';

  @override
  String get settingsSettings => 'Настройки';

  @override
  String get settingsShowLDCHours => 'Показвай бутона часове за МОПС';

  @override
  String get settingsShowTips => 'Показвай съвети';

  @override
  String get settingsSystem => 'Система';

  @override
  String get settingsThemeDarkTheme => 'Тъмен фон';

  @override
  String get settingsThemeLightTheme => 'Светъл фон';

  @override
  String get settingsThemeMode => 'Настройка на фона';

  @override
  String get settingsThemeSystemTheme => 'Тема на системата';

  @override
  String get settingsUpdateUsername => 'Потребителско име';

  @override
  String get statisticsHowManyTimes => 'пъти';

  @override
  String get tabActivity => 'Активност';

  @override
  String get tabHistory => 'История';

  @override
  String get tabReport => 'Отчет';

  @override
  String get tabSettings => 'Настройки';

  @override
  String get tabStatistics => 'Статистики';

  @override
  String get historyClosedMonthsVisible => 'Видими са само приключените месеци';

  @override
  String get reportCopyToClipboard => 'Копирайте текста на отчета в клипборда';

  @override
  String dialogDeleteReportTransferredMinutesActivityWillBeDeleted(int number) {
    return '$number минути от настоящия отчет са прехвърлени към следващия месец като активност. Тази активност ще бъде изтрита!';
  }

  @override
  String dialogCreateReportTransferredMinutes(int number) {
    return '$number минути бяха прехвърлени към следващия месец';
  }

  @override
  String dialogCreateReportTransferredMinutesWarning(int number) {
    return 'Когато бъде приключен, този отчет ще прехвърли $number минути към следващия месец. Ще трябва да премахнете тази активност ръчно, ако е необходимо ';
  }

  @override
  String reportTransferredMinutesTxt(int number) {
    return 'Прехвърлени минути $number';
  }

  @override
  String get helpTransferMinutes => 'Ако стойността в колоната Часове в месечния отчет е по-голяма от 1 час (напр. 1 час и 15 минути), тогава минутите автоматично ще се прехвърлят към следващия месец, когато затворите отчета. Забележка: Ако изтриете такъв отчет, може да се наложи ръчно да изтриете дейността, съдържаща прехвърлените минути!';

  @override
  String get generalTransferredMinutes => 'Прехвърлени минути';

  @override
  String get settingsNoRemarksFromActivitiesInReport => 'Не добавяй бележките от активностите при приключването на отчета';

  @override
  String get generalSave => 'Запиши';

  @override
  String get select => 'избери';

  @override
  String generalMonth(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Месец',
      two: 'Месеци',
      other: 'Месеца',
    );
  }
}
