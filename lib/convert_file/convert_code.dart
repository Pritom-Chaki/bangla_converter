import '../data/bangla_data.dart';
import '../model/bangla_date_return_model.dart';

///[BanglaConverter]main converter class where all code
class BanglaConverter {
  static const Map<String, String> _engToBanMap = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  static const Map<String, String> _banToEngMap = {
    '০': '0',
    '১': '1',
    '২': '2',
    '৩': '3',
    '৪': '4',
    '৫': '5',
    '৬': '6',
    '৭': '7',
    '৮': '8',
    '৯': '9',
  };

  ///english to bangla [engToBan] converter method
  static String engToBan(dynamic inputValue) {
    return inputValue
        .toString()
        .split('')
        .map((ch) => _engToBanMap[ch] ?? ch)
        .join('');
  }

  ///bangla to english [banToEng] converter method
  static String banToEng(dynamic inputValue) {
    return inputValue
        .toString()
        .split('')
        .map((ch) => _banToEngMap[ch] ?? ch)
        .join('');
  }

  /// Calculates the Bangla month index and day from a day difference
  /// using actual Bangla month lengths.
  static List<int> _banglaMonthAndDay(int dayDifference) {
    int monthIndex = 0;
    int remaining = dayDifference;
    while (monthIndex < 12 && remaining >= BanglaData.banglaMonthDays[monthIndex]) {
      remaining -= BanglaData.banglaMonthDays[monthIndex];
      monthIndex++;
    }
    if (monthIndex >= 12) {
      monthIndex = 11;
      remaining = 0;
    }
    return [monthIndex, remaining + 1];
  }

  ///english date to bangla date [banglaDate] converter method
  static BanglaDateReturn? banglaDate({
    DateTime? englishDate,
    int? day,
    int? month,
    int? year,
    bool isToday = false,
  }) {
    try {
      DateTime date;
      if (isToday) {
        date = DateTime.now();
      } else if (englishDate != null) {
        date = englishDate;
      } else if (day != null && month != null && year != null) {
        date = DateTime(year, month, day);
      } else {
        return null;
      }

      int cDay = date.day;
      int cMonth = date.month;
      int cYear = date.year;

      // Calculate Bangla year
      int banglaYear = cYear - 593;
      if (cMonth < 4 || (cMonth == 4 && cDay < 14)) {
        banglaYear = banglaYear - 1;
      }

      // Calculate Bangla month and day using actual month lengths
      int banglaMonthIndex;
      int banglaDay;

      if ((cMonth == 4 && cDay >= 14) || cMonth > 4) {
        DateTime banglaNewYear = DateTime(cYear, 4, 14);
        int dayDifference = date.difference(banglaNewYear).inDays;
        var result = _banglaMonthAndDay(dayDifference);
        banglaMonthIndex = result[0];
        banglaDay = result[1];
      } else {
        DateTime prevBanglaNewYear = DateTime(cYear - 1, 4, 14);
        int dayDifference = date.difference(prevBanglaNewYear).inDays;
        var result = _banglaMonthAndDay(dayDifference);
        banglaMonthIndex = result[0];
        banglaDay = result[1];
      }

      // Adjust negative month index
      if (banglaMonthIndex < 0) {
        banglaMonthIndex += 12;
      }

      String banglaWeekday = BanglaData.banglaWeekdays[date.weekday % 7];

      // Convert numbers to Bangla digits
      String banglaDayStr = engToBan(banglaDay);
      String banglaYearStr = engToBan(banglaYear);

      // Add ordinal suffix for day
      String ordinalSuffix = 'শে';
      if (banglaDay == 1) {
        ordinalSuffix = 'লা';
      } else if (banglaDay == 2 || banglaDay == 3) {
        ordinalSuffix = 'রা';
      }

      return BanglaDateReturn(
        date: "$banglaDayStr$ordinalSuffix",
        month: BanglaData.banglaMonths[banglaMonthIndex],
        monthDigit: (banglaMonthIndex + 1).toString(),
        weekDay: banglaWeekday,
        weekDayDigit: date.weekday.toString(),
        year: banglaYearStr,
        yearDescription: "বঙ্গাব্দ",
      );
    } catch (e) {
      throw FormatException('Invalid Date components: $e');
    }
  }

  ///bangla date to english date [englishDate] converter method
  static DateTime englishDate({
    required int banglaDay,
    required int banglaMonth,
    required int banglaYear,
  }) {
    // Validate inputs
    if (banglaDay < 1 ||
        banglaDay > 31 ||
        banglaMonth < 1 ||
        banglaMonth > 12) {
      throw FormatException('Invalid Bangla date components');
    }

    // Calculate Gregorian year
    int gregorianYear = banglaYear + 593;

    if (banglaMonth >= 9) {
      gregorianYear += 1;
    }

    // Bangla New Year starts around April 14
    DateTime banglaNewYear = DateTime(gregorianYear, 4, 14);

    // Calculate days since Bangla New Year using actual month lengths
    int daysSinceNewYear = 0;
    for (int i = 0; i < banglaMonth - 1; i++) {
      daysSinceNewYear += BanglaData.banglaMonthDays[i];
    }
    daysSinceNewYear += (banglaDay - 1);

    // Calculate Gregorian date
    DateTime gregorianDate = banglaNewYear.add(
      Duration(days: daysSinceNewYear),
    );

    return gregorianDate;
  }
}
