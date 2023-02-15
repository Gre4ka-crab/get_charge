import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/token_entity.dart';
import 'package:get_charge/domain/repository/token_repository.dart';

import '../../core/usecase/usecase.dart';

class RefreshToken implements UseCase<TokenEmpty, ParamsRefreshToken> {
  TokenRepository tokenRepository;

  RefreshToken({required this.tokenRepository});

  @override
  Future<Either<Failure, TokenEmpty>> call(ParamsRefreshToken params) async {
    Either<Failure, TokenEmpty> result = await tokenRepository.getToken(login: params.login, code: params.code);

    result.fold((l) => null, (r) => tokenRepository.setToken(r.accessToken));

    return result;
  }
}

class ParamsRefreshToken extends Equatable {
  final String login;
  final String code;

  const ParamsRefreshToken({required this.login, required this.code});

  @override
  List<Object> get props => [login, code];

  @override
  String toString() {
    return 'ParamsLogIn{category: $login, category: $code}';
  }
}


