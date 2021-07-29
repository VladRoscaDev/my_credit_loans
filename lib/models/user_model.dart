import 'package:my_credit_loans/enum/time_period.dart';

class UserModel {
  int moneyAmount;
  TimePeriod periodOfTime;
  String firstName;
  String lastName;
  bool isEmployeed;
  String? currentJob;
  double monthlyIncome;
  bool isEligible;

  UserModel(
      {required this.moneyAmount,
      required this.periodOfTime,
      required this.monthlyIncome,
      required this.firstName,
      required this.lastName,
      required this.isEmployeed,
      this.currentJob,
      this.isEligible = false});
}
