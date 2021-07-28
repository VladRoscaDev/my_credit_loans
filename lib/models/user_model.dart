class UserModel {
  int moneyAmount;
  int periodOfTime;
  double monthlyRate;
  String firstName;
  String lastName;
  bool isEmployeed;
  String? currentJob;
  double monthlyIncome;

  UserModel(
      {required this.moneyAmount,
      required this.periodOfTime,
      required this.monthlyIncome,
      required this.firstName,
      required this.lastName,
      required this.isEmployeed,
      this.currentJob,
      required this.monthlyRate});

      
}
