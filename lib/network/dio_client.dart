import 'package:dio/dio.dart';
import 'package:my_credit_loans/api/random_api.dart';

class DioClient {
  static DioClient? _singleton;
  Dio? _dioClient;

  factory DioClient() {
    if (_singleton == null) {
      _singleton = DioClient.__internal();
      return _singleton!;
    }
    return _singleton!;
  }

  DioClient.__internal() {
    final BaseOptions baseOptions = BaseOptions(
        baseUrl: RandomApi.RANDOM_API,
        validateStatus: (status) {
          return status! < 500;
        });
    _dioClient = Dio(baseOptions);
  }

  get client => _dioClient;

  void dispose() {
    _dioClient!.close();
  }
}
