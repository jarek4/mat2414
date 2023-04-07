import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NOpenLink {
  const NOpenLink._();

  static const _urlLinkChanel = MethodChannel('com.gmail.forin.mat2414/url_link');
  static const _openUrlNativeMethodName = 'openUrl';

  static Future<void> openUrl(String url) async {
    try {
      final args = {'link': url};
      await _urlLinkChanel.invokeMethod(_openUrlNativeMethodName, args);
      return;
    } catch (e) {
      if (kDebugMode) print('$e');
      return;
    }
  }
}