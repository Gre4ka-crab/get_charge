import 'package:dartz/dartz.dart';
import 'package:eticon_api/eticon_api.dart';

import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/network/network_info.dart';
import 'package:get_charge/data/datasources/local_datasources/local_token_datasorces.dart';
import 'package:get_charge/data/datasources/remote_datasources/remote_token_datasorces.dart';
import 'package:get_charge/domain/entities/token_entity.dart';


import '../../domain/repository/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository{
  final RemoteTokenDataSources remoteTokenDataSources;
  final LocalTokenDataSources localTokenDataSources;
  final NetworkInfo networkInfo;

  TokenRepositoryImpl({
    required this.remoteTokenDataSources,
    required this.localTokenDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TokenEmpty>> getToken({required String login,required String code}) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var response = await remoteTokenDataSources.getToken(login: login, code: code);
        return Right(response);
      } on APIException catch (error) {
        return Left(ServerFailure(error.body));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  void setToken(String token) {
    Api.setToken(token);
  }


}