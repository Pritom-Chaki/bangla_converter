/// import [bangla_data] class
import 'package:flutter/material.dart';

import '../data/bangla_data.dart';

/// import [bangla_date_return_model] class
import '../model/bangla_date_return_model.dart';

///[BanglaConverter]main converter class where all code
class BanglaConverter {
  ///english to bangla [engToBan] converter method
  static String engToBan(inputValue) {
    //convert to string and make a list
    var strList = inputValue.toString().split('');
    //declare a list variable
    List<String> returnList = [];
    //loop on the list
    for (var str in strList) {
      //switch case to convert number and add to the list
      switch (str) {
        case "0":
          returnList.add("০");
          break;
        case "1":
          returnList.add("১");
          break;
        case "2":
          returnList.add("২");
          break;
        case "3":
          returnList.add("৩");
          break;
        case "4":
          returnList.add("৪");
          break;
        case "5":
          returnList.add("৫");
          break;
        case "6":
          returnList.add("৬");
          break;

        case "7":
          returnList.add("৭");
          break;
        case "8":
          returnList.add("৮");
          break;
        case "9":
          returnList.add("৯");
          break;
        default:
          returnList.add(str);
          break;
      }
    }
    //return all join list
    return returnList.join("");
  }

  ///bangla to english [banToEng] converter method
  static String banToEng(inputValue) {
    //convert to string and make a list
    var strList = inputValue.toString().split('');
    //declare a list variable
    List<String> returnList = [];
    //loop on the list
    for (var str in strList) {
      //switch case to convert number and add to the list
      switch (str) {
        case "০":
          returnList.add("0");
          break;
        case "১":
          returnList.add("1");
          break;
        case "২":
          returnList.add("2");
          break;
        case "৩":
          returnList.add("3");
          break;
        case "৪":
          returnList.add("4");
          break;
        case "৫":
          returnList.add("5");
          break;
        case "৬":
          returnList.add("6");
          break;

        case "৭":
          returnList.add("7");
          break;
        case "৮":
          returnList.add("8");
          break;
        case "৯":
          returnList.add("9");
          break;
        default:
          returnList.add(str);
          break;
      }
    }
    //return all join list
    return returnList.join("");
  }

  ///english date to bangla date [banglaDate] converter method
  static BanglaDateReturn? banglaDate({
    DateTime? englishDate,
    day,
    month,
    year,
    bool isToday = false,
  }) {
    try {
      // Parse the input date (format: DD-MM-YYYY)
      DateTime? date = DateTime.now();
      int cDay = date.day;
      int cMonth = date.month;
      int cYear = date.year;
      if (!isToday) {
        // Create a DateTime object
        if (englishDate == null) {
          cDay = int.parse(day.toString());
          cMonth = int.parse(month.toString());
          cYear = int.parse(year.toString());
          date = DateTime(cYear, cMonth, cDay);
        } else {
          date = englishDate;
          cDay = date.day;
          cMonth = date.month;
          cYear = date.year;
        }
      }
      if (date == null) {
        return null;
      }

      // Calculate Bangla year
      int banglaYear =
          cYear - 593; // Approximate adjustment (593 or 594 based on date)
      if (cMonth < 4 || (cMonth == 4 && cDay < 14)) {
        banglaYear = banglaYear - 1; // Adjust for Bangla new year (mid-April)
      }

      // Approximate Bangla month based on Gregorian date
      // Bangla new year starts around April 14
      int banglaMonthIndex;
      int banglaDay;

      if (cMonth == 4 && cDay >= 14 || cMonth > 4) {
        // After April 14, map to Bangla months
        DateTime banglaNewYear = DateTime(cYear, 4, 14);
        int dayDifference = date.difference(banglaNewYear).inDays;
        banglaMonthIndex = (dayDifference ~/ 30) % 12;
        banglaDay = (dayDifference % 30) + 1;
      } else {
        // Before April 14, belongs to previous Bangla year
        DateTime prevBanglaNewYear = DateTime(cYear - 1, 4, 14);
        int dayDifference = date.difference(prevBanglaNewYear).inDays;
        banglaMonthIndex = (dayDifference ~/ 30) % 12;
        banglaDay = (dayDifference % 30) + 1;
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

      // Construct the Bangla date string
      return BanglaDateReturn(
        date: "$banglaDayStr$ordinalSuffix",
        month: BanglaData.banglaMonths[banglaMonthIndex],
        monthDigit: banglaMonthIndex.toString(),
        weekDay: banglaWeekday,
        weekDayDigit: date.weekday.toString(),
        year: banglaYearStr,
        yearDescription: "বঙ্গাব্দ",
      );
    } catch ($e) {
      throw FormatException('Invalid Date components');
      return null;
    }
  }

  ///bangla date to english  date[englishDate] converter method
  static DateTime englishDate({banglaDay, banglaMonth, banglaYear}) {
    int banglaCDay = int.parse(banglaDay.toString());
    int banglaCMonth = int.parse(banglaMonth.toString());
    int banglaCYear = int.parse(banglaYear.toString());
    // Validate inputs
    if (banglaCDay < 1 ||
        banglaCDay > 31 ||
        banglaCMonth < 1 ||
        banglaCMonth > 12) {
      throw FormatException('Invalid Bangla date components');
    }

    // Calculate Gregorian year
    int gregorianYear = banglaCYear + 593;

    if (banglaCMonth >= 9) {
      // After Poush (mid-December), may belong to next Gregorian year
      gregorianYear += 1;
    }

    // Bangla New Year starts around April 14
    DateTime banglaNewYear = DateTime(gregorianYear, 4, 14);

    // Calculate days since Bangla New Year
    // Assume approximately 30 days per month for simplicity
    int daysSinceNewYear = ((banglaCMonth - 1) * 30) + (banglaCDay - 1);

    // Calculate Gregorian date
    DateTime gregorianDate = banglaNewYear.add(
      Duration(days: daysSinceNewYear),
    );

    // Format the Gregorian date as YYYY-MM-DD
    String year = gregorianDate.year.toString();
    String month = gregorianDate.month.toString().padLeft(2, '0');
    String day = gregorianDate.day.toString().padLeft(2, '0');

    return DateTime(int.parse(year), int.parse(month), int.parse(day));
  }
}
