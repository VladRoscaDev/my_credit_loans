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
}
