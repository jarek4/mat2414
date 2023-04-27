String changeLocaleCodeToLanguage(String localeCode) {
  switch (localeCode.toLowerCase()) {
    case 'en':
      return 'English';
    case 'bg':
      return 'български';
    case 'el':
      return 'Ελληνικά';
    case 'pl':
      return 'polski';
    case 'ru':
      return 'Русский';
    case 'tr':
      return 'Türkçe';
    default:
      return 'English?';
  }
}
