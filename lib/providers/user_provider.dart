import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_credit_loans/api/random_api.dart';
import 'package:my_credit_loans/enum/time_period.dart';
import 'package:my_credit_loans/models/user_model.dart';
import 'package:my_credit_loans/network/dio_client.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUserData;

  void storeUserProvider(UserModel userModel) {
    _currentUserData = userModel;
    notifyListeners();
  }

  Future<int> checkEligibility(BuildContext context) async {
    DioClient dioClient = new DioClient();
    Dio dio = dioClient.client;
    try {
      Response response = await dio.get(RandomApi.RANDOM_API);
      if (response.statusCode == 200) {
        int randomValue = response.data[0];
        return randomValue;
      }
      return 0;
    } on DioError catch (ex) {
      print('Error: ${ex.message}');
      return 0;
    }
  }

  void storePartialData(int _moneyAmount, TimePeriod _timePeriod) {
    if (_currentUserData == null) {
      _currentUserData = new UserModel(
          moneyAmount: _moneyAmount,
          periodOfTime: _timePeriod,
          monthlyIncome: 0,
          firstName: '',
          lastName: '',
          isEmployeed: false);
    } else {
      _currentUserData!.moneyAmount = _moneyAmount;
      _currentUserData!.periodOfTime = _timePeriod;
    }
    notifyListeners();
  }

  UserModel get currentUser {
    return _currentUserData!;
  }
}
