import 'package:my_credit_loans/enum/time_period.dart';

class MonthlyRateService {
  ///method that computes monthly rate
  ///[moneyAmount] the amount of money to borrow
  ///[timePeriod] the value from the enum according to the loan
  static double computeMonthlyRate(int moneyAmount, TimePeriod timePeriod) {
    return moneyAmount / timePeriod.numberOfMonths * 1 / 100;
  }
}
