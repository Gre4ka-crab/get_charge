import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/entities/profile_entity.dart';
import 'package:get_charge/domain/usecases/profile_usecases.dart';
import 'package:get_charge/presentation/block/auth/auth_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfileUseCase;
  final LogOut logOutUseCase;
  final RemoveAccount removeAccountUseCase;
  final ChangeEmail changeEmailUseCase;
  ProfileEntity? data;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.logOutUseCase,
    required this.changeEmailUseCase,
    required this.removeAccountUseCase,
  }) : super(ProfileInitial());

  logOut(BuildContext context) async {
    emit(ProfileLoading());

    var result = await logOutUseCase(NoParams());
    result.fold((error) => emit(ProfileError(error: error)), (result) async {
      emit(ProfileExit());
      await context.read<AuthCubit>().logInCheck();
    });
  }

  removeAccount(BuildContext context) async {
    emit(ProfileLoading());

    var result = await removeAccountUseCase(NoParams());
    result.fold((error) => emit(ProfileError(error: error)), (result) async {
      emit(ProfileExit());
      await context.read<AuthCubit>().logInCheck();
    });
  }

  changeEmail(String email) async {
    emit(ProfileLoading());

    var result = await changeEmailUseCase(ParamsChangeEmail(email: email));
    if (data == null) await getData();
    result.fold((error) => emit(ProfileError(error: error)), (result) {
      if (data == null) {
        emit(ProfileExit());
      } else {
        data = ProfileEntity(email: email, hours: data?.hours, id: data?.id, phone: data?.phone);
        emit(ProfileLoaded(profileEntity: data!));
      }
    });
  }

  getData() async {
    emit(ProfileLoading());

    var result = await getProfileUseCase(NoParams());
    result.fold(
      (error) => emit(ProfileError(error: error)),
      (result) {
        data = result;
        emit(ProfileLoaded(profileEntity: result));
      },
    );
  }
}
