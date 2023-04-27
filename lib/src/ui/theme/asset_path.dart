class AssetPath {
  AssetPath._();

  static const String _icTimeTransfer = 'assets/images/clock_with_arrow_tr_ic1085.png';
  static const String _icEngineer305 = 'assets/images/engineer_t_ic265.png';
  static const String _icPaypal = 'assets/images/paypal_ic122.png';
  static const String _icRevolut = 'assets/images/revolut_ic512.png';
  static const String _icQuestionMark512 = 'assets/images/qm_ic512.png';
  static const String _imgHourglass512 = 'assets/images/hourglass_t_ic512.png';
  static const String _imgMagazine512 = 'assets/images/magazine_t_ic512.png';
  static const String _imgPreacher = 'assets/images/preacher_t.png';
  static const String _imgCalendar = 'assets/images/schedule_t.png';
  static const String _imgTwoPersons512 = 'assets/images/two_person_t_ic512.png';
  static const String _imgTwoPeronAtTable = 'assets/images/two_person_table_t_ic512.png';
  static const String _imgVideoCamera512 = 'assets/images/video_camera_t_ic512.png';
  static const String _imgWomenPreacher = 'assets/images/woman_with_bag_tr.png';
  static const String _txtTOF = 'assets/text/terms_of_use.txt';
  static const String _txtPriv = 'assets/text/privacy_statement.txt';

  static String get icTimeTransfer => _icTimeTransfer;

  static String get icEngineer305 => _icEngineer305;

  static String get icPaypal => _icPaypal;

  static String get icRevolut => _icRevolut;

  static String get icQuestionMark512 => _icQuestionMark512;

  static String get imgHourglass512 => _imgHourglass512;

  static String get imgMagazine512 => _imgMagazine512;

  static String get imgPreacher => _imgPreacher;

  static String get imgCalendar => _imgCalendar;

  static String get imgTwoPersons512 => _imgTwoPersons512;

  static String get imgTwoPeronAtTable => _imgTwoPeronAtTable;

  static String get imgVideoCamera512 => _imgVideoCamera512;

  static String get imgWomenPreacher => _imgWomenPreacher;

  static String get txtPrivacy => _txtPriv;

  static String get txtTermsOfUse => _txtTOF;

  static const Map<int, String> _availableAvatars = {
    0: _imgPreacher,
    1: _imgWomenPreacher,
  };

  static Map<int, String> get availableAvatars => _availableAvatars;
}
