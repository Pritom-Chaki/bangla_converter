///[BanglaData] BanglaData for Convert
class BanglaData {
  // Bangla months
  static const List<String> banglaMonths = [
    'বৈশাখ',
    'জ্যৈষ্ঠ',
    'আষাঢ়',
    'শ্রাবণ',
    'ভাদ্র',
    'আশ্বিন',
    'কার্তিক',
    'অগ্রহায়ণ',
    'পৌষ',
    'মাঘ',
    'ফাল্গুন',
    'চৈত্র',
  ];

  // Bangla weekdays
  static const List<String> banglaWeekdays = [
    'রবিবার',
    'সোমবার',
    'মঙ্গলবার',
    'বুধবার',
    'বৃহস্পতিবার',
    'শুক্রবার',
    'শনিবার',
  ];

  // Days in each Bangla month (non-leap year)
  // Months 1-5 (Boishakh to Bhadro): 31 days
  // Months 6-11 (Ashwin to Falgun): 30 days
  // Month 12 (Choitro): 30 days (31 in leap year)
  static const List<int> banglaMonthDays = [
    31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30, 30,
  ];
}
