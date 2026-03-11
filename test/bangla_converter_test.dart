import 'package:bangla_converter/bangla_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('engToBan', () {
    test('converts single digits', () {
      expect(BanglaConverter.engToBan('0'), '০');
      expect(BanglaConverter.engToBan('5'), '৫');
      expect(BanglaConverter.engToBan('9'), '৯');
    });

    test('converts multiple digits', () {
      expect(BanglaConverter.engToBan('123'), '১২৩');
      expect(BanglaConverter.engToBan('9876543210'), '৯৮৭৬৫৪৩২১০');
    });

    test('preserves non-numeric characters', () {
      expect(BanglaConverter.engToBan('01733-452XXX'), '০১৭৩৩-৪৫২XXX');
    });

    test('handles empty string', () {
      expect(BanglaConverter.engToBan(''), '');
    });

    test('handles integer input', () {
      expect(BanglaConverter.engToBan(42), '৪২');
    });

    test('handles string with no digits', () {
      expect(BanglaConverter.engToBan('abc'), 'abc');
    });
  });

  group('banToEng', () {
    test('converts single digits', () {
      expect(BanglaConverter.banToEng('০'), '0');
      expect(BanglaConverter.banToEng('৫'), '5');
      expect(BanglaConverter.banToEng('৯'), '9');
    });

    test('converts multiple digits', () {
      expect(BanglaConverter.banToEng('১২৩'), '123');
      expect(BanglaConverter.banToEng('৯৮৭৬৫৪৩২১০'), '9876543210');
    });

    test('preserves non-numeric characters', () {
      expect(BanglaConverter.banToEng('০১৭৩৩-৪৫২XXX'), '01733-452XXX');
    });

    test('handles empty string', () {
      expect(BanglaConverter.banToEng(''), '');
    });

    test('handles string with no Bangla digits', () {
      expect(BanglaConverter.banToEng('abc'), 'abc');
    });
  });

  group('engToBan and banToEng round trip', () {
    test('round trip preserves value', () {
      const original = '01onal733-452XXX';
      expect(BanglaConverter.banToEng(BanglaConverter.engToBan(original)), original);
    });
  });

  group('banglaDate', () {
    test('returns null when no parameters given', () {
      expect(BanglaConverter.banglaDate(), null);
    });

    test('returns valid result for isToday', () {
      final result = BanglaConverter.banglaDate(isToday: true);
      expect(result, isNotNull);
      expect(result!.date, isNotNull);
      expect(result.month, isNotNull);
      expect(result.year, isNotNull);
      expect(result.weekDay, isNotNull);
      expect(result.yearDescription, 'বঙ্গাব্দ');
    });

    test('converts specific date with DateTime parameter', () {
      final result = BanglaConverter.banglaDate(
        englishDate: DateTime(2024, 4, 14),
      );
      expect(result, isNotNull);
      expect(result!.month, 'বৈশাখ');
      expect(result.date, '১লা');
    });

    test('converts date before Bangla new year', () {
      final result = BanglaConverter.banglaDate(
        englishDate: DateTime(2024, 1, 15),
      );
      expect(result, isNotNull);
      expect(result!.month, isNotNull);
      expect(result.year, isNotNull);
    });

    test('converts date using day, month, year parameters', () {
      final result = BanglaConverter.banglaDate(
        day: 14,
        month: 4,
        year: 2024,
      );
      expect(result, isNotNull);
      expect(result!.month, 'বৈশাখ');
    });

    test('ordinal suffix is correct for day 1', () {
      final result = BanglaConverter.banglaDate(
        englishDate: DateTime(2024, 4, 14),
      );
      expect(result!.date, contains('লা'));
    });

    test('ordinal suffix is correct for day 2-3', () {
      final result = BanglaConverter.banglaDate(
        englishDate: DateTime(2024, 4, 15),
      );
      expect(result!.date, contains('রা'));
    });

    test('ordinal suffix is correct for day 4+', () {
      final result = BanglaConverter.banglaDate(
        englishDate: DateTime(2024, 4, 20),
      );
      expect(result!.date, contains('শে'));
    });

    test('monthDigit is 1-based', () {
      final result = BanglaConverter.banglaDate(
        englishDate: DateTime(2024, 4, 14),
      );
      expect(result!.monthDigit, '1');
    });
  });

  group('englishDate', () {
    test('converts Bangla date to English date', () {
      final result = BanglaConverter.englishDate(
        banglaDay: 1,
        banglaMonth: 1,
        banglaYear: 1431,
      );
      expect(result, isA<DateTime>());
      expect(result.year, 2024);
      expect(result.month, 4);
      expect(result.day, 14);
    });

    test('throws on invalid day', () {
      expect(
        () => BanglaConverter.englishDate(
          banglaDay: 0,
          banglaMonth: 1,
          banglaYear: 1431,
        ),
        throwsFormatException,
      );
    });

    test('throws on invalid month', () {
      expect(
        () => BanglaConverter.englishDate(
          banglaDay: 1,
          banglaMonth: 13,
          banglaYear: 1431,
        ),
        throwsFormatException,
      );
    });

    test('throws on day > 31', () {
      expect(
        () => BanglaConverter.englishDate(
          banglaDay: 32,
          banglaMonth: 1,
          banglaYear: 1431,
        ),
        throwsFormatException,
      );
    });
  });

  group('BanglaDateReturn', () {
    test('toString returns formatted string', () {
      final model = BanglaDateReturn(
        date: '১লা',
        month: 'বৈশাখ',
        year: '১৪৩১',
        yearDescription: 'বঙ্গাব্দ',
        weekDay: 'রবিবার',
      );
      expect(model.toString(), '১লা বৈশাখ ১৪৩১ বঙ্গাব্দ, রবিবার');
    });

    test('equality works', () {
      final a = BanglaDateReturn(date: '১লা', month: 'বৈশাখ');
      final b = BanglaDateReturn(date: '১লা', month: 'বৈশাখ');
      expect(a, equals(b));
    });

    test('inequality works', () {
      final a = BanglaDateReturn(date: '১লা', month: 'বৈশাখ');
      final b = BanglaDateReturn(date: '২রা', month: 'বৈশাখ');
      expect(a, isNot(equals(b)));
    });
  });
}
