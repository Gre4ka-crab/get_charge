import 'package:bloc/bloc.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/usecases/authorization_usecases.dart';

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

  Future<void> logIn({required String login,required String code}) async {
    emit(AuthLoading());

    var result = await refreshToken(ParamsRefreshToken(login: login, code: code));
    result.fold((error) => emit(AuthError(message: error.toString())), (result) => emit(AuthLoaded(isLogIn: true)));

  }
}
