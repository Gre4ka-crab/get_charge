import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/entities/profile_entity.dart';
import 'package:get_charge/domain/repository/profile_repository.dart';
import 'package:get_charge/domain/repository/token_repository.dart';

class GetProfile implements UseCase<ProfileEntity, NoParams>{
  ProfileRepository profileRepository;

  GetProfile(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) {
    return profileRepository.getProfile();
  }

}

class LogOut implements UseCase<void, NoParams>{
  TokenRepository tokenRepository;

  LogOut(this.tokenRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    tokenRepository.setToken(null);
    return const Right(null);
  }
}

class RemoveAccount implements UseCase<void, NoParams>{
  ProfileRepository profileRepository;

  RemoveAccount(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await profileRepository.deleteProfile();
  }
}

class ChangeEmail implements UseCase<void, ParamsChangeEmail>{
  ProfileRepository profileRepository;

  ChangeEmail(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(ParamsChangeEmail params) async {
    return await profileRepository.changeEmail(params.email);
  }
}

class ParamsChangeEmail{
  final String email;

  ParamsChangeEmail({required this.email});
}