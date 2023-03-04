import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/token_entity.dart';

abstract class TokenRepository{
  Future<Either<Failure, TokenEmpty>> refreshToken({required String login,required String code});
  Future<Either<Failure, TokenEmpty>> getLocalToken();
  void setToken(TokenEmpty token);
}