import 'package:eticon_api/eticon_api.dart';
import 'package:get_charge/config/constant_config.dart';
import 'package:get_charge/data/models/User/token_model.dart';

abstract class RemoteTokenDataSources {
  /// Calls the [baseUrl]/connect/token endpoint
  ///
  /// Throws a [APIException] for all error codes.
  Future<TokenModel> getToken({required String login, required String code});
}

class RemoteTokenDataSourcesImpl implements RemoteTokenDataSources {
  @override
  Future<TokenModel> getToken({required String login, required String code}) async {
    try {
      Response response = await Api.post('connect/token', testMode: ConstantConfig.testMode, body: {
        'client_id': 'News_Service',
        'client_secret': 'News_Service_Secret',
        'grant_type': 'password',
        'username': login,
        'password': code,
      });

      return TokenModel.fromJson(response.data);
    } on APIException {
      rethrow;
    }
  }
}
