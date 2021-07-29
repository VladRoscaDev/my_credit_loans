enum TimePeriod { ONE_MONTH, THREE_MONTHS, SIX_MONTHS, ONE_YEAR }

extension TimePeriodExtension on TimePeriod {
  String get name {
    switch (this) {
      case TimePeriod.ONE_MONTH:
        return '1 luna';
      case TimePeriod.THREE_MONTHS:
        return '3 luni';
      case TimePeriod.SIX_MONTHS:
        return '6 luni';
      case TimePeriod.ONE_YEAR:
        return '1 year';
      default:
        return '';
    }
  }

  int get numberOfMonths {
    switch (this) {
      case TimePeriod.ONE_MONTH:
        return 1;
      case TimePeriod.THREE_MONTHS:
        return 3;
      case TimePeriod.SIX_MONTHS:
        return 6;
      case TimePeriod.ONE_YEAR:
        return 12;
    }
  }

  List<String> get allNames {
    List<String> allNames = [];
    TimePeriod.values.forEach((element) {
      allNames.add(element.name);
    });
    return allNames;
  }
}
