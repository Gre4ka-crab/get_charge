import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/token_entity.dart';

abstract class TokenRepository{
  Future<Either<Failure, TokenEmpty>> getToken({required String login,required String code});
  void setToken(String token);
}