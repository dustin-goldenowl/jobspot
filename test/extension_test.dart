import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';

void main() {
  group('Exension Test', () {
    test('getFileSizeString', () {
      expect(1024.getFileSizeString(), "1kb");
    });

    test('getFileSizeString', () {
      expect(1100.getFileSizeString(decimals: 1), "1.1kb");
    });

    test('getFileSizeString', () {
      expect(10.getFileSizeString(), "10b");
    });

    test('check link', () {
      expect("https://www.facebook.com/ngoctien.TNT/".isLink, true);
    });

    test('check link', () {
      expect("walter".isLink, false);
    });

    test('validate email', () {
      expect("walter.tran.goldenowl@gmail.com".isValidEmail(), true);
    });

    test('validate email', () {
      expect("walter".isValidEmail(), false);
    });

    test('capitalized String', () {
      expect("walter".capitalizedString, "Walter");
    });

    test('capitalized String', () {
      expect("walter tran".capitalizedString, "Walter Tran");
    });

    test('capitalized String', () {
      expect("walter Tran".capitalizedString, "Walter Tran");
    });
  });
}
