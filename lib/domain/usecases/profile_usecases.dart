import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/entities/profile_entity.dart';
import 'package:get_charge/domain/repository/profile_repository.dart';

class GetProfile implements UseCase<ProfileEntity, NoParams>{
  ProfileRepository profileRepository;

  GetProfile(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) {
    return profileRepository.getProfile();
  }

}