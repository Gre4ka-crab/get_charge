import 'package:bloc/bloc.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/entities/profile_entity.dart';
import 'package:get_charge/domain/usecases/profile_usecases.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;

  ProfileCubit({required this.getProfile}) : super(ProfileInitial());


  getData() async{

    emit(ProfileLoading());

    var result = await getProfile(NoParams());
    result.fold((error) => emit(ProfileError(error: error)), (result) => emit(ProfileLoaded(profileEntity: result)));
  }
}
