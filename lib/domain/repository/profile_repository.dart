import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/profile_entity.dart';

abstract class ProfileRepository{
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, void>> deleteProfile();
  Future<Either<Failure, void>> changeEmail(String email);
}