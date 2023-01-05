import 'package:dio/dio.dart';
import 'package:test_app/src/domain/model/post-model.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<PostModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return PostModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return PostModel.withError("Data not found / Connection issue");
    }
  }
}
