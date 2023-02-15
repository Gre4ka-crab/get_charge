import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/repository/token_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TokenRepository tokenRepository;

  AuthCubit(this.tokenRepository) : super(AuthInitial());

  Future<void> logIn(login, code) async{
    emit(AuthLading());

    try{
      await tokenRepository.getToken(login: login, code: code);
    }on Failure catch(error){
      debugPrint(error.toString());
    }

    emit(AuthLoaded());
  }
}
