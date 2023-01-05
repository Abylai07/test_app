import 'package:test_app/src/domain/model/post-model.dart';
import 'api-provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<PostModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
