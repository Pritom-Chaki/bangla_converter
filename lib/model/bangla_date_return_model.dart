class BanglaDateReturn {
  final String? date;
  final String? month;
  final String? monthDigit;
  final String? year;
  final String? yearDescription;
  final String? weekDay;
  final String? weekDayDigit;

  BanglaDateReturn({
    this.date,
    this.month,
    this.monthDigit,
    this.year,
    this.yearDescription,
    this.weekDay,
    this.weekDayDigit,
  });

  @override
  String toString() {
    return '$date $month $year ${yearDescription ?? ''}, ${weekDay ?? ''}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BanglaDateReturn &&
        other.date == date &&
        other.month == month &&
        other.monthDigit == monthDigit &&
        other.year == year &&
        other.yearDescription == yearDescription &&
        other.weekDay == weekDay &&
        other.weekDayDigit == weekDayDigit;
  }

  @override
  int get hashCode {
    return Object.hash(
      date,
      month,
      monthDigit,
      year,
      yearDescription,
      weekDay,
      weekDayDigit,
    );
  }
}
