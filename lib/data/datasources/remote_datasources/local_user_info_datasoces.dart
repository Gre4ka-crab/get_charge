import 'package:eticon_api/eticon_api.dart';
import 'package:get_charge/data/models/User/User.dart';

abstract class RemoteUserInfoDataSources{
  Future<UserModel>? getUserInfoInLocalStorage();
}


// class RemoteUserInfoDataSourcesTml implements RemoteUserInfoDataSources {
//
//
// }
