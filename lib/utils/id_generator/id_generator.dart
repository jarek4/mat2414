import 'dart:math' as math;

import 'random_key_assets.dart';

/// generate 37 characters ID
String generateId() {
  final String random = _randomCharactersGenerator();
  final DateTime now = DateTime.now();
  String date = '${now.year}${now.month}${now.day}-${now.minute}${now.second}-${now.millisecond}';

  if (date.length < 17) {
    final int needToAdd = 17 - date.length;
    for (int i = 0; i < needToAdd; i++) {
      date += RandomKeyAssets.alphabet[math.Random().nextInt(RandomKeyAssets.alphabet.length)];
    }
  }

  return '$random-$date';
}

String _randomCharactersGenerator() {
  const List<String> letters = RandomKeyAssets.alphabet;
  const List<String> numbers = RandomKeyAssets.digits;
  String first4Letters = '';
  String second4Digits = '';
  String third4Blended = '';
  String fourth4Letters = '';
  for (int i = 0; i < 4; i++) {
    first4Letters += letters[math.Random.secure().nextInt(letters.length)];
    second4Digits += numbers[math.Random.secure().nextInt(numbers.length)];
    fourth4Letters += letters[math.Random.secure().nextInt(letters.length)];
    final int casual = math.Random().nextInt(75);
    if ((i + casual).isOdd) {
      third4Blended += letters[math.Random().nextInt(letters.length)];
    } else {
      third4Blended += numbers[math.Random().nextInt(numbers.length)];
    }
  }
  // abbi-2976-7k6q-hfew
  return '$first4Letters-$second4Digits-$third4Blended-$fourth4Letters';
}
