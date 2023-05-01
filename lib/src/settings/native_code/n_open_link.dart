import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NOpenLink {
  const NOpenLink._();

  static const _urlChanel = MethodChannel('com.gmail.forin.mat2414/url_link');
  static const _openUrlNativeMethodName = 'openUrl';
  static const _openMailToNativeMethodName = 'openMailTo';

  static Future<void> openUrl(String url) async {
    try {
      final args = {'link': url};
      await _urlChanel.invokeMethod(_openUrlNativeMethodName, args);
      return;
    } catch (e) {
      if (kDebugMode) print('$e');
      return;
    }
  }

  static Future<void> openMailTo({
    String mailTo = '4forin@gmail.com',
    String subject = 'mat2414',
    String from = 'default_user',
  }) async {
    try {
      if (from.isEmpty) from = 'User';
      // no white spaces allowed in native url
      final args = {
        'mailTo': mailTo,
        'subject': subject.trim().replaceAll(' ', '_'),
        'from': from.trim().replaceAll(' ', ','),
      };
      await _urlChanel.invokeMethod(_openMailToNativeMethodName, args);
      return;
    } catch (e) {
      if (kDebugMode) print('$e');
      return;
    }
  }
}
