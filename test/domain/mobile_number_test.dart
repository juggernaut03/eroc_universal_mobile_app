import 'package:flutter_test/flutter_test.dart';
import 'package:patelmart/domain/entities/mobile_number.dart';

void main() {
  group('MobileNumber', () {
    test('accepts Indian mobile numbers', () {
      expect(MobileNumber.isValid('9876543210'), isTrue);
      expect(MobileNumber.isValid('6123456789'), isTrue);
    });

    test('accepts Malaysian mobile numbers of 10 and 11 digits', () {
      expect(MobileNumber.isValid('0123456789'), isTrue);
      expect(MobileNumber.isValid('01123456789'), isTrue);
    });

    test('rejects landlines, wrong lengths and other prefixes', () {
      expect(MobileNumber.isValid('0312345678'), isFalse);
      expect(MobileNumber.isValid('012345678'), isFalse);
      expect(MobileNumber.isValid('5123456789'), isFalse);
      expect(MobileNumber.isValid(''), isFalse);
      expect(MobileNumber.isValid(null), isFalse);
    });

    test('ignores surrounding whitespace', () {
      expect(MobileNumber.isValid(' 0123456789 '), isTrue);
    });
  });
}
