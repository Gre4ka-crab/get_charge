import 'package:eticon_api/eticon_api.dart';

abstract class LocalTokenDataSources{
  String? getTokenInLocalStorage();
  void setTokenInLocalStorage(String token);
}


class LocalTokenDataSourcesTml implements LocalTokenDataSources {

  @override
  String? getTokenInLocalStorage() {
    return Api.token;
  }

  @override
  void setTokenInLocalStorage(String token) {
    Api.setToken(token);
  }

}

