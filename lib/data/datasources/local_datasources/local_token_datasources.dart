import 'package:get_charge/core/api/api.dart';
import 'package:get_charge/core/api/token_storage_model.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/data/models/User/token_model.dart';

abstract class LocalTokenDataSources {
  Future<TokenModel> getTokenInLocalStorage();

  Future<void> setTokenInLocalStorage(TokenStorageModel? token);
}

class LocalTokenDataSourcesImpl implements LocalTokenDataSources {

  @override
  Future<TokenModel> getTokenInLocalStorage() async {
    if (Api.token != null) {
      return TokenModel(
        token: Api.token?.token ?? '',
        tokenExpireDateTime: Api.token?.tokenExpireDateTime,
        refreshToken: Api.token?.refreshToken ?? '',
      );
    } else {
      throw CacheFailure('Local storage does not store the token');
    }
  }

  @override
  Future<void> setTokenInLocalStorage(TokenStorageModel? token) async {
    await Api.writeLocalStorageToken(token);
  }
}
