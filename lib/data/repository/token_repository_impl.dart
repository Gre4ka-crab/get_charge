import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_charge/core/api/token_storage_model.dart';

import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/network/network_info.dart';
import 'package:get_charge/data/datasources/local_datasources/local_token_datasources.dart';
import 'package:get_charge/data/datasources/remote_datasources/remote_token_datasources.dart';
import 'package:get_charge/domain/entities/token_entity.dart';

import '../../domain/repository/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  final RemoteTokenDataSources remoteTokenDataSources;
  final LocalTokenDataSources localTokenDataSources;
  final NetworkInfo networkInfo;

  TokenRepositoryImpl({
    required this.remoteTokenDataSources,
    required this.localTokenDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TokenEmpty>> refreshToken({required String login, required String code}) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var response = await remoteTokenDataSources.getToken(login: login, code: code);
        return Right(response);
      } on DioError catch (error) {
        return Left(ServerFailure(error.message.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, TokenEmpty>> getLocalToken() async {
    try {
      return Right(await localTokenDataSources.getTokenInLocalStorage());
    } on CacheFailure catch (error) {
      return Left(error);
    }
  }

  @override
  void setToken(TokenEmpty token) {
    localTokenDataSources.setTokenInLocalStorage(TokenStorageModel(
      token: token.token,
      tokenExpireDateTime: token.tokenExpireDateTime,
      refreshToken: token.refreshToken,
    ));
  }
}
