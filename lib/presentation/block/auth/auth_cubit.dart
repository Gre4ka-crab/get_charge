import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/usecases/authorization_usecases.dart';
import 'package:get_charge/presentation/block/profile/profile_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetToken getToken;
  final RefreshToken refreshToken;

  AuthCubit({required this.getToken, required this.refreshToken}) : super(AuthInitial());

  Future<void> logInCheck() async {
    emit(AuthLoading());

    var result = await getToken(NoParams());
    result.fold((error) => emit(AuthLoaded(isLogIn: false)), (result) => emit(AuthLoaded(isLogIn: true)));
  }

  Future<void> logIn(BuildContext context, {required String login,required String code}) async {
    emit(AuthLoading());

    var result = await refreshToken(ParamsRefreshToken(login: login, code: code));
    result.fold((error) => emit(AuthError(message: error.toString())), (result) {
      context.read<ProfileCubit>().emit(ProfileInitial());
      emit(AuthLoaded(isLogIn: true));
    });

  }
}
