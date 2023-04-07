import 'package:flutter/services.dart';

class NOpenLink {
  const NOpenLink._();

  static const urlLinkChanel = MethodChannel('com.gmail.forin.mat2414/url_link');


  static Future<void> openUrl(String url) async {
    print('NOpenLink openUrl');
    final args = {'link': url};
    await urlLinkChanel.invokeMethod('openUrl', args);
  }
}