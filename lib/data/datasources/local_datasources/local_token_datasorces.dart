import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_charge/config/pj_const.dart' as consts;
import 'package:get_charge/data/models/User/Token.dart';

abstract class LocalTokenDataSources{
  Future<Token> getTokenInLocalStorage();
  Future<Token> setTokenInLocalStorage(Token token);
}


class LocalTokenDataSourcesTml implements LocalTokenDataSources{
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<Token> getTokenInLocalStorage() async {
    String? storageToken = await storage.read(key: consts.token);

    if(storageToken != null){
      return Token(tokenString: tokenString, lifeTime: lifeTime)!;
    }else{

    }
  }

  @override
  Future<Token> setTokenInLocalStorage(String token) {
    // TODO: implement setTokenInLocalStorage
    throw UnimplementedError();
  }

}

